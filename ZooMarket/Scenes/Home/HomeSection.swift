//
//  HomeSection.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 26.05.22.
//

import Foundation

struct HomeSection {
    let title: String?
    let type: HomeSectionType
    let items: [HomeItem]
}

enum HomeSectionType {
    case brands
    case alsoLike
}

struct HomeItem {
    var id: Int
    var name: String
    var image: String
}
