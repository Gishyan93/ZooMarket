//
//  BrandCollectionViewCell.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 26.05.22.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews() {}
}

class BrandCell: BaseCell {
    var nameLabel: UILabel!
    
    override func initViews() {
        backgroundColor = .red
        
        nameLabel = UILabel()
        nameLabel.text = "TEST"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
