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
    
    internal init(mal_id: Int, rank: Int, title: String, image_url: String, episodes: Int?, checked: Bool) {
        self.mal_id = mal_id
        self.rank = rank
        self.title = title
        self.image_url = image_url
        self.episodes = episodes
        self.checked = checked
    }
}
