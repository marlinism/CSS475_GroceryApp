//
//  DestinationViewController.swift
//  GroceryInventoryApp
//
//  Created by marlinism on 5/26/22.
//

import UIKit

class DestinationViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var sku: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var expiredDate: UILabel!
    @IBOutlet weak var department: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var aisle: UILabel!
    @IBOutlet weak var Description: UILabel!
    
    var img = UIImage()
    var nme = ""
    var s = ""
    var p = ""
    var w = ""
    var q = ""
    var e = ""
    var de = ""
    var t = ""
    var ai = "" 
    var des = ""
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var skuLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var expiredDateLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var aisleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = img
        name.text = nme
        if(name.text == "") {
            nameLabel.isHidden = true
        }
        
        sku.text = s
        if(sku.text == "") {
            skuLabel.isHidden = true
        }
        
        price.text = p
        if(price.text == "") {
            priceLabel.isHidden = true
        }
        
        weight.text = w
        if(weight.text == "") {
            weightLabel.isHidden = true
        }
        
        quantity.text = q
        if(quantity.text == "") {
            quantityLabel.isHidden = true
        }
        
        expiredDate.text = e
        if(expiredDate.text == "") {
            expiredDateLabel.isHidden = true
        }
        
        department.text = de
        if(department.text == "") {
            departmentLabel.isHidden = true
        }
        
        type.text = t
        if(type.text == "") {
            typeLabel.isHidden = true
        }
        
        aisle.text = ai
        if(aisle.text == "") {
            aisleLabel.isHidden = true
        }
        
        Description.text = des
        if(Description.text == "") {
            descriptionLabel.isHidden = true
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
