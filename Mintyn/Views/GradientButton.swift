//
//  GradientButton.swift
//  Mintyn
//
//  Created by Faruk Amoo on 08/03/2025.
//


import UIKit

class GradientButton: UIButton {
    private let gradientLayer = CAGradientLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }

    private func setupGradient() {
        // Configure the gradient layer
        gradientLayer.colors = [UIColor.systemYellow.cgColor, UIColor.systemBrown.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5) // Horizontal gradient
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.cornerRadius = 15
        layer.insertSublayer(gradientLayer, at: 0)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        // Ensure the gradient matches the button's bounds
        layer.cornerRadius = bounds.height / 2
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = layer.cornerRadius
    }
}
