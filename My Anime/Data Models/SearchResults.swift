//
//  SearchResults.swift
//  My Anime
//
//  Created by Fnu Tsering on 4/22/21.
//

import UIKit

struct SearchResults: Decodable {
    let results : [AnimeFromSearch] //results is the JSON key from endpoint search that is the array of objects that includes the keys-values in the Anime object
}
