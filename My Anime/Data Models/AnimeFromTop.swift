//
//  Favorites.swift
//  My Anime
//
//  Created by Fnu Tsering on 4/22/21.
//

import UIKit

//since we have few different lists of anime, lets create a class
class AnimeFromTop: NSObject, Decodable {
    let mal_id: Int
    let rank: Int
    let title: String
    let image_url: String
    let episodes: Int?
}
