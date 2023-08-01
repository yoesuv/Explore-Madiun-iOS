//
//  ReleaseCell.swift
//  Explore Madiun iOS
//
//  Created by Yusuf Saifudin on 01/08/23.
//

import UIKit

class ReleaseCell: UITableViewCell {
    
    static let identifier = "ReleaseCell"
    
    @IBOutlet weak var labelReleaseVersion: UILabel!
    @IBOutlet weak var labelReleaseInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
