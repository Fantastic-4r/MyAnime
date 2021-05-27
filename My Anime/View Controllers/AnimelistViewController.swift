//
//  AnimeListViewController.swift
//  My Anime
//
//  Created by Edward de los Santos on 5/2/21.
//

import UIKit

class AnimelistViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    
    @IBOutlet var tableView: UITableView!
    
    
    var animelist: Animelist!
    var topAnime: Animelist!
       
   override func viewDidLoad() {
       super.viewDidLoad()
       navigationItem.largeTitleDisplayMode = .never
       title = animelist.name
     //  assignArray()

       // Do any additional setup after loading the view.
   }
   
   
   
   override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       tableView.reloadData()
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return animelist.items.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "AnimelistItemCell", for: indexPath) as! AnimelistItemCell
       
       let item = animelist.items[indexPath.row]
    let imgUrlString = item.image_url
    let imgUrl = URL(string: imgUrlString)!
    
    cell.animeImage.af.setImage(withURL: imgUrl)
    cell.animeLabel.text = item.title
       

       return cell
   }
   
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       animelist.items.remove(at: indexPath.row)
       let indexPaths = [indexPath]
       tableView.deleteRows(at: indexPaths, with: .automatic)
   }
   /*
   func configureCell(for cell: UITableViewCell, with item: AnimelistItem) {
     let label = cell.viewWithTag(1000) as! UILabel
       let image = cell.viewWithTag(1003) as! UIImageView
     label.text = item.title
       let imgURL = URL(string: item.image_url)
       image.af.setImage(withURL: imgURL!)
   }
   
   func assignArray() {
       let otherVC = TopAnimeTableViewCell()
       topAnime = otherVC.animelist
   }*/
   

       /*
       // MARK: - Navigation
       // In a storyboard-based application, you will often want to do a little preparation before navigation
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // Get the new view controller using segue.destination.
           // Pass the selected object to the new view controller.
       }
       */
       

   }
