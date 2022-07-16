//
//  MainTabBarController.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 22.05.22.
//

import UIKit

/// A UITabBarController's subclass which creates coordinators for each tab bar's item.
class MainTabBarController: UITabBarController {
    let homeCoordinator = HomeCoordinator()
    let favouriteCoordinator = FavouritesCoordinator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            homeCoordinator.navigationController,
            favouriteCoordinator.navigationController
        ]
        
        setAppearance()
    }
    
    func setAppearance() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .systemYellow
        
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        } else {
            // Fallback on earlier versions
        }
    }
}
