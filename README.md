Original App Design Project - README 
===

# MyAnime

## Table of Contents
1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)
5. [App Walkthrough GIF](#App-Walkthrough-GIF)

## Overview
### Description
MyAnime allows users to keep track of the animes they are watching, have already watched and animes they plan to watch.

### App Evaluation
- **Category:** Social/Entertainment 
- **Mobile:** No website, stand alone mobile app
- **Story:** Allows users to explore/disover animes, and track what they watch. 
- **Market:** Anybody who watches animes, or wants to start watching animes, can use this app.
- **Habit:** Users can explore an endless amount of animes until they one (or multiple) that they like and want to watch. They can also update the tracker regularly everytime they finish an episode(s).
- **Scope:** MyAnime will begin as an app that allows users to discover/track animes, but will eventually expand to be a social network/forum where users will be able to share what they're watching, their thoughts, and their lists. 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* [x] User can view a list of popular animes
* [x] User can search for an anime
* [x] User can see an app icon and a launch screen
* [x] User can add an anime from search results and top results to their Watching list
* [x] User can add an anime from search results and top results to their Watched list.
* [x] User can add an anime from search results and top results to their To Watch list.
* [x] User can view the list of animes added to their To Watch list
* [x] User can view the list of animes added to their Watching list.
* [x] User can view the list of animes added to their Watched list
* [x] User can delete an anime from their lists

**Optional Nice-to-have Stories**
* [ ] User can log the last episode they watched for an anime in their Watching list 
* [ ] User can add an anime from the watching list to their Favorites list
* [ ] User can add an anime from the watched list to their Favorites list
* [ ] User can view the list of animes added to their Favorites list
* [ ] User can tap on an anime to view more details about that anime
* [ ] User can tap on a button next to an anime in the To Watch list to move it to the Watching list. 
* [ ] User can view Anime schedule of the week
* [ ] User can see ratings for an anime
* [ ] User can provide personal rating for an anime
* [ ] User can click a random button to get a random anime recommeded to them
* [ ] User can click a random button to let the app decide which anime to watch next from their To Watch list for the user.
* [ ] User can view anime quote of the day

### 2. Screen Archetypes

* My Anime screen
     * Allows user to select one of the lists from the watching list, watched lists, and favorites list, in order to view the animes added to that selected list.
* Watching screen
    * User can view the list of animes added to their Watching list
    * User can log the last episode they watched for an anime in their Watching list 
    * User can add an anime from the Watching list to their favorites list
* Watched screen 
     * User can view the list of animes added to their watched list
     * User can add an anime from the Watched list to their favorites list
* To Watch screen
    * User can view the list of animes added to their To Watch list
* Favorites screen
    * User can view the list of animes added to the favorites list.
* Discover screen
    * User can see a list of popular animes 
    * User can tap search to search for an anime
* Search screen
    * User can search for an anime
    * User can add an anime from search results to their watching list
    * User can add an anime from search results to their watched list.
    * User can add an anime from search results to their To Watch list.
### 3. Navigation

**Tab Navigation** (Tab to Screen)

* My Anime
* Discover 
* Favorites (collection view of all the animes added to the favorite list)

Optional:
* To Watch List 
* Random Anime Recommendation

**Flow Navigation** (Screen to Screen)

* My Anime screen 
    => Watching screen
    => Watched screen
    => To Watch screen
* Watching screen
     => None, but future version will involve navigation to a detailed screen to see detailed information and image for selected anime.
* Watched screen
     => None, but future version will involve navigation to a detailed screen to see detailed information and image for selected anime.
* To Watch screen
    => None, but future version will involve navigation to a detailed screen to see detailed information and image for selected anime
* Favorites screen
    => None, but future version will involve navigation to a detailed screen to see detailed information and image for selected anime.
* Discover screen
   => Modal navigation to the Search screen
   => Future version will involve navigation to a detailed screen to see detailed information and image for selected anime. 


## Wireframes
![](https://i.imgur.com/scpmRy4.jpg)


## Schema 

### Models
#### AnimeFromSearch

   | Property      | Type     | Description                     |
   | ------------- | -------- | --------------------------------|
   | mal_id        | Int      | unique id of the anime          |
   | image_url     | String   | image url of the anime          |
   | synopsis      | String   | brief summary of the anime      | 
   | title         | String   | name of the anime               |
   | episodes      | Int      | number of episodes for the anime|

#### SearchResults
   | Property      | Type               | Description                        |
   | ------------- | ------------------ | -----------------------------------|
   | results       | [AnimeFromSearch]  | an array of AnimeFromSearch objects|
   
#### AnimeFromTop

   | Property      | Type     | Description                                           |
   | ------------- | -------- | ------------------------------------------------------|
   | mal_id        | Int      | unique id of the anime                                |
   | rank          | Int      | the anime's rank among the top 50 anime on MyAnimeList|
   | image_url     | String   | image url of the anime                                | 
   | title         | String   | name of the anime                                     |
   | episodes      | Int      | number of episodes for the anime                      |

#### SearchResults
   | Property      | Type               | Description                        |
   | ------------- | ------------------ | -----------------------------------|
   | top           | [AnimeFromTop]     | an array of AnimeFromTop objects   |
   
   
#### Networking

* Discover screen
    * (Read/GET) Query top 50 popular anime on MyAnimeList
* Search screen
    * (Read/GET) Query all anime that starts with the letter/character as inputted by user in search bar

#### Jikan API
* Base URL - https://api.jikan.moe/v3
* Endpoints
    * Search screen

      | HTTP Verb     | Endpoint                     | Description                                        |
      | ------------- | -----------------------------| ---------------------------------------------------|
      | GET           | /search/anime/?q=title       | returns a list of anime that starts with the string provided by user for title as the search query|

    * Discover screen
        | HTTP Verb     | Endpoint                     | Description                                        |
        | ------------- | -----------------------------| ---------------------------------------------------|
        | GET           | /top/anime                   | returns the top 50 items or anime on MyAnimeList   |


## App Walkthrough GIF

### User can view a list of popular animes and user can search for an anime
![](https://i.imgur.com/FxYwGbf.gif)

### User can press a "add to list" button and be presented with an action sheet to choose which list
![](http://g.recordit.co/xtQd9qC3mc.gif)

### User can see an app icon and a launch screen
![](https://i.imgur.com/RoqWE7y.gif)

### User can add an anime from the Top anime list and from the search results to their Watching list, Watched list and To Watch list. User can also view the list of animes added to their lists.
![](https://i.imgur.com/vMpRqiU.gif)

### User can delete animes from their lists
![](https://i.imgur.com/MU6S0sT.gif)




