//
//  SearchViewController.swift
//  GroceryInventoryApp
//
//  Created by 🌟 marlin 🌟 on 5/21/22.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var nameError: UILabel!
    
    @IBOutlet weak var SKUField: UITextField!
    @IBOutlet weak var SKUError: UILabel!
    
    @IBOutlet weak var fromField: UITextField!
    @IBOutlet weak var fromPriceError: UILabel!
    
    @IBOutlet weak var toField: UITextField!
    @IBOutlet weak var toPriceError: UILabel!
    
    @IBOutlet weak var searchButton: UIButton!
    
    @IBAction func nameChanged(_ sender: Any) {
        if let name = nameField.text {
            if let errorMessage = invalidName(name) {
                nameError.text = errorMessage
                nameError.isHidden = false
            } else {
                nameError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    @IBAction func SKUChanged(_ sender: Any) {
        if let sku = SKUField.text {
            if let errorMessage = invalidSKU(sku) {
                SKUError.text = errorMessage
                SKUError.isHidden = false
            } else {
                SKUError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    @IBAction func fromPriceChanged(_ sender: Any) {
        if let price = fromField.text {
            if let errorMessage = invalidFromPrice(price) {
                fromPriceError.text = errorMessage
                fromPriceError.isHidden = false
            } else {
                fromPriceError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    @IBAction func toPriceChanged(_ sender: Any) {
        let temp = fromField.text ?? ""
        if let price = toField.text  {
            if let errorMessage = invalidToPrice(price, temp) {
                toPriceError.text = errorMessage
                toPriceError.isHidden = false
            } else {
                toPriceError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    @IBAction func searchButtonTouched(_ sender: Any) {
        resetForm()
        //do query
    }
    
    func resetForm() {
        searchButton.isEnabled = false
        
        nameError.isHidden = false
        SKUError.isHidden = false
        fromPriceError.isHidden = false
        toPriceError.isHidden = false
        
        nameError.text = "Required"
        SKUError.text = "Required"
        fromPriceError.text = "Required"
        toPriceError.text = "Required"
        
        nameField.text = ""
        SKUField.text = ""
        fromField.text = ""
        toField.text = ""
    }
    
    @IBAction func clearButtonTouched(_ sender: Any) {
        self.nameField.text = nil
        self.SKUField.text = nil
        self.fromField.text = nil
        self.toField.text = nil
        
        nameError.isHidden = true
        SKUError.isHidden = true
        fromPriceError.isHidden = true
        toPriceError.isHidden = true
    }
    
    func invalidName(_ value: String) -> String? {
        if value.count == 0 {
            return "Must be at least 1 character!"
        }
        
        if !containsDigit(value) {
            return "Must not contain digit!"
        }
        return nil
    }
    
    func containsDigit(_ value: String) -> Bool {
        let regularExpression = ".*[0-9].*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return !predicate.evaluate(with: value)
    }
    
    func invalidSKU(_ value:String) -> String? {
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set) {
            return "Must contain only digits!"
        }
        
        if value.count != 12 {
            return "Must be 12 characters!"
        }
        return nil
    }
    
    func invalidFromPrice(_ value: String) -> String? {
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set) {
            return "Must contain only digits!"
        }
        
        if value.count == 0 {
            return "Must be greater than 0!"
        }
        return nil
    }
    
    func invalidToPrice(_ value: String, _ temp: String) -> String? {
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set) {
            return "Must contain only digits!"
        }
        
        if value.count == 0 {
            return "Must be greater than 0!"
        }
        
        let valueInt = Int(value) ?? 0
        let tempInt = Int(temp) ?? 0
        
        if valueInt <= tempInt {
            return "After price > Before price!"
        }
        return nil
    }
    
    func checkForValidForm() {
        if nameError.isHidden && SKUError.isHidden && fromPriceError.isHidden && toPriceError.isHidden {
            searchButton.isEnabled = true
        } else {
            searchButton.isEnabled = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetForm()
    }
}
