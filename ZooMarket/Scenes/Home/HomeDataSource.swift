//
//  HomeDataSource.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 25.05.22.
//

import UIKit

class HomeDataSource: NSObject, UICollectionViewDataSource {
    // MARK: - Properties
    let itemData = Bundle.main.decode(ItemData.self, from: "Items.json")
    private (set)var sections = [HomeSection]()
    
    override init() {
        super.init()

        updateSections()
    }
    
    func updateSections() {
        let homeItems = itemData.data.brands.map({ brand in
            return HomeItem(id: brand.id, name: brand.name, image: brand.image)
        })
        let brands = HomeSection(title: "Brands", type: .brands, items: homeItems)
        sections = [ brands, makeAlsoLikeSection() ]
    }
    
    private func makeAlsoLikeSection() -> HomeSection {
        let firstItem = HomeItem(id: 0, name: "", image: "")
        let secondItem = HomeItem(id: 1, name: "", image: "")
        let thirdItem = HomeItem(id: 2, name: "", image: "")
        let forthItem = HomeItem(id: 3, name: "", image: "")
        
        return HomeSection(title: "You may also like", type: .alsoLike, items: [firstItem, secondItem, thirdItem, forthItem])
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
    
    private func makeBrands(in collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "BrandCell", for: indexPath
            ) as? BrandCell
        else { fatalError("Failed to dequeue a StatusCollectionViewCell.") }

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

        return headerView
    }
}
