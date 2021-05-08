//
//  AnimeListViewController.swift
//  My Anime
//
//  Created by Edward de los Santos on 5/2/21.
//

import UIKit

class AnimelistViewController: UITableViewController {
    var animelist: Animelist!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        title = animelist.name

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animelist.items.count
      }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Animelistitem", for: indexPath)
        let item = animelist.items[indexPath.row]
        
        configureText(for: cell, with: item)
        
        return cell
      }
    
    func configureText(for cell: UITableViewCell, with item: AnimelistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.title
      }
    
    
    

}
