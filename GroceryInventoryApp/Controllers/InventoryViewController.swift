//
//  InventoryViewController.swift
//  GroceryInventoryApp
//
//  Created by 🌟 marlin 🌟 on 5/21/22.
//

import UIKit
import CoreData

class InventoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items = [GroceryItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.tableview.dataSource = self
        self.tableview.delegate = self
        
        self.InventoryCell()
        self.fetchData()
    }
    
    @IBAction func sortTouched(_ sender: Any) {
        
    }
    
    //MARK: - Model Manupulation Methods
    
    func fetchData() {
        do {
            self.items = try context.fetch(GroceryItem.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
        catch {
            
        }
    }
    
    //MARK: - TableView Datasource Methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell {
            
            cell.imageCell?.image = UIImage(data: self.items[indexPath.row].image!)
            cell.nameCell?.text = self.items[indexPath.row].name
            cell.skuCell?.text = self.items[indexPath.row].sku
            return cell
        }
        return UITableViewCell()
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DestinationViewController") as? DestinationViewController
        
        vc?.img = UIImage(data: self.items[indexPath.row].image!)!
        vc?.nme = self.items[indexPath.row].name!
        vc?.s = self.items[indexPath.row].sku!
        vc?.p = self.items[indexPath.row].salesPrice!
        vc?.w = self.items[indexPath.row].weight!
        vc?.q = self.items[indexPath.row].quantityAvailability!
        vc?.e = self.items[indexPath.row].expiredDate!
        vc?.de = self.items[indexPath.row].department!
        vc?.t = self.items[indexPath.row].type!
        vc?.ai = self.items[indexPath.row].aisle!
        vc?.des = self.items[indexPath.row].descript!
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    //MARK: - Table View Delegate Methods
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") {
            (action, view, completionHandler) in
            
            let itemToRemove = self.items[indexPath.row]
            self.context.delete(itemToRemove)
            
            self.fetchData()
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    //MARK: - Table View Cells Methods
    
    @IBOutlet weak var tableview: UITableView!
    
    private func InventoryCell() {
        let cell = UINib(nibName: "CustomTableViewCell", bundle: nil)
        self.tableview.register(cell, forCellReuseIdentifier: "CustomTableViewCell")
    }
    
}
