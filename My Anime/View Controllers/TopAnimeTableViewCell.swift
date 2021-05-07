//
//  TopAnimeTableViewCell.swift
//  My Anime
//
//  Created by Fnu Tsering on 4/22/21.
//

import UIKit

class TopAnimeTableViewCell: UITableViewCell {

    @IBOutlet weak var TopImage: UIImageView!
    @IBOutlet weak var TopAnimeTitle: UILabel!
    
    @IBOutlet var favButton: UIButton!
    @IBOutlet var listButton: UIButton!
    
    @IBAction func favAnime(_ sender: Any) {
        
    }
    
    @IBAction func addAnime(_ sender: Any) {
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
