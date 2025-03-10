//
//  SettingsViewController.swift
//  Mintyn
//
//  Created by Faruk Amoo on 08/03/2025.
//

import UIKit

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    private var expandedSections: Set<Int> = []
    
    private let settingsData: [(section: String, icon: String?, items: [String])] = [
        ("Profile", "person", ["Personal Information", "Employment Information", "Identification Information", "Next of Kin"]),
        ("Account Management", "folder", []),
        ("Referrals", "megaphone", []),
        ("Legal", "shield", []),
        ("Help and Support", "questionmark.circle", [
            "Terms and Conditions", "Privacy Policy", "Contact Support"
        ]),
        ("System", "gearshape", []),
        ("Switch Account", "arrow.2.circlepath", []),
        ("Log Out", "power", []) // Log Out section
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        title = "Settings"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor.darkGray
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expandedSections.contains(section) ? settingsData[section].items.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = settingsData[indexPath.section].items[indexPath.row]
        
        cell.textLabel?.text = item
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .black
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .black
        headerView.tag = section
        
        let iconSize: CGFloat = 20
        let iconImageView = UIImageView(image: UIImage(systemName: settingsData[section].icon ?? ""))
        iconImageView.tintColor = section == settingsData.count - 1 ? .red : .white
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.frame = CGRect(x: 16, y: 10, width: iconSize, height: iconSize)
        headerView.addSubview(iconImageView)
        
        let label = UILabel()
        label.text = settingsData[section].section
        label.textColor = section == settingsData.count - 1 ? .red : .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.frame = CGRect(x: 44, y: 5, width: tableView.bounds.width - 60, height: 30)
        headerView.addSubview(label)
        
        // Check if this section has sub-items to determine if it should be expandable
        if !settingsData[section].items.isEmpty {
            let arrowImageView = UIImageView(image: UIImage(systemName: expandedSections.contains(section) ? "chevron.down" : "chevron.right"))
            arrowImageView.tintColor = .white
            arrowImageView.contentMode = .scaleAspectFit
            arrowImageView.frame = CGRect(x: tableView.bounds.width - 36, y: 10, width: 20, height: 20)
            headerView.addSubview(arrowImageView)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSectionTap(_:)))
        headerView.addGestureRecognizer(tapGesture)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    @objc private func handleSectionTap(_ sender: UITapGestureRecognizer) {
        guard let section = sender.view?.tag else { return }
        
        // Log Out section - Show logout confirmation
        if section == settingsData.count - 1 {
            showLogoutAlert()
            return
        }
        
        // Toggle section expansion only if it has sub-items
        if !settingsData[section].items.isEmpty {
            if expandedSections.contains(section) {
                expandedSections.remove(section)
            } else {
                expandedSections.insert(section)
            }
            
            self.tableView.reloadSections(IndexSet(integer: section), with: .fade)
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Tapped on \(settingsData[indexPath.section].items[indexPath.row])")
    }
    
    private func showLogoutAlert() {
        let alert = UIAlertController(title: "Log Out", message: "Are you sure you want to log out?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { _ in
            print("User logged out") // Handle actual log-out logic here
            self.navigateToLoginViewController()
        }))
        present(alert, animated: true)
    }
    
    private func navigateToLoginViewController() {
        let homeViewController = LoginViewController() // Initialize your HomeViewController
        homeViewController.modalPresentationStyle = .fullScreen // Set the presentation style (optional)
        present(homeViewController, animated: true, completion: nil)
    }
}
