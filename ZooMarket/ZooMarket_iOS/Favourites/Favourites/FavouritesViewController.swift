//
//  FavouriteViewController.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 23.05.22.
//

import UIKit

class FavouriteViewController: UITableViewController {
    var coordinator: FavouritesCoordinator
    var dataSource: FavouritesDataSource!
    
    init(coordinator: FavouritesCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Favourite"
        tableView.dataSource = dataSource
        tableView.register(
            FavouritesCell.self,
            forCellReuseIdentifier: "FavouritesCell"
        )
        dataSource.delagate = self
    }
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(
            at: indexPath, animated: true
        )
    }
}

extension FavouriteViewController: FavouritesDataSourceDelegate {
    func updateInfo() {
        tableView.reloadData()
    }
}
