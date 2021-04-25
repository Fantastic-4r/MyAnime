//
//  DiscoverViewController.swift
//  My Anime
//
//  Created by Fnu Tsering on 4/22/21.
//

import UIKit

class DiscoverViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
    }
    
    func getData() {
        let urlString = "https://api.jikan.moe/v3/top/anime" //url String
    //Create a url object from the url String. Use guard so that if cannot be created as an url object, then provide optional error message. Created as an optional
        guard let url = URL(string: urlString) else {
            //if not able to create a url from urlString, just return
            print("Not able to create url object from url String")
            return
        }
       
   //Create a Data Task, which is how you perform actual API calls and networking tasks
    
        //the completionHandler returns 3 optional parameters, but we only care about the Data and Error so we will do _ for discardable for the 2nd parameter URLResponse
        let task = URLSession.shared.dataTask(with: url, completionHandler: {
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            var results : TopAnimes?
            //do - catch function because the decoder function can actually throw an error so we want to account for that too
            do {
                results = try JSONDecoder().decode(TopAnimes.self, from: data)
            } catch {
                print("Failed to Decode Error")
            }
            
            guard let final = results else {
                return
            }
            print(final.top[0].title)

                
            print("Got data: \(data)")
        })
        task.resume() //starts the API call
        
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
