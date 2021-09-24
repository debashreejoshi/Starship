//
//  TabViewController.swift
//  Starship
//
//  Created by Debashree on 24/9/21.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarSetUp()
        // Do any additional setup after loading the view.
    }
    

    func tabBarSetUp() {
        let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as! ViewController
        let homeNavController = UINavigationController(rootViewController: homeVC)
        homeNavController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let favouritesVC = UIStoryboard(name: "Favourite", bundle: nil).instantiateViewController(identifier: "FavouritesViewController") as! FavouritesViewController
        let favouritesNavController = UINavigationController(rootViewController: favouritesVC)
        favouritesNavController.tabBarItem = UITabBarItem(title: "Favourites", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        
        let viewControllersList = [homeNavController, favouritesNavController]
        self.viewControllers = viewControllersList
        //.map { UINavigationController(rootViewController: $0) } /* uncomment this line if want to set navigation bar for all VCs */
    }
}
