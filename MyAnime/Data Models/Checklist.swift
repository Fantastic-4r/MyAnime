//
//  Checklist.swift
//  Checklists
//
//  Created by Edward de los Santos on 3/11/21.
//

import UIKit


class Checklist: NSObject, Codable {
  var name = ""
  var iconName = "No Icon"
  var items = [ChecklistItem]()
  var lists = [Checklist]()
  
  init(name: String) {
    self.name = name
    super.init()
  }
  
  func countUncheckedItems() -> Int {
    return items.reduce(0) {
      cnt, item in cnt + (item.checked ? 0 : 1)
    }
  }
}
