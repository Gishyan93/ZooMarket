//
//  BaseTableViewController.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 05.07.22.
//

import UIKit

class BaseTableViewController: UITableViewController {
//    override init() {
//        super.init(nibName: nil, bundle: nil)
//    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
