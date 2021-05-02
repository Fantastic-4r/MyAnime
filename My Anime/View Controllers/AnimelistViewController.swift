//
//  AnimeListViewController.swift
//  My Anime
//
//  Created by Edward de los Santos on 5/2/21.
//

import UIKit

class AnimelistViewController: UIViewController {
    var animelist: Animelist!

    override func viewDidLoad() {
        super.viewDidLoad()
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

}
