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
    
    @IBOutlet weak var nameError: UILabel!
    @IBOutlet weak var skuError: UILabel!
    @IBOutlet weak var priceError: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageField.image = UIImage(named: "placeholder")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importImage))
        
        resetForm()
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
    
    @IBAction func clearButtonTouched(_ sender: Any) {
        self.nameField.text = nil
        self.skuField.text = nil
        self.priceField.text = nil
        self.descriptionField.text = nil
        self.weightField.text = nil
        self.quantityField.text = nil
        self.expiredDate.text = nil
        self.departmentField.text = nil
        self.typeField.text = nil
        self.aisleField.text = nil
        
        nameError.isHidden = true
        skuError.isHidden = true
        priceError.isHidden = true
    }
    
    func resetForm() {
        addButton.isEnabled = false
        
        nameError.isHidden = false
        skuError.isHidden = false
        priceError.isHidden = false
        
        nameError.text = "Required"
        skuError.text = "Required"
        priceError.text = "Required"
        
        nameField.text = ""
        skuField.text = ""
        priceField.text = ""
        descriptionField.text = ""
        weightField.text = ""
        quantityField.text = ""
        expiredDate.text = ""
        departmentField.text = ""
        typeField.text = ""
        aisleField.text = ""
    }
    
    func invalid(_ value: String) -> String? {
        if value.count == 0 {
            return "Must be at least 1 character!"
        }
        
        return nil
    }
    
    func checkForValidForm() {
        if nameError.isHidden && skuError.isHidden && priceError.isHidden {
            addButton.isEnabled = true
        } else {
            addButton.isEnabled = false
        }
    }
    
    @IBAction func nameEntered(_ sender: Any) {
        if let name = nameField.text {
            if let errorMessage = invalid(name) {
                nameError.text = errorMessage
                nameError.isHidden = false
            } else {
                nameError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    
    @IBAction func skuEntered(_ sender: Any) {
        if let sku = skuField.text {
            if let errorMessage = invalidSKU(sku) {
                skuError.text = errorMessage
                skuError.isHidden = false
            } else {
                skuError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    @IBAction func priceEntered(_ sender: Any) {
        if let price = priceField.text {
            if let errorMessage = invalidPrice(price) {
                priceError.text = errorMessage
                priceError.isHidden = false
            } else {
                priceError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    func invalidSKU(_ value:String) -> String? {
        if value.count != 5 {
            return "Must be 5 characters!"
        }
        return nil
    }
    
    func invalidPrice(_ value: String) -> String? {
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set) {
            return "Must contain only digits!"
        }

        return nil
    }
}
