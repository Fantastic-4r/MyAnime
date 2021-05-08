//
//  TopAnimeTableViewCell.swift
//  My Anime
//
//  Created by Fnu Tsering on 4/22/21.
//

import UIKit

class TopAnimeTableViewCell: UITableViewCell {

    weak var viewController: UIViewController?
    var animeID: Int = 0
    var anime: AnimelistItem!
    var animelist: Animelist!
    
    @IBOutlet weak var TopImage: UIImageView!
    @IBOutlet weak var TopAnimeTitle: UILabel!
    
    @IBOutlet var favButton: UIButton!
    @IBOutlet var listButton: UIButton!
    
    @IBAction func favAnime(_ sender: Any) {
        
    }
    
    @IBAction func addAnime(_ sender: Any) {
        // 1
        let optionMenu = UIAlertController(title: nil, message: "Choose A List To Add Anime To", preferredStyle: .actionSheet)
                
        // 2
        let watchingAction = UIAlertAction(title: "Watching", style: .default) { [self] UIAlertAction in
            print(self.animeID) //prints anime id
        }
        let toWatchAction = UIAlertAction(title: "To Watch", style: .default) { UIAlertAction in
            print(self.animeID) //prints anime id
        }
        let watchedAction = UIAlertAction(title: "Watched", style: .default) { UIAlertAction in
            print(self.animeID) //prints anime id
        }
                
        // 3
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                
        // 4
        optionMenu.addAction(watchingAction)
        optionMenu.addAction(toWatchAction)
        optionMenu.addAction(watchedAction)
        optionMenu.addAction(cancelAction)
                
        // 5
        viewController?.present(optionMenu, animated: true, completion: nil)
    }
    
    var favorited:Bool = false
    func setFavorite(_ isFavorited:Bool) {
        favorited = isFavorited
        if (favorited) {
            favButton.setImage(UIImage(named:"favor-icon-filled"), for: UIControl.State.normal )
        }
        else {
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal )
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
