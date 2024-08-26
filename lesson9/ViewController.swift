//
//  ViewController.swift
//  lesson9
//
//  Created by Dmitrii Nazarov on 24.08.2024.
//

import UIKit

class ViewController: UIViewController {
    lazy var images: [UIImage] = [.starfill, .starfill, .starfill, .star]
    
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
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupView()
    }

    func setupView() {
        view.addSubview(mainImage)
        view.addSubview(hStackOne)
        view.addSubview(hStackTwo)
        
        hStackOne.addArrangedSubview(nameLabel)
        hStackOne.addArrangedSubview(starImage)
        
        images.forEach { image in
            let imageView = StackImage(image: image)
            hStackTwo.addArrangedSubview(imageView)
        }
        hStackTwo.addArrangedSubview(reviewLabel)
        
        
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
            hStackTwo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            hStackTwo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            hStackTwo.heightAnchor.constraint(equalToConstant: 16)
            
            
            
        ])
        
            
    }
    
    

}

class StackImage: UIImageView{
    override init(image: UIImage?) {
        super.init(image: image)
        contentMode = .scaleAspectFit
        clipsToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
