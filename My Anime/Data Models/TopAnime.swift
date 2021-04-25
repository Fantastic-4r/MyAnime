//
//  TopAnime.swift
//  My Anime
//
//  Created by Fnu Tsering on 4/25/21.
//

import UIKit

//since we have few different lists of anime, lets create a class
struct TopAnime: Decodable {
   let mal_id: Int
   let rank: Int
   let title: String
   let image_url: String
   let episodes: Int?
}
