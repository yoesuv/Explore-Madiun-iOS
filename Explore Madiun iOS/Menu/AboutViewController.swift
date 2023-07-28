//
//  AboutViewController.swift
//  Explore Madiun iOS
//
//  Created by Yusuf Saifudin on 27/07/23.
//

import UIKit

class AboutViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "About"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
