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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageViewInformation.image = UIImage(named: "AppIcon60x60")
        self.labelAppName.text = "Explore Madiun"
        setupVersion()
    }
    
    private func setupVersion() {
        if let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") {
            self.labelAppVersion.text = "Version \(appVersion)"
        }
    }

}
