//
//  ViewController.swift
//  lesson9
//
//  Created by Dmitrii Nazarov on 24.08.2024.
//

import UIKit

class ViewController: UIViewController {
    lazy var images: [UIImage] = [.starfill, .starfill, .starfill, .star]
    lazy var images2: [UIImage] = [.img1, .img2, .img3]
    
    lazy var mainImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = .main
        
        return $0
    }(UIImageView())
    
    lazy var hStackOne: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.distribution = .fillProportionally
        $0.alignment = .top
        
        return $0
    }(UIStackView())
    
    lazy var nameLabel: UILabel = {
        $0.text = "ELIE SAAB LE PARFUM BRIDAL EAU DE PARFUM"
        $0.numberOfLines = 0
        
        return $0
    }(UILabel())
    
    lazy var starImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = .star.withRenderingMode(.alwaysTemplate)
        $0.heightAnchor.constraint(equalToConstant: 23).isActive = true
        $0.widthAnchor.constraint(equalToConstant: 23).isActive = true
        $0.tintColor = .black
        
        return $0
    }(UIImageView())
    
    lazy var hStackTwo: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.distribution = .fillEqually
        //$0.axis = .horizontal
        $0.alignment = .fill
        $0.spacing = 1
        return $0
    }(UIStackView())
    
    lazy var reviewLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "249 отзывов"
        $0.font = .systemFont(ofSize: 14)
        $0.numberOfLines = 1
        //$0.lineBreakMode = .byWordWrapping
        return $0
    }(UILabel())
   
    lazy var hStackThree: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.distribution = .fillProportionally
        //$0.axis = .horizontal
        $0.alignment = .fill
        $0.spacing = 1
        return $0
    }(UIStackView())
    
    lazy var priceLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "4 299 ₽"
        $0.font = .systemFont(ofSize: 22, weight: .bold)
        $0.numberOfLines = 1
        //$0.lineBreakMode = .byWordWrapping
        return $0
    }(UILabel())
    
    lazy var btn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("В корзину", for: .normal)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.widthAnchor.constraint(equalToConstant: 140).isActive = true
        return $0
    }(UIButton())
    
    lazy var descriptionNameLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Описание"
        $0.font = .systemFont(ofSize: 16, weight: .heavy)
        $0.numberOfLines = 1
        //$0.lineBreakMode = .byWordWrapping
        return $0
    }(UILabel())
    
    lazy var descriptionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo"
        $0.font = .systemFont(ofSize: 14, weight: .light)
        $0.numberOfLines = 0
        //$0.lineBreakMode = .byWordWrapping
        return $0
    }(UILabel())
    
    lazy var hStackFour: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.distribution = .fillEqually
        //$0.axis = .horizontal
        $0.alignment = .fill
        $0.spacing = 12
        return $0
    }(UIStackView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupView()
    }

    func setupView() {
        view.addSubview(mainImage)
        view.addSubview(hStackOne)
        view.addSubview(hStackTwo)
        view.addSubview(hStackThree)
        view.addSubview(hStackFour)
        
        hStackOne.addArrangedSubview(nameLabel)
        hStackOne.addArrangedSubview(starImage)
        
        images.forEach { image in
            let imageView = StackImage(image: image)
            hStackTwo.addArrangedSubview(imageView)
        }
        hStackTwo.addArrangedSubview(reviewLabel)
        
        hStackThree.addArrangedSubview(priceLabel)
        hStackThree.addArrangedSubview(btn)
        
        view.addSubview(descriptionNameLabel)
        view.addSubview(descriptionLabel)
        
        images2.forEach { image in
            let imageView = StackImage(image: image)
            hStackFour.addArrangedSubview(imageView)
        }
        
        setupConstraints()
    }
    
    func setupConstraints()
    {
        NSLayoutConstraint.activate([
            
            mainImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            mainImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35),
            
            hStackOne.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 10),
            hStackOne.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            hStackOne.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            hStackOne.heightAnchor.constraint(equalToConstant: 50),
           
            hStackTwo.topAnchor.constraint(equalTo: hStackOne.bottomAnchor, constant: 10),
            hStackTwo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 17),
            hStackTwo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            hStackTwo.heightAnchor.constraint(equalToConstant: 20),
            
            hStackThree.topAnchor.constraint(equalTo: hStackTwo.bottomAnchor, constant: 20),
            hStackThree.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            hStackThree.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            hStackThree.heightAnchor.constraint(equalToConstant: 48),
            
            descriptionNameLabel.topAnchor.constraint(equalTo: hStackThree.bottomAnchor, constant: 30),
            descriptionNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionNameLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            hStackFour.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            hStackFour.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            hStackFour.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            hStackFour.heightAnchor.constraint(equalToConstant: 120)
            
        ])
        
            
    }
    
    

}

class StackImage: UIImageView{
    override init(image: UIImage?) {
        super.init(image: image)
        contentMode = .scaleAspectFill
        clipsToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


