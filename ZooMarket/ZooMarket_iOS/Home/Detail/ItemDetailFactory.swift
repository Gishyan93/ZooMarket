//
//  ItemDetailFactory.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 30.06.22.
//

import Foundation

class ItemDetailFactory {
    static func createItemDetailViewController(
        brand: Brand,
        repository: ItemsRepository = .shared
    ) -> ItemDetailViewController {
        
        let viewController = ItemDetailViewController(
            brand: brand, repository: repository
        )
        return viewController
    }
}
