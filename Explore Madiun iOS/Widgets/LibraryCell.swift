//
//  LibraryCell.swift
//  Explore Madiun iOS
//
//  Created by Yusuf Saifudin on 03/08/23.
//

import UIKit

class LibraryCell: UITableViewCell {
    
    static let identifier = "LibraryCell"
    
    @IBOutlet weak var labelLibraryName: UILabel!
    @IBOutlet weak var labelLibraryLicense: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
