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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
