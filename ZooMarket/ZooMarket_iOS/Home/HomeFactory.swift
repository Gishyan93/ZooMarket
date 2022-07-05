//
//  HomeFactory.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 28.06.22.
//

import UIKit

class HomeFactory {
    static func createHomeViewController(
        coordinator: HomeCoordinator,
        repository: ItemsRepository = .shared
    ) -> HomeViewController {
        
        let dataSource = HomeDataSource(homeRepository: repository)
        let viewController = HomeViewController(coordinator: coordinator)
        viewController.dataSource = dataSource
        return viewController
    }
}
