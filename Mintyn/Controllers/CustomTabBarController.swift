//
//  CustomTabBarController.swift
//  Mintyn
//
//  Created by Faruk Amoo on 08/03/2025.
//


import UIKit

class CustomTabBarController: UITabBarController {
    
    private let centerButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarAppearance()
        setupViewControllers()
        setupCenterButton()
    }
    
    private func setupTabBarAppearance() {
        
        let customTabBar = CurvedTabBar()
        setValue(customTabBar, forKey: "tabBar")
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
    
    private func setupViewControllers() {
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house.fill"),
            tag: 0
        )
        
        let investVC = InvestViewController()
        investVC.tabBarItem = UITabBarItem(
            title: "Invest",
            image: UIImage(systemName: "chart.bar.fill"),
            tag: 1
        )
        
        let menuVC = MenuViewController()
        menuVC.tabBarItem = UITabBarItem(
            title: "Menu",
            image: nil,
            tag: 2
        )
        
        let transactionsVC = TransactionsViewController()
        transactionsVC.tabBarItem = UITabBarItem(
            title: "Transactions",
            image: UIImage(systemName: "creditcard.fill"),
            tag: 3
        )
        
        let settingsVC = SettingsViewController()
        settingsVC.tabBarItem = UITabBarItem(
            title: "Settings",
            image: UIImage(systemName: "gearshape.fill"),
            tag: 4
        )
        
        viewControllers = [homeVC, investVC, menuVC, transactionsVC, settingsVC]
    }
    
    
    private func setupCenterButton() {
        let buttonSize: CGFloat = 60
        centerButton.frame = CGRect(x: (view.frame.width - buttonSize) / 2, y: -30, width: buttonSize, height: buttonSize)
        centerButton.layer.cornerRadius = buttonSize / 2
        centerButton.backgroundColor = UIColor.systemYellow
        centerButton.setImage(UIImage(systemName: "square.grid.2x2.fill"), for: .normal)
        centerButton.tintColor = .white
        centerButton.layer.shadowColor = UIColor.black.cgColor
        centerButton.layer.shadowOpacity = 0.3
        centerButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        centerButton.layer.shadowRadius = 5
        
        centerButton.addTarget(self, action: #selector(centerButtonTapped), for: .touchUpInside)
        
        tabBar.addSubview(centerButton)
        tabBar.bringSubviewToFront(centerButton)
    }
    
    @objc private func centerButtonTapped() {
        self.selectedIndex = 2
    }
}
