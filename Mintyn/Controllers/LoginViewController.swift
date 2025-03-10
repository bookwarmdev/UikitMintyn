//
//  LoginViewController.swift
//  Mintyn
//
//  Created by Faruk Amoo on 09/03/2025.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    private var selectedCountry = Country(code: "NG", name: "Nigeria", dialCode: "+234")
    
    // Sample countries data
    private let countries = [
        Country(code: "NG", name: "Nigeria", dialCode: "+234"),
        Country(code: "US", name: "United States", dialCode: "+1"),
        Country(code: "GB", name: "United Kingdom", dialCode: "+44"),
        Country(code: "CA", name: "Canada", dialCode: "+1"),
        Country(code: "GH", name: "Ghana", dialCode: "+233"),
        Country(code: "ZA", name: "South Africa", dialCode: "+27"),
        Country(code: "KE", name: "Kenya", dialCode: "+254"),
        Country(code: "IN", name: "India", dialCode: "+91"),
        Country(code: "AU", name: "Australia", dialCode: "+61"),
        Country(code: "DE", name: "Germany", dialCode: "+49"),
        Country(code: "FR", name: "France", dialCode: "+33"),
        Country(code: "BR", name: "Brazil", dialCode: "+55"),
        Country(code: "JP", name: "Japan", dialCode: "+81"),
        Country(code: "CN", name: "China", dialCode: "+86"),
        Country(code: "RU", name: "Russia", dialCode: "+7")
    ]
    
    // MARK: - UI Elements
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let featureTilesContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let pageIndicatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone Number"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneNumberContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3)
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let countryFlagButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("🇳🇬", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let countryCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "+234"
        label.textColor = UIColor.white.withAlphaComponent(0.8)
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "802 123 4567"
        textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.keyboardType = .phonePad
        textField.accessibilityIdentifier = "phoneTextField"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3)
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter password"
        textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.isSecureTextEntry = true
        textField.accessibilityIdentifier = "passwordTextField"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordVisibilityButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.tintColor = UIColor.white.withAlphaComponent(0.6)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let rememberMeContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let rememberMeCheckbox: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let rememberMeLabel: UILabel = {
        let label = UILabel()
        label.text = "Remember me"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot password?", for: .normal)
        button.setTitleColor(UIColor(red: 0.9, green: 0.7, blue: 0.0, alpha: 1.0), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = UIColor(red: 0.9, green: 0.7, blue: 0.0, alpha: 1.0)
        button.layer.cornerRadius = 10
        button.accessibilityIdentifier = "loginButton"
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let registerNewDeviceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register new device", for: .normal)
        button.setTitleColor(UIColor(red: 0.9, green: 0.7, blue: 0.0, alpha: 1.0), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let poweredByLabel: UILabel = {
        let label = UILabel()
        label.text = "Powered by FINEX MFB"
        label.textColor = UIColor.white.withAlphaComponent(0.6)
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let versionLabel: UILabel = {
        let label = UILabel()
        label.text = "Version 13.84"
        label.textColor = UIColor.white.withAlphaComponent(0.6)
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupScrollView()
        setupUI()
        setupActions()
        setupTextFields() // Added text field setup
    }
    
    // MARK: - Setup Methods
    private func setupView() {
        view.backgroundColor = .black
        // Dismiss keyboard when tapping outside text fields
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    private func setupUI() {
        contentView.addSubview(welcomeLabel)
        contentView.addSubview(featureTilesContainer)
        setupFeatureTiles()
        contentView.addSubview(pageIndicatorView)
        setupPageIndicator()
        
        contentView.addSubview(phoneNumberLabel)
        contentView.addSubview(phoneNumberContainer)
        phoneNumberContainer.addSubview(countryFlagButton)
        phoneNumberContainer.addSubview(countryCodeLabel)
        phoneNumberContainer.addSubview(phoneTextField)
        
        contentView.addSubview(passwordLabel)
        contentView.addSubview(passwordContainer)
        passwordContainer.addSubview(passwordTextField)
        passwordContainer.addSubview(passwordVisibilityButton)
        
        contentView.addSubview(rememberMeContainer)
        rememberMeContainer.addSubview(rememberMeCheckbox)
        rememberMeContainer.addSubview(rememberMeLabel)
        contentView.addSubview(forgotPasswordButton)
        
        contentView.addSubview(loginButton)
        contentView.addSubview(registerNewDeviceButton)
        contentView.addSubview(poweredByLabel)
        contentView.addSubview(versionLabel)
        
        setupConstraints()
    }
    
    private func setupTextFields() {
        phoneTextField.isUserInteractionEnabled = true
        passwordTextField.isUserInteractionEnabled = true
                
        // Add a tap gesture to ensure phoneTextField becomes first responder
           let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handlePhoneTextFieldTap))
           phoneTextField.addGestureRecognizer(tapGesture)
        
//         Create toolbars without auto layout constraints
        let createToolbar = { () -> UIToolbar in
            let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.dismissKeyboard))
            toolbar.items = [flexSpace, doneButton]
            return toolbar
        }
        
        
        phoneTextField.inputAccessoryView = createToolbar()
        passwordTextField.inputAccessoryView = createToolbar()
        
    }
    
    @objc private func handlePhoneTextFieldTap() {
        phoneTextField.becomeFirstResponder()
    }
    
   
    
    private func setupFeatureTiles() {
        // Create a UIScrollView for paging between tile sets
        let tileScrollView = UIScrollView()
        tileScrollView.isPagingEnabled = true
        tileScrollView.showsHorizontalScrollIndicator = false
        tileScrollView.translatesAutoresizingMaskIntoConstraints = false
        featureTilesContainer.addSubview(tileScrollView)
        
        NSLayoutConstraint.activate([
            tileScrollView.topAnchor.constraint(equalTo: featureTilesContainer.topAnchor),
            tileScrollView.leadingAnchor.constraint(equalTo: featureTilesContainer.leadingAnchor),
            tileScrollView.trailingAnchor.constraint(equalTo: featureTilesContainer.trailingAnchor),
            tileScrollView.bottomAnchor.constraint(equalTo: featureTilesContainer.bottomAnchor),
            tileScrollView.heightAnchor.constraint(equalToConstant: 155)
        ])
        
        // Create tile pages
        let screenWidth = UIScreen.main.bounds.width - 40 // Account for padding
        let tileSize = (screenWidth - 15) / 2 // 15 is spacing between tiles
        
        // Page 1 tiles
        let page1 = UIView()
        page1.translatesAutoresizingMaskIntoConstraints = false
        tileScrollView.addSubview(page1)
        
        // Page 2 tiles
        let page2 = UIView()
        page2.translatesAutoresizingMaskIntoConstraints = false
        tileScrollView.addSubview(page2)
        
        // Set up page constraints
        NSLayoutConstraint.activate([
            page1.topAnchor.constraint(equalTo: tileScrollView.topAnchor),
            page1.leadingAnchor.constraint(equalTo: tileScrollView.leadingAnchor),
            page1.heightAnchor.constraint(equalTo: tileScrollView.heightAnchor),
            page1.widthAnchor.constraint(equalToConstant: screenWidth),
            
            page2.topAnchor.constraint(equalTo: tileScrollView.topAnchor),
            page2.leadingAnchor.constraint(equalTo: page1.trailingAnchor),
            page2.trailingAnchor.constraint(equalTo: tileScrollView.trailingAnchor),
            page2.heightAnchor.constraint(equalTo: tileScrollView.heightAnchor),
            page2.widthAnchor.constraint(equalToConstant: screenWidth)
        ])
        
        // Set content size to allow scrolling
        tileScrollView.contentSize = CGSize(width: screenWidth * 2, height: 155)
        
        // Page 1 Tiles
        let tile1 = createFeatureTile(icon: "n.square.fill", title: "EasyCollect", tileSize: tileSize)
        let tile2 = createFeatureTile(icon: "shield.fill", title: "Open an Account", tileSize: tileSize)
        let tile3 = createFeatureTile(icon: "doc.fill", title: "CAC Business Registration", tileSize: tileSize)
        let tile4 = createFeatureTile(icon: "person.fill", title: "Contact Support", tileSize: tileSize)
        
        // Page 2 Tiles
        let tile5 = createFeatureTile(icon: "creditcard.fill", title: "Virtual Cards", tileSize: tileSize)
        let tile6 = createFeatureTile(icon: "lock.shield.fill", title: "Insurance", tileSize: tileSize)
        let tile7 = createFeatureTile(icon: "creditcard.circle.fill", title: "NCTO Card Activation", tileSize: tileSize)
        let tile8 = createFeatureTile(icon: "arrow.left.arrow.right", title: "Transfer Money", tileSize: tileSize)
        
        // Add tiles to page 1
        page1.addSubview(tile1)
        page1.addSubview(tile2)
        page1.addSubview(tile3)
        page1.addSubview(tile4)
        
        // Add tiles to page 2
        page2.addSubview(tile5)
        page2.addSubview(tile6)
        page2.addSubview(tile7)
        page2.addSubview(tile8)
        
        // Layout tiles on page 1
        NSLayoutConstraint.activate([
            tile1.topAnchor.constraint(equalTo: page1.topAnchor),
            tile1.leadingAnchor.constraint(equalTo: page1.leadingAnchor),
            tile1.widthAnchor.constraint(equalToConstant: tileSize),
            tile1.heightAnchor.constraint(equalToConstant: 70),
            
            tile2.topAnchor.constraint(equalTo: page1.topAnchor),
            tile2.leadingAnchor.constraint(equalTo: tile1.trailingAnchor, constant: 15),
            tile2.widthAnchor.constraint(equalToConstant: tileSize),
            tile2.heightAnchor.constraint(equalToConstant: 70),
            
            tile3.topAnchor.constraint(equalTo: tile1.bottomAnchor, constant: 15),
            tile3.leadingAnchor.constraint(equalTo: page1.leadingAnchor),
            tile3.widthAnchor.constraint(equalToConstant: tileSize),
            tile3.heightAnchor.constraint(equalToConstant: 70),
            
            tile4.topAnchor.constraint(equalTo: tile2.bottomAnchor, constant: 15),
            tile4.leadingAnchor.constraint(equalTo: tile3.trailingAnchor, constant: 15),
            tile4.widthAnchor.constraint(equalToConstant: tileSize),
            tile4.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        // Layout tiles on page 2
        NSLayoutConstraint.activate([
            tile5.topAnchor.constraint(equalTo: page2.topAnchor),
            tile5.leadingAnchor.constraint(equalTo: page2.leadingAnchor),
            tile5.widthAnchor.constraint(equalToConstant: tileSize),
            tile5.heightAnchor.constraint(equalToConstant: 70),
            
            tile6.topAnchor.constraint(equalTo: page2.topAnchor),
            tile6.leadingAnchor.constraint(equalTo: tile5.trailingAnchor, constant: 15),
            tile6.widthAnchor.constraint(equalToConstant: tileSize),
            tile6.heightAnchor.constraint(equalToConstant: 70),
            
            tile7.topAnchor.constraint(equalTo: tile5.bottomAnchor, constant: 15),
            tile7.leadingAnchor.constraint(equalTo: page2.leadingAnchor),
            tile7.widthAnchor.constraint(equalToConstant: tileSize),
            tile7.heightAnchor.constraint(equalToConstant: 70),
            
            tile8.topAnchor.constraint(equalTo: tile6.bottomAnchor, constant: 15),
            tile8.leadingAnchor.constraint(equalTo: tile7.trailingAnchor, constant: 15),
            tile8.widthAnchor.constraint(equalToConstant: tileSize),
            tile8.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        // Update the page indicator to show which page is active
        tileScrollView.delegate = self
    }
    
    private func createFeatureTile(icon: String, title: String, tileSize: CGFloat) -> UIView {
        let tileView = UIView()
        tileView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3)
        tileView.layer.cornerRadius = 15
        tileView.translatesAutoresizingMaskIntoConstraints = false
        
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(systemName: icon)
        iconImageView.tintColor = UIColor(red: 0.9, green: 0.7, blue: 0.0, alpha: 1.0)
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 2
        
        tileView.addSubview(iconImageView)
        tileView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: tileView.leadingAnchor, constant: 15),
            iconImageView.centerYAnchor.constraint(equalTo: tileView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: tileView.trailingAnchor, constant: -10),
            titleLabel.centerYAnchor.constraint(equalTo: tileView.centerYAnchor)
        ])
        
        return tileView
    }
    
    private func setupPageIndicator() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        pageIndicatorView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: pageIndicatorView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: pageIndicatorView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: pageIndicatorView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: pageIndicatorView.bottomAnchor)
        ])
        
        for i in 0..<2 {
            let circleView = UIView()
            circleView.layer.cornerRadius = 4
            circleView.translatesAutoresizingMaskIntoConstraints = false
            
            if i == 0 {
                circleView.backgroundColor = UIColor(red: 0.9, green: 0.7, blue: 0.0, alpha: 1.0)
            } else {
                circleView.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
            }
            
            stackView.addArrangedSubview(circleView)
            
            NSLayoutConstraint.activate([
                circleView.widthAnchor.constraint(equalToConstant: 8),
                circleView.heightAnchor.constraint(equalToConstant: 8)
            ])
        }
    }
    
    private func setupConstraints() {
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: padding),
            welcomeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            featureTilesContainer.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: padding),
            featureTilesContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            featureTilesContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            
            pageIndicatorView.topAnchor.constraint(equalTo: featureTilesContainer.bottomAnchor, constant: 15),
            pageIndicatorView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pageIndicatorView.heightAnchor.constraint(equalToConstant: 10),
            
            phoneNumberLabel.topAnchor.constraint(equalTo: pageIndicatorView.bottomAnchor, constant: 25),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            
            phoneNumberContainer.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 8),
            phoneNumberContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            phoneNumberContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            phoneNumberContainer.heightAnchor.constraint(equalToConstant: 50),
            
            countryFlagButton.leadingAnchor.constraint(equalTo: phoneNumberContainer.leadingAnchor, constant: 10),
            countryFlagButton.centerYAnchor.constraint(equalTo: phoneNumberContainer.centerYAnchor),
            countryFlagButton.widthAnchor.constraint(equalToConstant: 30),
            
            countryCodeLabel.leadingAnchor.constraint(equalTo: countryFlagButton.trailingAnchor, constant: 5),
            countryCodeLabel.centerYAnchor.constraint(equalTo: phoneNumberContainer.centerYAnchor),
            countryCodeLabel.widthAnchor.constraint(equalToConstant: 45),
            
            phoneTextField.leadingAnchor.constraint(equalTo: countryCodeLabel.trailingAnchor, constant: 10),
            phoneTextField.trailingAnchor.constraint(equalTo: phoneNumberContainer.trailingAnchor, constant: -10),
            phoneTextField.centerYAnchor.constraint(equalTo: phoneNumberContainer.centerYAnchor),
