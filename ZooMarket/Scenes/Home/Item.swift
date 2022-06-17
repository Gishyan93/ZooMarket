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
    let data: Item
}

// MARK: - Item
struct Item: Codable {
    let brands: [Brand]
}

// MARK: - Brand
struct Brand: Codable {
    let id: Int
    let image, name: String
}
