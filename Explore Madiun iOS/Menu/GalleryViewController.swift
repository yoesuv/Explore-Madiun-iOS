//
//  GalleryViewController.swift
//  Explore Madiun iOS
//
//  Created by Yusuf Saifudin on 27/07/23.
//

import UIKit

class GalleryViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Gallery"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
