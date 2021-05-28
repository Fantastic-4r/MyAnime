//
//  AnimeDetailsViewController.swift
//  My Anime
//
//  Created by Edward de los Santos on 5/19/21.
//

import UIKit

class AnimeDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var episodesLabel: UILabel!
    
    @IBOutlet weak var posterView: UIImageView!
    
    @IBOutlet weak var synopsisLabel: UILabel!
    

    var animeItem: AnimeFromTop! //we get the data for this animeItem from the DiscoverViewController during segue. Anime objectthat the user selected from the top anime list
    
    var animeSynopsis : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let animeID = animeItem.mal_id//we need the anime id to get the synopsis of the anime
       // getSynopsis(anime_ID: animeID)
        getSynopsis(anime_ID: animeItem.mal_id) { (synopsis, error) in
            DispatchQueue.main.async {
                self.synopsisLabel.text = synopsis
                print(self.synopsisLabel.text as Any)
            }
        }
    
        //set up layout
        synopsisLabel.sizeToFit()
        if animeItem.episodes == 0 {
            episodesLabel.text = "Null"
        } else {
            episodesLabel.text = "\(animeItem.episodes ?? 0) episodes"
        }
        titleLabel.text = animeItem.title
        let imgUrlString = animeItem.image_url //image url in string
        let imgURL = URL(string: imgUrlString)!
        posterView.af.setImage(withURL: imgURL)
        //  setupLayout()
        // Do any additional setup after loading the view.
    }
    
    
    //The purpose of this function is to make an API call to get the synopsis of our anime, which is not provided by the top anime endpoint. This function gets an anime object from the API but only with the synopsis because we don't need the rest of the huge data.
    func getSynopsis(anime_ID : Int, synopsisCompletionHandler: @escaping (String?, Error?) -> Void) {
        
        let animeID = anime_ID //we need the anime id to get the synopsis of the anime
        
        //API CALL to get the synopsis
        let urlString = "https://api.jikan.moe/v3/anime/\(animeID)" //url String

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
            }
            //do - catch function because the decoder function can actually throw an error so we want to account for that too
            var anime: AnimeSynopsis?
            do {
                anime = try JSONDecoder().decode(AnimeSynopsis.self, from: data)
                if let synopsis = anime?.synopsis {
                    synopsisCompletionHandler(synopsis, nil)
                }
            } catch {
                print("Failed to Decode Error")
                
            }
           
        })
        task.resume() //starts the API call
        //this is where synopsisCompletionHandler(synopsis, nil) is called
    }
    
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
