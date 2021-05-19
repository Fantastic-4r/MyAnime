//
//  SearchCell.swift
//  My Anime
//
//  Created by Fnu Tsering on 4/27/21.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet weak var searchImage: UIImageView!
    
    @IBOutlet weak var searchAnimeTitle: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    weak var viewController: UIViewController?
    var animeId: Int = 0
    var animelist: Animelist!
    var item: AnimelistItem!
    
  

    @IBAction func onAdd(_ sender: Any) {
        // 1
        let optionMenu = UIAlertController(title: nil, message: "Select A List", preferredStyle: .actionSheet)
                
        // 2
        let watchingAction = UIAlertAction(title: "Watching", style: .default) { UIAlertAction in
            NotificationCenter.default.post(name: Notification.Name("addItem"), object: ["item": self.item!, "index": 0])
        }
        let toWatchAction = UIAlertAction(title: "To Watch", style: .default) { UIAlertAction in
            NotificationCenter.default.post(name: Notification.Name("addItem"), object: ["item": self.item!, "index": 1])
        }
        let watchedAction = UIAlertAction(title: "Watched", style: .default) { UIAlertAction in
            NotificationCenter.default.post(name: Notification.Name("addItem"), object: ["item": self.item!, "index": 2])
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
    
    @IBAction func onFavorite(_ sender: Any) {
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
