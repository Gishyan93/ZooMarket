//
//  FavouritesDataSource.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 05.07.22.
//

import UIKit

protocol FavouritesDataSourceDelegate: AnyObject {
    func updateInfo()
}

class FavouritesDataSource: NSObject, UITableViewDataSource {
    
    weak var delagate: FavouritesDataSourceDelegate?
    var itemsRepository: ItemsRepository
    
    init(repository: ItemsRepository) {
        self.itemsRepository = repository
        super.init()
        
        // 
        repository.multicastDelegate.add(delegate: self)
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return itemsRepository.favouritesItems.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "FavouritesCell", for: indexPath
        ) as! FavouritesCell
        
        return cell
    }    
}

extension FavouritesDataSource: ItemsRepositoryDelegate {
    func update(brands: [Brand]) {
        delagate?.updateInfo()
    }
}
