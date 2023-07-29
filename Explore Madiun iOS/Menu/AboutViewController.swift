//
//  AboutViewController.swift
//  Explore Madiun iOS
//
//  Created by Yusuf Saifudin on 27/07/23.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var tabsView: TabsView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "About"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabs()
    }
    
    private func setupTabs() {
        tabsView.tabs = [
            Tab(title: "Information"),
            Tab(title: "Release Version"),
            Tab(title: "Thanks"),
            Tab(title: "Libraries")
        ]
        
        tabsView.tabMode = .scrollable
        
        tabsView.titleColor = .white
        tabsView.backgroundColor = UIColor(named: "Primary")
        tabsView.indicatorColor = .white
        tabsView.titleFont = UIFont(name: "Lato", size: 14)!
        
        tabsView.collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .centeredVertically)
    }

}
