//
//  HomeViewController.swift
//  Explore Madiun iOS
//
//  Created by Yusuf Saifudin on 27/07/23.
//

import UIKit

class HomeViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "Primary")
        appearance.shadowColor = UIColor(named: "Primary")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "Pacifico", size: 20)!]
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationController?.navigationBar.compactAppearance = appearance
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = .white
        
        setupTabBar()
    }
    
    private func setupTabBar() {
        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.tintColor = UIColor(named: "Primary")
        
        let appearance = UITabBarItem.appearance()
        appearance.setTitleTextAttributes([.font: UIFont(name: "Lato", size: 11)!], for: .normal)
        
        if let items = self.tabBar.items {
            items[0].title = "List Place"
            items[0].image = UIImage(systemName: "list.bullet.rectangle")
            items[1].title = "Gallery"
            items[1].image = UIImage(systemName: "photo.on.rectangle")
            items[2].title = "Maps"
            items[2].image = UIImage(systemName: "map")
            items[3].title = "About"
            items[3].image = UIImage(systemName: "info.circle.fill")
        }
    }
}
