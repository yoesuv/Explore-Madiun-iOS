//
//  DetailGalleryViewController.swift
//  Explore Madiun iOS
//
//  Created by Yusuf Saifudin on 31/07/23.
//

import UIKit

class DetailGalleryViewController: UIViewController {
    
    @IBOutlet weak var imageViewDetailGallery: UIImageView!
    @IBOutlet weak var labelGalleryDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail Gallery"
        
        let imgUrl = URL(string: "https://lh3.googleusercontent.com/-VdGBzQkMOZI/VoHY6IZRcTI/AAAAAAAAB6I/V68FY5RlsgQ/s640-Ic42/alun_alun_madiun.jpg")
        self.imageViewDetailGallery.kf.setImage(with: imgUrl)
        self.labelGalleryDescription.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
    }

}
