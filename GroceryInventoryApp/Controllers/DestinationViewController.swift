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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = img
        name.text = nme
        sku.text = s
        price.text = p
        weight.text = w
        quantity.text = q
        expiredDate.text = e
        department.text = de
        type.text = t 
        aisle.text = ai
        Description.text = des
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
