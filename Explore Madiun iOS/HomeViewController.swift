//
//  HomeViewController.swift
//  Explore Madiun iOS
//
//  Created by Yusuf Saifudin on 27/07/23.
//

import UIKit

class HomeViewController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    private func setupTabBar() {
        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.tintColor = UIColor(named: "Primary")
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
