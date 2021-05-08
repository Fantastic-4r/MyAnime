//
//  TopAnimeTableViewCell.swift
//  My Anime
//
//  Created by Fnu Tsering on 4/22/21.
//

import UIKit

class TopAnimeTableViewCell: UITableViewCell {
    
    weak var viewController: UIViewController?
    var animeId: Int = 0
    var animelist: Animelist!
    
    @IBOutlet weak var TopImage: UIImageView!
    @IBOutlet weak var TopAnimeTitle: UILabel!
    
    @IBOutlet var favButton: UIButton!
    @IBOutlet var listButton: UIButton!
    
    @IBAction func favAnime(_ sender: Any) {
        
    }
    
    @IBAction func addAnime(_ sender: Any) {
        // 1
        let optionMenu = UIAlertController(title: nil, message: "Select A List", preferredStyle: .actionSheet)
                
        // 2
        let watchingAction = UIAlertAction(title: "Watching", style: .default) { UIAlertAction in
            //animelist.items.append(AnimelistItem(mal_id: animeId))
            print(self.animeId)
        }
        let toWatchAction = UIAlertAction(title: "To Watch", style: .default) { UIAlertAction in
            //animelist.items.append(AnimelistItem(mal_id: animeId))
            print(self.animeId)
        }
        let watcehdAction = UIAlertAction(title: "Watched", style: .default) { UIAlertAction in
            //animelist.items.append(AnimelistItem(mal_id: animeId))
            print(self.animeId)
        }
                
        // 3
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                
        // 4
        optionMenu.addAction(watchingAction)
        optionMenu.addAction(toWatchAction)
        optionMenu.addAction(watcehdAction)
        optionMenu.addAction(cancelAction)
                
        // 5
        viewController?.present(optionMenu, animated: true, completion: nil)
    }
        
    
    
    var favorited:Bool = false
    func setFavorite(_ isFavorited:Bool) {
        
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
