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
        let viewController = HomeFactory.createHomeViewController(coordinator: self)
        viewController.tabBarItem = UITabBarItem(
            title: "Home", image: UIImage(systemName: "house"), tag: 0
        )
        
        //
        navigationController.viewControllers = [viewController]
    }
    
    func showItemDetailScene(with brand: Brand) {
        let viewController = ItemDetailFactory.createItemDetailViewController(brand: brand)
        navigationController.pushViewController(
            viewController, animated: true
        )
    }
}
