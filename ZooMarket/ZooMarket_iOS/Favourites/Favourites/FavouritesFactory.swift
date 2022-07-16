//
//  FavouritesFactory.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 05.07.22.
//

import UIKit

class FavouritesFactory {
    static func createFavouritesViewController(
        coordinator: FavouritesCoordinator,
        repository: ItemsRepository = .shared
    ) -> FavouriteViewController {
        
        let dataSource = FavouritesDataSource(
            repository: repository
        )
        let viewController = FavouriteViewController(
            coordinator: coordinator
        )
        viewController.dataSource = dataSource
        return viewController
    }
}
