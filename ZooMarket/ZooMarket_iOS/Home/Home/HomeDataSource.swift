//
//  HomeDataSource.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 25.05.22.
//

import UIKit

struct HomeSection {
    let title: String?
    let type: HomeSectionType
    let items: [HomeItem]
}

enum HomeSectionType {
    case brands
    case alsoLike
}

struct HomeItem {
    let id: Int
    let name: String
    let image: String
}

protocol HomeDataSourceDelegate: AnyObject {
    func updateInfo()
}

class HomeDataSource: NSObject, UICollectionViewDataSource {
    weak var delegate: HomeDataSourceDelegate?
    
    var itemsRepository: ItemsRepository
    
    var brands: [Brand] = []
    private(set) var sections: [HomeSection] = []
    
    init(itemsRepository: ItemsRepository) {
        self.itemsRepository = itemsRepository
        super.init()
        
        updateSections()
        // Delegate of itemsRepository is HomeDataSource
//        itemsRepository.delegate = self
        itemsRepository.multicastDelegate.add(delegate: self)
    }
    
    func updateSections() {
        brands = itemsRepository.getBrands()
        let brandItems = brands.map {
            HomeItem(id: $0.id, name: $0.name, image: $0.image)
        }
        
        let brands = HomeSection(title: "Brands", type: .brands, items: brandItems)
        sections = [ brands, makeAlsoLikeSection() ]
    }
    
    private func makeAlsoLikeSection() -> HomeSection {
        let firstItem = HomeItem(id: 0, name: "", image: "")
        let secondItem = HomeItem(id: 1, name: "", image: "")
        let thirdItem = HomeItem(id: 2, name: "", image: "")
        let forthItem = HomeItem(id: 3, name: "", image: "")
        
        return HomeSection(
            title: "You may also like",
            type: .alsoLike,
            items: [firstItem, secondItem, thirdItem, forthItem]
        )
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return sections[section].items.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let section = sections[indexPath.section]
        switch section.type {
        case .brands:
            return makeBrands(in: collectionView, indexPath: indexPath)
        case .alsoLike:
            return makeAlsoLike(in: collectionView, indexPath: indexPath)
        }
    }
    
    private func makeBrands(
        in collectionView: UICollectionView,
        indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "BrandCell", for: indexPath
            ) as? BrandCell
        else { fatalError("Failed to dequeue a BrandCell.") }

        
        cell.delegate = self
        cell.set(data: brands[indexPath.item])
        
        return cell
    }
    
    private func makeAlsoLike(in collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "AlsoLikeCell", for: indexPath
            ) as? AlsoLikeCell
        else { fatalError("Failed to dequeue a StatusCollectionViewCell.") }
        
        return cell
    }
 
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: HomeViewController.sectionHeaderElementKind,
            withReuseIdentifier: HeaderView.reuseIdentifier,
            for: indexPath
        ) as! HeaderView

        let section = sections[indexPath.section]
        switch section.type {
        case .brands:
            headerView.label.text = "Brands"
        case .alsoLike:
            headerView.label.text = "Also Like"
        }
        return headerView
    }
}

extension HomeDataSource: BrandCellDelegate {
    func likeButtonPressed(with brand: Brand) {
        
        itemsRepository.set(brand: brand)
//        brands = homeRepository.getBrands()
        
//        delegate?.updateInfo()
    }
}

extension HomeDataSource: ItemsRepositoryDelegate {
    func update(brands: [Brand]) {
        self.brands = brands
        delegate?.updateInfo()
    }
}
