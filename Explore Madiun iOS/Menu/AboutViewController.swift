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
        pageController.dataSource = self
        
        pageController.setViewControllers([showViewController(0)!], direction: .forward, animated: true, completion: nil)
        self.pageController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.pageController.view.topAnchor.constraint(equalTo: self.tabsView.bottomAnchor),
            self.pageController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.pageController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.pageController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        self.pageController.didMove(toParent: self)
    }
    
}

extension AboutViewController: TabsDelegate {
    
    func tabsViewDidSelectItemAt(position: Int) {
        if position != currentIndex {
            if position > currentIndex {
                self.pageController.setViewControllers([showViewController(position)!], direction: .forward, animated: true, completion: nil)
            } else {
                self.pageController.setViewControllers([showViewController(position)!], direction: .reverse, animated: true, completion: nil)
            }
            tabsView.collectionView.scrollToItem(at: IndexPath(item: position, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    func showViewController(_ index: Int) -> UIViewController? {
        if (self.tabsView.tabs.count == 0) || (index >= self.tabsView.tabs.count) {
            return nil
        }
        
        currentIndex = index
        if (index == 0){
            let id = "AboutInformationViewController"
            let contentVC = storyboard?.instantiateViewController(withIdentifier: id) as! AboutInformationViewController
            contentVC.pageIndex = index
            return contentVC
        } else if (index == 1){
            let id = "AboutChangelogViewController"
            let contentVC = storyboard?.instantiateViewController(withIdentifier: id) as! AboutChangelogViewController
            contentVC.pageIndex = index
            return contentVC
        } else if (index == 2){
            let id = "AboutThanksViewController"
            let contentVC = storyboard?.instantiateViewController(withIdentifier: id) as! AboutThanksViewController
            contentVC.pageIndex = index
            return contentVC
        } else {
            let id = "AboutLibraryViewController"
            let contentVC = storyboard?.instantiateViewController(withIdentifier: id) as! AboutLibraryViewController
            contentVC.pageIndex = index
            return contentVC
        }
    }
    
    func getVCPageIndex(_ viewController: UIViewController?) -> Int {
        switch viewController {
        case is AboutInformationViewController:
            let vc = viewController as! AboutInformationViewController
            return vc.pageIndex
        case is AboutChangelogViewController:
            let vc = viewController as! AboutChangelogViewController
            return vc.pageIndex
        case is AboutThanksViewController:
            let vc = viewController as! AboutThanksViewController
            return vc.pageIndex
        case is AboutLibraryViewController:
            let vc = viewController as! AboutLibraryViewController
            return vc.pageIndex
        default:
            let vc = viewController as! AboutInformationViewController
            return vc.pageIndex
        }
    }
}

extension AboutViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if finished {
            if completed {
                guard let vc = pageViewController.viewControllers?.first else { return }
                let index = getVCPageIndex(vc)
                let theAt = IndexPath(item: index, section: 0)
                tabsView.collectionView.selectItem(at: theAt, animated: true, scrollPosition: .centeredVertically)
                tabsView.collectionView.scrollToItem(at: theAt, at: .centeredHorizontally, animated: true)
            }
        }
    }
    
}

extension AboutViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc = pageViewController.viewControllers?.first
        var index: Int
        index = getVCPageIndex(vc)
        if index == tabsView.tabs.count {
            return nil
        } else {
            index += 1
            return self.showViewController(index)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc = pageViewController.viewControllers?.first
        var index: Int
        index = getVCPageIndex(vc)
        
        if index == 0 {
            return nil
        } else {
            index -= 1
            return self.showViewController(index)
        }
    }
}
