//
//  FeatureCell.swift
//  Mintyn
//
//  Created by Faruk Amoo on 08/03/2025.
//

import UIKit

class FeatureCell: UICollectionViewCell {
    var iconImageView = UIImageView()
    let titleLabel = UILabel()
    
    let identifier = "FeatureCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        contentView.backgroundColor = .darkGray
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 1
        titleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        
        let stackView = UIStackView(arrangedSubviews: [iconImageView, titleLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            
            
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor),
            iconImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
        ])
    }
    
//    func configure(with index: Int) {
//        let titles = ["Budget", "EasyCollect", "Business"]
//        let images = ["Budget", "EasyCollect", "Business"]
//        let colors: [UIColor] = [.blue, .green, .red]
//        
//        contentView.backgroundColor = colors[index].withAlphaComponent(0.3)
//        
//        titleLabel.text = titles[index]
//        
//        iconImageView.image = UIImage(named: images[index])
//    }
    
    func configure(title: String, color: UIColor, icon: UIImage?) {
        contentView.backgroundColor = color
        titleLabel.text = title
        iconImageView.image = icon
    }

}
