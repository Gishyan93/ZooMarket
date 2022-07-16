//
//  AlsoLikeCell.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 07.06.22.
//

import UIKit

class AlsoLikeCell: BaseCollectionCell {
    private var nameLabel: UILabel!
    
    override func initViews() {
        backgroundColor = .blue
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(data: String) {
        nameLabel.text = data
        
        layer.cornerRadius = 12
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    }
}
