//
//  HomeRepository.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 22.06.22.
//

import Foundation

protocol ItemsRepositoryDelegate: AnyObject {
    func update(brands: [Brand])
}

class ItemsRepository {
    var multicastDelegate = MulticastDelegate<ItemsRepositoryDelegate>()
    
    let service = ItemsService()
    static var shared = ItemsRepository()
    
    private(set) var brands: [Brand] = []
    var favouritesItems: [Brand] {
        brands.filter({ $0.isFavourite == true })
    }
    
    private init() {
        brands = service.itemData.data.brands
    }
    
    func getBrands() -> [Brand] {
        return brands
    }
    
    func set(brand: Brand) {
        for (index, item) in brands.enumerated() {
            if item.id == brand.id {
                let isFav = brands[index].isFavourite ?? false
                brands[index].isFavourite = !isFav
            }
        }
        
        multicastDelegate.invokeForEachDelegate { delegate in
            delegate.update(brands: brands)
        }
    }
}
