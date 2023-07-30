//
//  AboutViewController.swift
//  Explore Madiun iOS
//
//  Created by Yusuf Saifudin on 27/07/23.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var tabsView: TabsView!
    
    var currentIndex: Int = 0
    var pageController: UIPageViewController!
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "About"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabs()
        setupPageViewController()
    }
    
    override func viewDidLayoutSubviews() {
        tabsView.collectionView.collectionViewLayout.invalidateLayout()
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
        
        tabsView.delegate = self
        tabsView.collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .centeredVertically)
    }
    
    private func setupPageViewController() {
        self.pageController = storyboard?.instantiateViewController(withIdentifier: "AboutPageViewController") as! AboutPageViewController
        self.addChild(self.pageController)
        self.view.addSubview(self.pageController.view)
        
        pageController.delegate = self
    }

}

extension AboutViewController: TabsDelegate {
    
    func tabsViewDidSelectItemAt(position: Int) {
        print("AboutViewController # position \(position)")
    }
}

extension AboutViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
    }
}
