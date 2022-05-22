//
//  HomeViewController.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 22.05.22.
//

import UIKit

class HomeViewController: UIViewController {
    var coordinator: HomeCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Home"
    }
}
