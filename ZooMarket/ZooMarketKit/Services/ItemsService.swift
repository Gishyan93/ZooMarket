//
//  ItemsService.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 22.06.22.
//

import Foundation

class ItemsService {
    var itemData = Bundle.main.decode(ItemData.self, from: "Items.json")    
}
