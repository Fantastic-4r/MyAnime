//
//  TopAnimes.swift
//  My Anime
//
//  Created by Fnu Tsering on 4/22/21.
//

import UIKit

struct TopAnimes: Decodable {
   let top: [AnimeFromTop] //top is the key for the array of top animes in the JSON format
}