//
//  AnimelistItemCell.swift
//  My Anime
//
//  Created by Fnu Tsering on 5/15/21.
//

import UIKit

class AnimelistItemCell: UITableViewCell {
    
    

    @IBOutlet weak var animeImage: UIImageView!
    
    @IBOutlet weak var animeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
