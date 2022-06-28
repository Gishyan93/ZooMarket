//
//  HomeRepository.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 22.06.22.
//

import Foundation

class HomeRepository {
    let service = ItemsService()
    static var shared = HomeRepository()
    
    private(set) var brands: [Brand] = []
    
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
    }
}
