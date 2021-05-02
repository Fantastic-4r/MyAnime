//
//  AnimeList.swift
//  My Anime
//
//  Created by Edward de los Santos on 5/2/21.
//

import Foundation

class AnimeList: NSObject, Codable {
    var name = ""
    var items = [AnimeListItem]()
    
    init(name: String) {
      self.name = name
      super.init()
    }
    
    //check how many animes have been checked off
    func countUncheckedItems() -> Int {
      return items.reduce(0) {
        cnt, item in cnt + (item.checked ? 0 : 1)
      }
    }
}
