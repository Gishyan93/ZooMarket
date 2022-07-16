//
//  BaseTableViewCell.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 05.07.22.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style, reuseIdentifier: reuseIdentifier
        )
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews() {}
}
