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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
