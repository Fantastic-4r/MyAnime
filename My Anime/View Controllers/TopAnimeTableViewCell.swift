//
//  TopAnimeTableViewCell.swift
//  My Anime
//
//  Created by Fnu Tsering on 4/22/21.
//

import UIKit

class TopAnimeTableViewCell: UITableViewCell {
    
    weak var viewController: UIViewController?
    var animeId: Int = 0
    var animelist: Animelist!
    var item: AnimelistItem!
    
    @IBOutlet weak var TopImage: UIImageView!
    @IBOutlet weak var TopAnimeTitle: UILabel!
    
    @IBOutlet var favButton: UIButton!
    @IBOutlet var listButton: UIButton!
    
    @IBAction func favAnime(_ sender: Any) {
        let animeFavorite = !favorited
        if (animeFavorite)
        {
            let favoriteAction = UIAlertAction(title: "Favorite", style: .default){
                UIAlertAction in NotificationCenter.default.post(name: Notification.Name("addItem"), object:["item": self.item!, "index": 0])
            }
        }
        else
        {
            let removeFavorite = UIAlertAction(title: "UnFavorite", style: .default){ UIAlertAction in
                NotificationCenter.default.post(name: Notification.Name("removeItem"), object: ["item": self.item!, "index": 0])
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    }
    
    @IBAction func addAnime(_ sender: Any) {
        // 1
        let optionMenu = UIAlertController(title: nil, message: "Select A List", preferredStyle: .actionSheet)
                
        // 2
        let watchingAction = UIAlertAction(title: "Watching", style: .default) { UIAlertAction in

            NotificationCenter.default.post(name: Notification.Name("addItem"), object: ["item": self.item!, "index": 0])
        }
        let toWatchAction = UIAlertAction(title: "To Watch", style: .default) { UIAlertAction in
            NotificationCenter.default.post(name: Notification.Name("addItem"), object: ["item": self.item!, "index": 1])
        }
        let watchedAction = UIAlertAction(title: "Watched", style: .default) { UIAlertAction in
            NotificationCenter.default.post(name: Notification.Name("addItem"), object: ["item": self.item!, "index": 2])
        }
                
        // 3
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                
        // 4
        optionMenu.addAction(watchingAction)
        optionMenu.addAction(toWatchAction)
        optionMenu.addAction(watchedAction)
        optionMenu.addAction(cancelAction)
                
        // 5
        viewController?.present(optionMenu, animated: true, completion: nil)
    }
    
    func getAnime(anime_id : Int) {
         
             let urlString = "https://api.jikan.moe/v3/anime/\(anime_id)" //url String
         
             //Create a url object from the url String. Use guard so that if cannot be created as an url object, then provide optional error message. Created as an optional
             guard let url = URL(string: urlString) else {
                 //if not able to create a url from urlString, just return
                 print("Not able to create url object from url String")
                 return
             }
             //Create a Data Task, which is how you perform actual API calls and networking tasks
             let task = URLSession.shared.dataTask(with: url, completionHandler: { 
                 data, _, error in
                 guard let data = data, error == nil else {
                     return
                 } //if successful, task will retrieve data requested from the API endpoint and will store in variable data. Else if the API call failed and it couldn't retrieve data, it returns
                 //do - catch function because the decoder function can actually throw an error so we want to account for that too
             //    print("Got data: \(data)") //to see if data was successfully retrieved. Should print data in bytes if so/
                 
                 //decode the JSON data returned from the API endpoint as object of struct AnimelistItem so that instead of retreiving all the data returned by the API call, we can only retrieve the data we are interested in with their keys defined in the struct definition.
                var animeToAdd : AnimelistItem?
                 do {
                     //decode the JSON data retrieved from the API call in bytes to instances of swift data types of class AnimelistItem
                     animeToAdd = try JSONDecoder().decode(AnimelistItem.self, from: data)
                 } catch {
                     print("Failed to Decode Error")
                     
                 }
                 
                 //to ensure anime object animeToAdd has no optional data members.
                 guard let final = animeToAdd else {
                     return
                 }
                 print(final.title)
             }) //end of task definition
             task.resume() //After you create the task, you must start it by calling its resume() method.
     }
        
    
    
    var favorited:Bool = false
    func setFavorite(_ isFavorited:Bool) {
        favorited = isFavorited
        if (favorited)
        {
            favButton.setImage(UIImage(named:"favor-icon-filled"), for: UIControl.State.normal)
        }
        else
        {
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        print("selected")

        // Configure the view for the selected state
    }

}
