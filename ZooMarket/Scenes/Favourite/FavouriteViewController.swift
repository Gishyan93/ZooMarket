//
//  FavouriteViewController.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 23.05.22.
//

import UIKit

class FavouriteViewController: UIViewController {
    var coordinator: FavouriteCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        title = "Favourite"
    }
}
