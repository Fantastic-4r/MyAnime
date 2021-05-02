//
//  AnimeListItem.swift
//  My Anime
//
//  Created by Edward de los Santos on 5/2/21.
//

import Foundation

struct AnimelistItem: Codable {
    let mal_id: Int
    let rank: Int
    let title: String
    let image_url: String
    let episodes: Int?
    var checked = false
}
