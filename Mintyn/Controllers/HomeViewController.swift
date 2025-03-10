//
//  HomeViewController.swift
//  Mintyn
//
//  Created by Faruk Amoo on 08/03/2025.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - UI Elements
    let mintynLogoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "MintynLogo")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let profileImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "profile1")
        image.layer.cornerRadius = 20
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nyong, Asido"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .white
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let switchAccount: UIButton = {
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.titleLineBreakMode = .byTruncatingTail
        buttonConfig.attributedTitle = AttributedString("Switch Account", attributes: AttributeContainer([.font : UIFont.systemFont(ofSize: 10)]))
        buttonConfig.baseBackgroundColor = UIColor.darkGray.withAlphaComponent(0.6)
        buttonConfig.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15)
        buttonConfig.cornerStyle = .capsule
        
        let button = UIButton(configuration: buttonConfig, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "₦XXX.XXX"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let viewBalanceIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "eye.slash")
        image.tintColor = UIColor(red: 0.9, green: 0.7, blue: 0.0, alpha: 1.0) // Gold/yellow color
        image.contentMode = .scaleAspectFit
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let accountInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let accountTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Individual"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let accountNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "• 1101161297"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let accountTierLabel: UILabel = {
        let label = UILabel()
        label.text = "• Tier 3"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let copyAccountNumberIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "doc.on.doc.fill")
        image.tintColor = UIColor(red: 0.9, green: 0.7, blue: 0.0, alpha: 1.0) // Gold/yellow color
        image.contentMode = .scaleAspectFit
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let addMoneyButton: UIButton = {
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.image = UIImage(
            systemName: "plus",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 20)
        )
        buttonConfig.title = " Add Money"
        buttonConfig.baseForegroundColor = .white
        buttonConfig.baseBackgroundColor = UIColor.darkGray.withAlphaComponent(0.6)
        buttonConfig.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20)
        buttonConfig.cornerStyle = .capsule
        
        let button = UIButton(configuration: buttonConfig, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let transferButton: GradientButton = {
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.image = UIImage(
            systemName: "arrow.left.arrow.right",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 20)
        )
        buttonConfig.title = " Transfer"
        buttonConfig.baseForegroundColor = .white
        buttonConfig.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20)
        buttonConfig.cornerStyle = .capsule
        
        let button = GradientButton(configuration: buttonConfig, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let featureCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 15
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 60) / 3, height: 130)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let quickAccessLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        label.text = "Quick Access"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let quickAccessCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 20
        // 4 icons per row
        let itemWidth = (UIScreen.main.bounds.width - 100) / 4
        layout.itemSize = CGSize(width: itemWidth, height: 70)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // Feature data
    let featureTitles = ["Budget", "EasyCollect", "Business"]
    let featureColors: [UIColor] = [.systemIndigo, .systemGreen, .systemRed]
    
    // Quick access data
    let quickAccessTitles = ["Remita", "Airtime & Data", "Betting", "Business", "Card", "Gift Card", "Other bills", "Savings"]
    let quickAccessIcons = ["chart.bar.doc.horizontal", "iphone", "sportscourt", "briefcase.fill", "creditcard", "gift", "doc.plaintext", "banknote"]
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCollectionViews()
        setupTabBar()
    }
    
    // MARK: - Setup Methods
    func setupUI() {
        view.backgroundColor = .black
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set up navigation buttons
        let searchButton = navBarCustomButton(imageName: "magnifyingglass", backgroundColor: UIColor.darkGray.withAlphaComponent(0.6))
        let supportButton = navBarCustomButton(imageName: "headset", backgroundColor: UIColor.darkGray.withAlphaComponent(0.6))
        let notificationButton = navBarCustomButton(imageName: "bell", backgroundColor: UIColor.darkGray.withAlphaComponent(0.6))
        
        // Navigation buttons stack
        let navButtonsStack = UIStackView(arrangedSubviews: [searchButton, supportButton, notificationButton])
        navButtonsStack.axis = .horizontal
        navButtonsStack.spacing = 10
        navButtonsStack.distribution = .fillEqually
        navButtonsStack.translatesAutoresizingMaskIntoConstraints = false
        
        // Header stack with logo and nav buttons
        let headerStack = UIStackView(arrangedSubviews: [mintynLogoImageView, navButtonsStack])
        headerStack.axis = .horizontal
        headerStack.distribution = .equalSpacing
        headerStack.alignment = .center
        headerStack.translatesAutoresizingMaskIntoConstraints = false
        
        // Profile section
        let profileStack = UIStackView(arrangedSubviews: [profileImageView, nameLabel])
        profileStack.axis = .horizontal
        profileStack.spacing = 10
        profileStack.alignment = .center
        profileStack.translatesAutoresizingMaskIntoConstraints = false
        
        let profileRow = UIStackView(arrangedSubviews: [profileStack, switchAccount])
        profileRow.axis = .horizontal
        profileRow.distribution = .equalSpacing
        profileRow.alignment = .center
        profileRow.translatesAutoresizingMaskIntoConstraints = false
        
        // Balance section
        let balanceStack = UIStackView(arrangedSubviews: [balanceLabel, viewBalanceIcon])
        balanceStack.axis = .horizontal
        balanceStack.spacing = 10
        balanceStack.alignment = .center
        balanceStack.distribution = .fill
        balanceStack.translatesAutoresizingMaskIntoConstraints = false
        
        // Account info section
        let accountInfoStack = UIStackView(arrangedSubviews: [accountTypeLabel, accountNumberLabel, accountTierLabel, copyAccountNumberIcon])
        accountInfoStack.axis = .horizontal
        accountInfoStack.spacing = 8
        accountInfoStack.alignment = .center
        accountInfoStack.translatesAutoresizingMaskIntoConstraints = false
        
        // Action buttons section
        let actionButtonsStack = UIStackView(arrangedSubviews: [addMoneyButton, transferButton])
        actionButtonsStack.axis = .horizontal
        actionButtonsStack.spacing = 15
        actionButtonsStack.distribution = .fillEqually
        actionButtonsStack.translatesAutoresizingMaskIntoConstraints = false
        
        // Quick access section stack
        let quickAccessStack = UIStackView(arrangedSubviews: [quickAccessLabel, quickAccessCollectionView])
        quickAccessStack.axis = .vertical
        quickAccessStack.spacing = 15
        quickAccessStack.translatesAutoresizingMaskIntoConstraints = false
        
        // Add all components to main stack
        let mainStack = UIStackView(arrangedSubviews: [
            headerStack,
            profileRow,
        ])
        mainStack.axis = .vertical
        mainStack.spacing = 20
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        let lowerStack = UIStackView(arrangedSubviews: [
            actionButtonsStack,
            featureCollectionView,
            quickAccessStack
        ])
        lowerStack.axis = .vertical
        lowerStack.spacing = 20
        lowerStack.setCustomSpacing(30, after: actionButtonsStack)
        lowerStack.setCustomSpacing(30, after: featureCollectionView)
        lowerStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        view.addSubview(mainStack)
        view.addSubview(balanceStack)
        view.addSubview(accountInfoStack)
        view.addSubview(lowerStack)
        
        
        // Setup constraints
        NSLayoutConstraint.activate([
            // Scroll view constraints
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Content view constraints (inside the scroll view)
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // Main stack constraints
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // Balance stack constraints
            balanceStack.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 30),
            balanceStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            // Account info stack constraints
            accountInfoStack.topAnchor.constraint(equalTo: balanceStack.bottomAnchor, constant: 15),
            accountInfoStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            // Lower stack constraints
            lowerStack.topAnchor.constraint(equalTo: accountInfoStack.bottomAnchor, constant: 30),
            lowerStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            lowerStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // Set bottom constraint to ensure scrolling works properly
            lowerStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            // Size constraints for certain elements
            profileImageView.widthAnchor.constraint(equalToConstant: 40),
            profileImageView.heightAnchor.constraint(equalToConstant: 40),
            featureCollectionView.heightAnchor.constraint(equalToConstant: 150),
            quickAccessCollectionView.heightAnchor.constraint(equalToConstant: 200),
            
            // Navigation buttons
            searchButton.widthAnchor.constraint(equalToConstant: 40),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            supportButton.widthAnchor.constraint(equalToConstant: 40),
            supportButton.heightAnchor.constraint(equalToConstant: 40),
            notificationButton.widthAnchor.constraint(equalToConstant: 40),
            notificationButton.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        // Setup gestures
        let viewBalanceGesture = UITapGestureRecognizer(target: self, action: #selector(toggleBalanceVisibility))
        viewBalanceIcon.addGestureRecognizer(viewBalanceGesture)
        
        let copyAccountGesture = UITapGestureRecognizer(target: self, action: #selector(copyAccountNumber))
        copyAccountNumberIcon.addGestureRecognizer(copyAccountGesture)
    }
    
    func setupCollectionViews() {
        // Register cells
        featureCollectionView.register(FeatureCell.self, forCellWithReuseIdentifier: "FeatureCell")
        quickAccessCollectionView.register(QuickAccessCell.self, forCellWithReuseIdentifier: "QuickAccessCell")
        
        // Set delegates
        featureCollectionView.delegate = self
        featureCollectionView.dataSource = self
        quickAccessCollectionView.delegate = self
        quickAccessCollectionView.dataSource = self
    }
    
    func setupTabBar() {
        // Create a custom tab bar if needed
        let tabBar = CurvedTabBar()
        
        // Set up tab bar items
        let homeItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        let investItem = UITabBarItem(title: "Invest", image: UIImage(systemName: "chart.bar.fill"), tag: 1)
        let menuItem = UITabBarItem(title: "Menu", image: UIImage(systemName: "square.grid.2x2.fill"), tag: 2)
        let transactionsItem = UITabBarItem(title: "Transactions", image: UIImage(systemName: "creditcard.fill"), tag: 3)
        let settingsItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
        
        // Customize the tab bar
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().tintColor = UIColor(red: 0.9, green: 0.7, blue: 0.0, alpha: 1.0) // Gold/yellow color
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0.9, green: 0.7, blue: 0.0, alpha: 1.0)], for: .selected)
    }
    
    // MARK: - Action Methods
    @objc func toggleBalanceVisibility() {
        let isHidden = balanceLabel.text == "₦XXX.XXX"
        balanceLabel.text = isHidden ? "₦123,456.78" : "₦XXX.XXX"
        viewBalanceIcon.image = UIImage(systemName: isHidden ? "eye" : "eye.slash")
    }
    
    @objc func copyAccountNumber() {
        // Extract account number from label
        if let accountText = accountNumberLabel.text {
            let accountNumber = accountText.replacingOccurrences(of: "• ", with: "")
            UIPasteboard.general.string = accountNumber
            
            // Show a brief confirmation
            let alert = UIAlertController(title: "Copied", message: "Account number copied to clipboard", preferredStyle: .alert)
            present(alert, animated: true)
            
            // Dismiss after a short delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                alert.dismiss(animated: true)
            }
        }
    }
    
    // Helper method to create navigation bar buttons
    func navBarCustomButton(imageName: String, backgroundColor: UIColor = UIColor.darkGray.withAlphaComponent(0.6)) -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: imageName), for: .normal)
        button.tintColor = .white
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // Set size constraints
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 40),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        return button
    }
}

// MARK: - UICollectionView Extensions
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == featureCollectionView {
            return featureTitles.count
        } else {
            return quickAccessTitles.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == featureCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeatureCell", for: indexPath) as! FeatureCell
            cell.configure(title: featureTitles[indexPath.item],
                           color: featureColors[indexPath.item], icon: UIImage(named: featureTitles[indexPath.item]))
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuickAccessCell", for: indexPath) as! QuickAccessCell
            cell.configure(title: quickAccessTitles[indexPath.item],
                           iconName: quickAccessIcons[indexPath.item])
            return cell
        }
    }
}
