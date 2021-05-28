//
//  AnimeListItem.swift
//  My Anime
//
//  Created by Edward de los Santos on 5/2/21.
//

import Foundation

struct AnimelistItem: Codable {
    let mal_id: Int
    let image_url: String
    let title: String
    let synopsis: String?
    let episodes : Int?
    //var checked = false
}
