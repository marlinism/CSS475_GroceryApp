//
//  InventoryCellTableViewCell.swift
//  GroceryInventoryApp
//
//  Created by 🌟 marlin 🌟 on 5/22/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelSKU: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
