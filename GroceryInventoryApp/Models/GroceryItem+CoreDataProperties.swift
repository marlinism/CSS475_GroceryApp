//
//  GroceryItem+CoreDataProperties.swift
//  GroceryInventoryApp
//
//  Created by 🌟 marlin 🌟 on 5/30/22.
//
//

import Foundation
import CoreData


extension GroceryItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroceryItem> {
        return NSFetchRequest<GroceryItem>(entityName: "GroceryItem")
    }

    @NSManaged public var aisle: String?
    @NSManaged public var department: String?
    @NSManaged public var expiredDate: String?
    @NSManaged public var image: Data?
    @NSManaged public var quantityAvailability: String?
    @NSManaged public var descript: String?
    @NSManaged public var name: String?
    @NSManaged public var salesPrice: String?
    @NSManaged public var type: String?
    @NSManaged public var weight: String?
    @NSManaged public var sku: String?

}

extension GroceryItem : Identifiable {

}
