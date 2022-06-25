//
//  ItemsAPI.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 23.06.22.
//

import Foundation

class ItemsAPI {
    var itemData = Bundle.main.decode(ItemData.self, from: "Items.json")
}
