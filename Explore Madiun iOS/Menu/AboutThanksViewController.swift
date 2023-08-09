//
//  AboutThanksViewController.swift
//  Explore Madiun iOS
//
//  Created by Yusuf Saifudin on 30/07/23.
//

import UIKit

class AboutThanksViewController: UIViewController {
    
    var pageIndex: Int!
    
    @IBOutlet weak var labelThanks: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelThanks.text = "terima kasih kepada blog-blog maupun perorangan yang fotonya dimuat dalam aplikasi ini, dan tidak bisa disebutkan satu persatu (kalian luar biasa....)."
    }

}