//            
            passwordLabel.topAnchor.constraint(equalTo: phoneNumberContainer.bottomAnchor, constant: 15),

            passwordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            
            passwordContainer.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            passwordContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            passwordContainer.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.leadingAnchor.constraint(equalTo: passwordContainer.leadingAnchor, constant: 10),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordVisibilityButton.leadingAnchor, constant: -10),
            passwordTextField.centerYAnchor.constraint(equalTo: passwordContainer.centerYAnchor),
            
            passwordVisibilityButton.trailingAnchor.constraint(equalTo: passwordContainer.trailingAnchor, constant: -10),
            passwordVisibilityButton.centerYAnchor.constraint(equalTo: passwordContainer.centerYAnchor),
            passwordVisibilityButton.widthAnchor.constraint(equalToConstant: 30),
            
            rememberMeContainer.topAnchor.constraint(equalTo: passwordContainer.bottomAnchor, constant: 15),
            rememberMeContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            rememberMeContainer.heightAnchor.constraint(equalToConstant: 24),
            
            rememberMeCheckbox.leadingAnchor.constraint(equalTo: rememberMeContainer.leadingAnchor),
            rememberMeCheckbox.centerYAnchor.constraint(equalTo: rememberMeContainer.centerYAnchor),
            rememberMeCheckbox.widthAnchor.constraint(equalToConstant: 24),
            rememberMeCheckbox.heightAnchor.constraint(equalToConstant: 24),
            
            rememberMeLabel.leadingAnchor.constraint(equalTo: rememberMeCheckbox.trailingAnchor, constant: 8),
            rememberMeLabel.centerYAnchor.constraint(equalTo: rememberMeContainer.centerYAnchor),
            
            forgotPasswordButton.centerYAnchor.constraint(equalTo: rememberMeContainer.centerYAnchor),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            
            loginButton.topAnchor.constraint(equalTo: rememberMeContainer.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            registerNewDeviceButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 40),
            registerNewDeviceButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            poweredByLabel.topAnchor.constraint(equalTo: registerNewDeviceButton.bottomAnchor, constant: 20),
            poweredByLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            versionLabel.topAnchor.constraint(equalTo: poweredByLabel.bottomAnchor, constant: 5),
            versionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            versionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
        ])
    }
    
    private func setupActions() {
        countryFlagButton.addTarget(self, action: #selector(showCountryPicker), for: .touchUpInside)
        passwordVisibilityButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        rememberMeCheckbox.addTarget(self, action: #selector(toggleRememberMe), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordTapped), for: .touchUpInside)
        registerNewDeviceButton.addTarget(self, action: #selector(registerNewDeviceTapped), for: .touchUpInside)
    }
    
    // MARK: - Action Methods
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func showCountryPicker() {
        let countryPickerVC = CountryPickerViewController()
        countryPickerVC.countries = countries
        countryPickerVC.selectedCountry = selectedCountry
        countryPickerVC.delegate = self
        countryPickerVC.modalPresentationStyle = .pageSheet
        
            if let sheet = countryPickerVC.sheetPresentationController {
                sheet.detents = [.medium(), .large()]
                sheet.prefersGrabberVisible = true
            }
        
        present(countryPickerVC, animated: true)
    }
    
    @objc private func togglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()
        let imageName = passwordTextField.isSecureTextEntry ? "eye" : "eye.slash"
        passwordVisibilityButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc private func toggleRememberMe() {
        let isChecked = rememberMeCheckbox.currentImage?.accessibilityIdentifier == "checkmark.square.fill"
        let imageName = isChecked ? "square" : "checkmark.square.fill"
        rememberMeCheckbox.setImage(UIImage(systemName: imageName), for: .normal)
        rememberMeCheckbox.tintColor = isChecked ? .white : UIColor(red: 0.9, green: 0.7, blue: 0.0, alpha: 1.0)
    }
    
    @objc private func loginButtonTapped() {
        // Handle login
        
        // Get the entered phone number and password
           let enteredPhoneNumber =  "\(selectedCountry.dialCode)\(phoneTextField.text ?? "")"
           let enteredPassword = passwordTextField.text ?? ""
           
           // Define the correct credentials
           let correctPhoneNumber = "+2348110203040"
           let correctPassword = "Test@123"
           
           // Validate the credentials
           if enteredPhoneNumber == correctPhoneNumber && enteredPassword == correctPassword {
               // Credentials are correct, navigate to HomeViewController
               navigateToHomeViewController()
           } else {
               // Credentials are incorrect, show an error message
               showErrorAlert(message: "Invalid phone number or password. Please try again.")
           }
    }
    
    private func navigateToHomeViewController() {
        let navVC = CustomTabBarController() // Initialize your HomeViewController
        navVC.modalPresentationStyle = .fullScreen // Set the presentation style (optional)
        present(navVC, animated: true, completion: nil)
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func forgotPasswordTapped() {
        // Handle forgot password
        print("Forgot password tapped")
    }
    
    @objc private func registerNewDeviceTapped() {
        // Handle register new device
        print("Register new device tapped")
    }
}

// MARK: - CountryPickerViewControllerDelegate
extension LoginViewController: CountryPickerViewControllerDelegate {
    func countryPicker(_ picker: CountryPickerViewController, didSelectCountry country: Country) {
        selectedCountry = country
        countryFlagButton.setTitle(country.flag, for: .normal)
        countryCodeLabel.text = country.dialCode
    }
}

// MARK: - CountryPickerViewController
protocol CountryPickerViewControllerDelegate: AnyObject {
    func countryPicker(_ picker: CountryPickerViewController, didSelectCountry country: Country)
}

class CountryPickerViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    weak var delegate: CountryPickerViewControllerDelegate?
    var countries: [Country] = []
    var selectedCountry: Country!
    private var filteredCountries: [Country] = []
    
    // MARK: - UI Elements
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search country"
        searchBar.barStyle = .black
        searchBar.searchTextField.textColor = .white
        searchBar.tintColor = .white
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CountryCell")
        return tableView
    }()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupSearchBar()
        setupTableView()
        
        // Initialize filteredCountries with all countries
        filteredCountries = countries
    }
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    private func setupSearchBar() {
        view.addSubview(searchBar)
        searchBar.delegate = self
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        
        let country = filteredCountries[indexPath.row]
        
        cell.textLabel?.text = "\(country.flag) \(country.name)"
        cell.detailTextLabel?.text = country.dialCode
        
        if country.code == selectedCountry.code {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = filteredCountries[indexPath.row]
        delegate?.countryPicker(self, didSelectCountry: selectedCountry)
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredCountries = countries
        } else {
            filteredCountries = countries.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        tableView.reloadData()
    }
}


extension LoginViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        updatePageIndicator(pageNumber: Int(pageNumber))
    }
    
    private func updatePageIndicator(pageNumber: Int) {
        let indicatorStackView = pageIndicatorView.subviews.first as? UIStackView
        
        for (index, view) in (indicatorStackView?.arrangedSubviews ?? []).enumerated() {
            if index == pageNumber {
                view.backgroundColor = UIColor(red: 0.9, green: 0.7, blue: 0.0, alpha: 1.0)
            } else {
                view.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
            }
        }
    }
}
