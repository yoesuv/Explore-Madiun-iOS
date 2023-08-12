//
//  DetailPlaceViewController.swift
//  Explore Madiun iOS
//
//  Created by Yusuf Saifudin on 31/07/23.
//

import UIKit
import Kingfisher

class DetailPlaceViewController: UIViewController {
    
    @IBOutlet weak var imageViewDetailPlace: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    var place: PlaceModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail Place"
        
        let imgUrl = URL(string: place?.gambar ?? "")
        self.imageViewDetailPlace.kf.setImage(with: imgUrl, placeholder: UIImage(named: "ImagePlaceholder"))
        labelName.text = place?.nama
        labelDescription.text = place?.deskripsi
    }

}
