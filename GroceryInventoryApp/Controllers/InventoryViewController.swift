//
//  InventoryViewController.swift
//  GroceryInventoryApp
//
//  Created by 🌟 marlin 🌟 on 5/21/22.
//

import UIKit

class InventoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let data = FakeDatabase().db
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.dataSource = self
        self.tableview.delegate = self
        
        self.InventoryCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { 
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell {
            cell.imageCell.image = UIImage(named: data[indexPath.row].image)
            cell.labelName.text = data[indexPath.row].name
            cell.labelSKU.text = data[indexPath.row].SKU
            return cell
        }
        return UITableViewCell()
    }
    //    i img: String, n nme: String, sku barcode: String, p pr: String, w wt: Int, q qua: Int, ex expired: String, d depart: String, t tpe: String, a ai: Int, des descrip: String
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DestinationViewController") as? DestinationViewController
        vc?.img = UIImage(named: data[indexPath.row].image)!
        vc?.nme = data[indexPath.row].name
        vc?.sku = data[indexPath.row].SKU
        vc?.p = data[indexPath.row].price
        vc?.p = data[indexPath.row].price
        vc?.p = data[indexPath.row].price
        vc?.p = data[indexPath.row].price
        vc?.p = data[indexPath.row].price
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBOutlet weak var tableview: UITableView!
    
    private func InventoryCell() {
        let cell = UINib(nibName: "CustomTableViewCell", bundle: nil)
        self.tableview.register(cell, forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    
}
