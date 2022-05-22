//
//  MainTabBarController.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 22.05.22.
//

import UIKit

class MainTabBarController: UITabBarController {
    let homeCoordinator = HomeCoordinator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [homeCoordinator.navigationController]
    }
}
