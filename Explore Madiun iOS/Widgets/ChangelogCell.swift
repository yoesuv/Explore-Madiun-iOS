//
//  ChangelogCell.swift
//  Explore Madiun iOS
//
//  Created by Yusuf Saifudin on 08/08/23.
//

import UIKit

class ChangelogCell: UITableViewCell {
    
    static let identifier = "ChangelogCell"
    
    @IBOutlet weak var labelChangelogVersion: UILabel!
    @IBOutlet weak var labelChangelogInformation: UILabel!
    
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
