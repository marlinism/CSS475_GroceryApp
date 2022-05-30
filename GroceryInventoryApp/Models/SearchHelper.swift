//
//  SearchHelper.swift
//  GroceryInventoryApp
//
//  Created by 🌟 marlin 🌟 on 5/30/22.
//

import UIKit

class SearchHelper {
    
    let name: String
    let SKU: String
    let fromPrice: String
    let toPrice: String
    
    init(n nme:String, s sKU:String, f from: String, t to:String) {
        name = nme
        SKU = sKU
        fromPrice = from
        toPrice = to
    }
}
