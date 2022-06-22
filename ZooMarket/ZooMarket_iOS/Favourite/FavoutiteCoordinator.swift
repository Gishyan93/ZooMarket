//
//  FavoutiteCoordinator.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 23.05.22.
//

import UIKit

class FavouriteCoordinator: Coordinator {
    let navigationController: CoordinatedNavigationController
    
    init(navigationController: CoordinatedNavigationController = CoordinatedNavigationController()) {
        self.navigationController = navigationController
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.coordinator = self
        
        let viewController = FavouriteViewController()
        viewController.tabBarItem = UITabBarItem(
            title: "Favourite", image: UIImage(systemName: "heart"), tag: 1
        )
        viewController.coordinator = self
        navigationController.viewControllers = [viewController]
    }
}
