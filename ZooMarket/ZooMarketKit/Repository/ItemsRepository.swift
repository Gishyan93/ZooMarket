//
//  ItemsRepository.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 23.06.22.
//

import Foundation

protocol ItemsRepositoryDelegate: AnyObject {
    func updateBrands(brands: [Brand])
}

class ItemsRepository {
    weak var delegate: ItemsRepositoryDelegate?
    let service = ItemsAPI()
    private var brands: [Brand] = []
    
    static var shared = ItemsRepository()
    
    private init() {
        brands = service.itemData.data.brands
    }
    
    func set(brand: Brand) {
        for (index, item) in brands.enumerated() {
            if item.id == brand.id {
                let isFav = brands[index].isFavourite ?? false
                brands[index].isFavourite = !isFav
            }
        }
        delegate?.updateBrands(brands: brands)
    }
    
    func getBrands() -> [Brand] {
        return brands
    }
}
