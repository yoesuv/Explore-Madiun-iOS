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
    @IBOutlet weak var labelLibraryLink: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let vertical: CGFloat = 5
        let horizontal: CGFloat = 10
        let margins = UIEdgeInsets(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
        contentView.frame = contentView.frame.inset(by: margins)
    }
    
}
