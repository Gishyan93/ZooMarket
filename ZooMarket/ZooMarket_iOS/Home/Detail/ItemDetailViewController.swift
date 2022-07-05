//
//  DetailViewController.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 21.06.22.
//

import UIKit

class ItemDetailViewController: UIViewController {
    var brand: Brand
    
    var heartButton: UIButton!
    var scrollView: UIScrollView!
    var stackView: UIStackView!
    var headerImageView: UIImageView!
    var infoLabel: UILabel!
    var checkoutButton: UIButton!
    
    var repository: ItemsRepository
    
    init(brand: Brand, repository: ItemsRepository) {
        self.brand = brand
        self.repository = repository
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        initHeartButton()
        initCheckoutButton()
        initScrollView()
        initStackView()
        initHeaderImageView()
        initInfoLabel()
        constructHierarchy()
        activateConstraints()
        
        update(data: brand)
        
        heartButton.addTarget(self, action: #selector(heartButtonPressed), for: .touchUpInside)
    }
    
    func update(data: Brand) {
        let isFavourite = data.isFavourite ?? false
        if isFavourite {
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    @objc func heartButtonPressed() {
        let isFavourite = brand.isFavourite ?? false
        self.brand.isFavourite = !isFavourite
        repository.set(brand: brand)
        
        update(data: brand)
    }
}

// MARK: - Layout
extension ItemDetailViewController {
    private func initHeartButton() {
        heartButton = UIButton(type: .system)
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
    }
    
    private func initScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func initCheckoutButton() {
        checkoutButton = UIButton(type: .system)
        checkoutButton.translatesAutoresizingMaskIntoConstraints = false
        checkoutButton.setTitle("Checkout", for: .normal)
        checkoutButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        checkoutButton.backgroundColor = .red
        checkoutButton.layer.cornerRadius = 12
    }
    
    private func initStackView() {
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func initHeaderImageView() {
        headerImageView = UIImageView()
        headerImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        headerImageView.backgroundColor = .blue
        headerImageView.isUserInteractionEnabled = true
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func initInfoLabel() {
        infoLabel = UILabel()
        infoLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        infoLabel.numberOfLines = 0
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func constructHierarchy() {
        view.addSubview(scrollView)
        view.addSubview(checkoutButton)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(headerImageView)
        stackView.addArrangedSubview(infoLabel)
        headerImageView.addSubview(heartButton)
    }
    
    private func activateConstraints() {
        let contentLayoutGuide = scrollView.contentLayoutGuide
        let frameLayoutGuide = scrollView.frameLayoutGuide
        
        NSLayoutConstraint.activate([
            checkoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            checkoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            checkoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            frameLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            frameLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            frameLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            frameLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            stackView.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor),
            stackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor, constant: -70),
            
            heartButton.bottomAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: -10),
            heartButton.trailingAnchor.constraint(equalTo: headerImageView.trailingAnchor, constant: -10)
        ])
    }
}
