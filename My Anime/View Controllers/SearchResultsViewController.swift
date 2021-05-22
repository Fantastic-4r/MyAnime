//
//  SearchResultsViewController.swift
//  My Anime
//
//  Created by Fnu Tsering on 4/27/21.
//

import UIKit
import AlamofireImage

class SearchResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    @IBOutlet weak var tableView: UITableView!
    
    var searchResults: SearchResults? //property to store the array of dictionaries for animes that the search query returns
    
    //Whenever user types in the search bar, thiss function is called to update the Search Results
    override func viewDidLoad() {
        super.viewDidLoad()
        print("called")
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let inputText = searchController.searchBar.text, !inputText.isEmpty {
            getSearchResults(searchQuery: inputText) //call
            //     filteredResults = searchResults
        }
        tableView.reloadData()
    }
    
    
    func getSearchResults(searchQuery: String) {
        let urlString = "https://api.jikan.moe/v3/search/anime?q=\(searchQuery)" //url String
        //Create a url object from the url String. Use guard so that if cannot be created as an url object, then provide optional error message. Created as an optional
        //        print(urlString)
        guard let url = URL(string: urlString) else {
            //if not able to create a url from urlString, just return
            print("Not able to create url object from url String")
            return
        }
        //Create a Data Task, which is how you perform actual API calls and networking tasks
        //the completionHandler returns 3 optional parameters, but we only care about the Data and Error so we will do _ for discardable for the 2nd parameter URLResponse
        print(url)
        let task = URLSession.shared.dataTask(with: url, completionHandler: { [self]
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
            //do - catch function because the decoder function can actually throw an error so we want to account for that too
            var results: SearchResults?
            do {
                results = try JSONDecoder().decode(SearchResults.self, from: data)
            } catch {
                print("Failed to Decode Error")
                
            }
            
            guard let final = results else {
                return
            } //final is the search query results array
            //     print(final.results)
            searchResults = final
        })
        task.resume() //starts the API call
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchCell
        guard let filteredResults = searchResults else {
            return cell
        }
        let anime = filteredResults.results[indexPath.row]
        let title = anime.title
        let animeId = anime.mal_id
        cell.searchAnimeTitle.text = title
        
        let imgUrlString = anime.image_url //image url in string
        let imgURL = URL(string: imgUrlString)!
        cell.searchImage.af.setImage(withURL: imgURL)
        
        let item: AnimelistItem! = AnimelistItem(
            mal_id: animeId,
            image_url: imgUrlString,
            title: title,
            synopsis: anime.synopsis,
            episodes: anime.episodes ?? 0
        )
        
        cell.item = item
        cell.viewController = self
        return cell
        
        
    }
}
