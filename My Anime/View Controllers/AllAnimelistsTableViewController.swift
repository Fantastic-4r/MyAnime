//
//  AllAnimeListsTableViewController.swift
//  My Anime
//
//  Created by Edward de los Santos on 5/2/21.
//

import UIKit

class AllAnimelistsTableViewController: UITableViewController {

    var dataModel: DataModel!
    
    var observer: NSObjectProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        observer = NotificationCenter.default.addObserver(
            forName: Notification.Name("addItem"),
            object: nil,
            queue: .main,
            using:
                { notification in
                    guard let object = notification.object as? [String: Any] else {
                        return
                    }
                    
                    guard let item = object["item"] else {
                        return
                    }
                    
                    guard let index = object["index"] else {
                        return
                    }
                    
                    self.dataModel.lists[index as! Int].items.append(item as! AnimelistItem)
                })

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.lists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimeListCell", for: indexPath)

        let label = cell.viewWithTag(1000) as! UILabel
        let animeList = dataModel.lists[indexPath.row]
        label.text = animeList.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let animelist = dataModel.lists[indexPath.row]
        dataModel.indexOfSelectedChecklist = indexPath.row
        performSegue(withIdentifier: "ShowAnimelist", sender: animelist)
    }
    
    // MARK: - List Detail View Controller Delegates
//    func addAnimeItem(index: Int, animelist: AnimelistItem) {
//        dataModel.lists[index].items.append(animelist)
//        //        dataModel.lists[index].items.sortChecklists()
//        tableView.reloadData()
//    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAnimelist" {
            let controller = segue.destination as! AnimelistViewController
            controller.animelist = sender as? Animelist
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
