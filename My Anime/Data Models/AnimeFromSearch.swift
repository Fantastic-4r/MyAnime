//
//  Anime.swift
//  My Anime
//
//  Created by Fnu Tsering on 4/22/21.
//

import UIKit

//Anime object which will gets its data from JSON data returned through API calls to the search endpoint and the top endpoint 
struct AnimeFromSearch: Decodable{
    let mal_id: Int
    let image_url: String
    let title: String
    let synopsis: String
    let episodes: Int?

}
