//
//  ItemCell.swift
//  GroceryInventoryApp
//
//  Created by 🌟 marlin 🌟 on 5/22/22.
//

import Foundation

struct ItemCell {
    let image: String
    let name: String
    let SKU: String
    
    init(i img: String, n nme: String, sku barcode: String) {
        image = img
        name = nme
        SKU = barcode
    }
}
