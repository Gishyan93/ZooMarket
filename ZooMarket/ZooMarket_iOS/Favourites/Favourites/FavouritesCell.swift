//
//  FavouritesCell.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 05.07.22.
//

import UIKit

class FavouritesCell: BaseTableViewCell {
    
    var label: UILabel!
    
    override func initViews() {
        backgroundColor = .red
        
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Test"
        
        addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
