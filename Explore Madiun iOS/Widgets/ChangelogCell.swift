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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
