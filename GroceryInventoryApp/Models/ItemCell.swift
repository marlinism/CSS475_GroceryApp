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
    let price: String
    let weight: String
    let quantity: String
    let expiredDate: String
    let department: String
    let type: String
    let aisle: String
    let description: String
    
    init(i img: String, n nme: String, sku barcode: String, p pr: String, w wt: String, q qua: String, ex expired: String, d depart: String, t tpe: String, a ai: String, des descrip: String) {
        image = img
        name = nme
        SKU = barcode
        price = pr
        weight = wt
        quantity = qua
        expiredDate = expired
        department = depart
        type = tpe
        aisle = ai
        description = descrip
    }
}
