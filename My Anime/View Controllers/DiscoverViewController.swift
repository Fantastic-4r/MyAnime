//
//  DiscoverViewController.swift
//  My Anime
//
//  Created by Fnu Tsering on 4/22/21.
//

import UIKit
import AlamofireImage

class DiscoverViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    
    @IBOutlet weak var topTableView: UITableView!
    
    
    var filteredAnimes: SearchResults? //this property will hold the animes that user searches for
    
    // topResults will contain the array of dictionaries that represent the top animes returned to us by an API call
    var topResults : TopAnimes?
    //By initializing UISearchController with a nil value for searchResultsController, you’re telling the search controller that you want to use the same view you’re searching to display the results. If you specify a different view controller here, the search controller will display the results in that view controller instead.
    var searchController: UISearchController!
    //In order for the DiscoverViewController to respond to the search bar, it must implement UISearchResultsUpdating. This protocol defines methods to update search results based on information the user enters into the search bar. Do this outside of the main DiscoverViewController function at the bottom.
    private var searchResultsTableController : SearchResultsViewController! //creates an instance of the class SearchViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchBar()
        // Loading data for the top anime view controller in Discover View
        topTableView.dataSource = self
        topTableView.delegate = self
        let group = DispatchGroup()
        group.enter()
        getTopAnimes(group) //API call to get an array of dictionaries of top animes
        group.wait()
        topTableView.reloadData()//calls on the table view functions to reload data with data received from the API call
        
    }
    
    //MARK: - API Call and table view configurations for the Top Anime table view controller
    func getTopAnimes(_ group: DispatchGroup) {
        let urlString = "https://api.jikan.moe/v3/top/anime" //url String
        //Create a url object from the url String. Use guard so that if cannot be created as an url object, then provide optional error message. Created as an optional
        guard let url = URL(string: urlString) else {
            //if not able to create a url from urlString, just return
            print("Not able to create url object from url String")
            return
        }
        //Create a Data Task, which is how you perform actual API calls and networking tasks
        //the completionHandler returns 3 optional parameters, but we only care about the Data and Error so we will do _ for discardable for the 2nd parameter URLResponse
        let task = URLSession.shared.dataTask(with: url, completionHandler: { [self]
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
            //do - catch function because the decoder function can actually throw an error so we want to account for that too
            var results: TopAnimes?
            do {
                results = try JSONDecoder().decode(TopAnimes.self, from: data)
            } catch {
                print("Failed to Decode Error")
                
            }
            
            guard let final = results else {
                return
            } //final is the top results array
            //  print(final.top)
            topResults = final
            group.leave()
            //      print(topResults?.top[0] as Any) //if episodes = nil, set episodes to 0
            
            
            //   print("Got data: \(data)")
        })
        task.resume() //starts the API call
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50 //return 50 because get request to the top/anime/ endpoint returns a list of 50 anime
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //reuse cell prototype. Reuse the cell of class TopAnimeTableViewCell with identifier of same name
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopCell", for: indexPath) as! TopAnimeTableViewCell
        guard let topAnimes = self.topResults else { //to ensure topAnimes is not nil
            return cell
        }
        let anime = topAnimes.top[indexPath.row]
        let title = anime.title
        let animeId = anime.mal_id
        cell.TopAnimeTitle.text = title
        
        let imgUrlString = anime.image_url //image url in string
        let imgURL = URL(string: imgUrlString)! //convert the image url from string to url so that we can download it. Since imgURL is an optional type, must unwrap it so use force-unwrap using '!' to abort execution if the optional value contains 'nil'
        
        //this function .af.setImage(withURL: URL) from the pod AlomofireImage downloads the images from the imgURL and sets it to the UIImageView.
        cell.TopImage.af.setImage(withURL: imgURL)
        let item: AnimelistItem! = AnimelistItem(mal_id: animeId, rank: 0, title: title, image_url: imgUrlString, episodes: 0, checked: false)
        
        cell.item = item
        
        cell.viewController = self
        return cell
    }
    
    func setUpSearchBar() {
        searchResultsTableController = (storyboard?.instantiateViewController(withIdentifier: "SearchResultsViewController") as! SearchResultsViewController)
        
        // Initializing with searchResultsController set to searchResultTableController means that
        // UIsearchController will use this view controller to display the search results
        searchController = UISearchController(searchResultsController: searchResultsTableController)
        
        //Makes the Search Results Updater the searchResultTableController of class SearchResultsViewController. So whenever user types in the search bar, the updateSearchResults(for searchController: UISearchController) function in the SearchResultsViewController is called which will update the content in the SearchResultsViewController.
        searchController.searchResultsUpdater = searchResultsTableController
        
        // If we are using this same view controller to present the results
        // dimming or obscuring it out wouldn't make sense. Should probably only set
        // this to yes if using another controller to display the search results.
        searchController.obscuresBackgroundDuringPresentation = false
        
        searchController.searchBar.sizeToFit()
        searchController.searchBar.enablesReturnKeyAutomatically = false
        self.navigationItem.searchController = searchController //set search controller bar into the navigation bar
        self.navigationItem.hidesSearchBarWhenScrolling = false //allow users to see the search bar even when scrolling
        
        // Sets this view controller as presenting view controller for the search interface
        definesPresentationContext = true //displays the search bar in the view controller properly
        searchController.searchBar.placeholder = "Search anime by name"
    }
     
}
