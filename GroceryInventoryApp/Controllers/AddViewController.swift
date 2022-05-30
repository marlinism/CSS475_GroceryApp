//
//  AddViewController.swift
//  GroceryInventoryApp
//
//  Created by 🌟 marlin 🌟 on 5/25/22.
//

import UIKit
import CoreData

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items: [GroceryItem]?
    
    var placeHolder = ""
    
    @IBOutlet weak var imageField: UIImageView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var skuField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var quantityField: UITextField!
    @IBOutlet weak var expiredDate: UITextField!
    @IBOutlet weak var departmentField: UITextField!
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var aisleField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageField.image = UIImage(named: "placeholder")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importImage))
    }
    
    @objc func importImage() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        dismiss(animated: true)
        
        self.imageField.image = image
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
    
    @IBAction func addButtonTouched(_ sender: Any) {
        let dataImage = imageField.image!.jpegData(compressionQuality: 1.0)
        
        let newItem = GroceryItem(context: self.context)
        
        newItem.image = dataImage
        newItem.name = nameField.text
        newItem.sku = skuField.text
        newItem.salesPrice = priceField.text
        newItem.descript = descriptionField.text
        newItem.weight = weightField.text
        newItem.quantityAvailability = quantityField.text
        newItem.expiredDate = expiredDate.text
        newItem.department = departmentField.text
        newItem.type = typeField.text
        newItem.aisle = aisleField.text
        
        do {
            try self.context.save() 
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
}
