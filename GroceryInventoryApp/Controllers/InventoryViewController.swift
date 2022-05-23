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
    
    @IBOutlet weak var tableview: UITableView!
    
    private func InventoryCell() {
        let cell = UINib(nibName: "CustomTableViewCell", bundle: nil)
        self.tableview.register(cell, forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    
}
