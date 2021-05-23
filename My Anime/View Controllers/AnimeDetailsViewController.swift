//
//  AnimeDetailsViewController.swift
//  My Anime
//
//  Created by Edward de los Santos on 5/19/21.
//

import UIKit

class AnimeDetailsViewController: UIViewController {

    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var episodesLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var backdropView: UIImageView!
    
    var animeItem: AnimeFromTop!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        // Do any additional setup after loading the view.
    }
    
    func setupLayout() {
        synopsisLabel.text = animeItem.synopsis
        if animeItem.episodes == 0 {
            episodesLabel.text = "Null"
        } else {
            episodesLabel.text = "\(animeItem.episodes ?? 0)"
        }
        titleLabel.text = animeItem.title
        let imgUrlString = animeItem.image_url //image url in string
        let imgURL = URL(string: imgUrlString)!
        posterView.af.setImage(withURL: imgURL)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
