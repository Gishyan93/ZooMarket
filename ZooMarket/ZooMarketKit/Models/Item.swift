//
//  Item.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 25.05.22.
//

import Foundation

// MARK: - ItemData
struct ItemData: Codable {
    let status: Int
    let message: String
    var data: Item
}

// MARK: - Item
struct Item: Codable {
    var brands: [Brand]
}

// MARK: - Brand
struct Brand: Codable {
    let id: Int
    let image, name: String
    var isFavourite: Bool?
}
