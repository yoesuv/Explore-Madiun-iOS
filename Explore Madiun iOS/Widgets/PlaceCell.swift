//
//  PlaceCell.swift
//  Explore Madiun iOS
//
//  Created by Yusuf Saifudin on 28/07/23.
//

import UIKit

class PlaceCell: UITableViewCell {

    @IBOutlet weak var imageViewItemPlace: UIImageView!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
