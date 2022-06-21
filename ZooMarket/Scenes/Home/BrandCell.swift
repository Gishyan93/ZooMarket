//
//  BrandCollectionViewCell.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 26.05.22.
//

import UIKit

class BrandCell: BaseCell {
    var nameLabel: UILabel!
    var likeButton: UIButton!
        
    override func initViews() {
        backgroundColor = .red
        
        initNabeLabel()
        initLikeButton()
        constructHierarchy()
        activateConstraints()
    }
    
    private func initNabeLabel() {
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func initLikeButton() {
        likeButton = UIButton(type: .system)
        likeButton.setImage(
            UIImage(systemName: "heart"),
            for: .normal
        )
        likeButton.tintColor = .black
        likeButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func constructHierarchy() {
        addSubview(nameLabel)
        addSubview(likeButton)
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            likeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            likeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
