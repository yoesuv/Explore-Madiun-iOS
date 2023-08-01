//
//  AboutInformationViewController.swift
//  Explore Madiun iOS
//
//  Created by Yusuf Saifudin on 30/07/23.
//

import UIKit

class AboutInformationViewController: UIViewController {
    
    var pageIndex: Int!
    
    @IBOutlet weak var imageViewInformation: UIImageView!
    @IBOutlet weak var labelAppName: UILabel!
    @IBOutlet weak var labelAppVersion: UILabel!
    @IBOutlet weak var imageViewEmail: UIImageView!
    @IBOutlet weak var imageViewSocial: UIImageView!
    @IBOutlet weak var imageViewSupport: UIImageView!
    @IBOutlet weak var imageViewPolicy: UIImageView!
    @IBOutlet weak var imageViewRepo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageViewInformation.image = UIImage(named: "AppIcon60x60")
        self.labelAppName.text = "Explore Madiun"
        setupVersion()
        
        self.imageViewEmail.image = UIImage(systemName: "envelope")
        self.imageViewEmail.tintColor = .black
        self.imageViewSocial.image = UIImage(systemName: "xmark.circle")
        self.imageViewSocial.tintColor = .black
        self.imageViewSupport.image = UIImage(systemName: "heart.fill")
        self.imageViewSupport.tintColor = .systemPink
        self.imageViewPolicy.image = UIImage(systemName: "info.square")
        self.imageViewPolicy.tintColor = .black
        self.imageViewRepo.image = UIImage(systemName: "folder")
        self.imageViewRepo.tintColor = .black
    }
    
    private func setupVersion() {
        if let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") {
            self.labelAppVersion.text = "Version \(appVersion)"
        }
    }

}
