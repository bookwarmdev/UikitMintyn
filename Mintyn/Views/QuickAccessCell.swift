//
//  QuickAccessCell.swift
//  Mintyn
//
//  Created by Faruk Amoo on 08/03/2025.
//

import UIKit

class QuickAccessCell: UICollectionViewCell {
    
    var iconImageView = UIImageView()
    var titleLabel = UILabel()
    var onTap: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        
        // Configure Icon Image View
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .white
        iconImageView.backgroundColor =  UIColor(white: 1.0, alpha: 0.1)
        iconImageView.layer.cornerRadius = 10
        iconImageView.clipsToBounds = true
        
        
        // Configure Title Label
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        titleLabel.textAlignment = .center
        
        addSubview(iconImageView)
        addSubview(titleLabel)
        
        // Enable Auto Layout
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Icon constraints
            iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            
            
            // Label constraints
            titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
        
        // Add tap gesture recognizer for the entire cell (so the entire cell is clickable)
        let cellTapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        self.addGestureRecognizer(cellTapGesture)
        
    }
    
    func configure(title: String, iconName: String, onTap: (() -> Void)? = nil) {
        titleLabel.text = title
        iconImageView.image = UIImage(systemName: iconName)
        self.onTap = onTap
    }
    
    
    @objc func cellTapped() {
        // Handle cell tap action
        onTap?()
    }
    
}


extension UIImage {
    func addPadding(_ padding: CGFloat) -> UIImage {
        let alignmentInset = UIEdgeInsets(top: -padding, left: -padding,
                                          bottom: -padding, right: -padding)
        return withAlignmentRectInsets(alignmentInset)
    }
}
