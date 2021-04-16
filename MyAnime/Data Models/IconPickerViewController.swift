//
//  IconPickerViewController.swift
//  Checklists
//
//  Created by Edward de los Santos on 3/29/21.
//

import UIKit

protocol IconPickerViewControllerDelegate: class {
  func iconPicker(_ picker: IconPickerViewController, didPick iconName: String)
}

class IconPickerViewController: UITableViewController {
  let icons = ["No Icon", "Appointments", "Birthdays", "Chores","Drinks", "Folder", "Groceries", "Inbox", "Photos", "Trips"]
  weak var delegate: IconPickerViewControllerDelegate?
  
  // MARK: - Table View Delegates
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return icons.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "IconCell", for: indexPath)
    let iconName = icons[indexPath.row]
    cell.textLabel!.text = iconName
    cell.textLabel!.text = iconName
    cell.imageView!.image = UIImage(named: iconName)
    return cell
  }
}
