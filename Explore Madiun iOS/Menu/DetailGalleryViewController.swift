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
    
    var gallery: GalleryModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail Gallery"
        
        let imgUrl = URL(string: gallery?.image ?? "")
        self.imageViewDetailGallery.kf.setImage(with: imgUrl, placeholder: UIImage(named: "ImagePlaceholder"))
        self.labelGalleryDescription.text = gallery?.caption
    }

}
