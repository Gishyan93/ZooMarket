//
//  HomeCoordinator.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 22.05.22.
//

import UIKit

class HomeCoordinator: Coordinator {
    let navigationController: CoordinatedNavigationController
    
    init(
        navigationController: CoordinatedNavigationController = CoordinatedNavigationController()
    ) {
        
        /// Creatign nav controller
        self.navigationController = navigationController
        
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.coordinator = self

        // Creating home View controller
        let viewController = HomeViewController()
        viewController.tabBarItem = UITabBarItem(
            title: "Home", image: UIImage(systemName: "house"), tag: 0
        )
        viewController.coordinator = self
        
        //
        navigationController.viewControllers = [viewController]
    }
    
    func showItemDetailScene() {
        let viewController = ItemDetailViewController()
        navigationController.pushViewController(
            viewController, animated: true
        )
    }
}
