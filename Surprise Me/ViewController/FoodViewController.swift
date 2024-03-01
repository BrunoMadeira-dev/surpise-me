//
//  FoodViewController.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 29/02/2024.
//

import Foundation
import UIKit

class FoodViewController: UIViewController {
    
    @IBOutlet weak var foodTextField: UITextField!
    @IBOutlet weak var searchFoodBtn: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    //Filled with API Data
    @IBOutlet weak var foodTitleLbl: UILabel!
    @IBOutlet weak var foodCategoryLbl: UILabel!
    @IBOutlet weak var foodAreaLbl: UILabel!
    @IBOutlet weak var foodInstructLbl: UILabel!
    @IBOutlet weak var strIngred1Lbl: UILabel!
    @IBOutlet weak var strIngred2Lbl: UILabel!
    @IBOutlet weak var strIngred3Lbl: UILabel!
    
    var food: String = ""
    let networker = NetworkingCall()
    
    override func viewDidLoad() {
        styleUI()
    }
    
    func styleUI() {
        foodTextField.placeholder = "Food"
        foodTextField.borderStyle = .roundedRect
        searchFoodBtn.setTitle("Search", for: [])
        searchFoodBtn.layer.cornerRadius = 10
        searchFoodBtn.layer.borderWidth = 2
        searchFoodBtn.layer.borderColor = UIColor.black.cgColor
        stackView.isHidden = true
    }
    
    @IBAction func searchFoodPressed(_ sender: Any) {
        foodTextField.endEditing(true)
        food = foodTextField.text ?? ""
        requestFood()
    }
    
}

//MARK: Delegate of UITextField
extension FoodViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = foodTextField.text {
            food = text
        }
        foodTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        foodTextField.resignFirstResponder()
        return true
    }
}

//MARK: Button Actions

extension FoodViewController {
    
    func requestFood() {
        var url = K.foodURL
        
        networker.responseCall(url: url, responseType: MealDataModel.self) { response, error in
            
            if let error = error {
                print(error)
            }
            
            if let safeResp = response {
                self.foodTitleLbl.text = "Title: \(safeResp.meals[0].strMeal!)"
                self.foodCategoryLbl.text = "Category: \(safeResp.meals[0].strCategory!)"
                self.foodAreaLbl.text = "Country: \(safeResp.meals[0].strArea!)"
                self.foodInstructLbl.text = "Instructions \(safeResp.meals[0].strInstructions!)"
                self.strIngred1Lbl.text = "Ingridient 1: \(safeResp.meals[0].strIngredient1!)"
                self.strIngred2Lbl.text = "Ingridient 2: \(safeResp.meals[0].strIngredient2!)"
                self.strIngred3Lbl.text = "Ingridient 3: \(safeResp.meals[0].strIngredient3!)"
                self.stackView.isHidden = false
            }
        }
        
    }
    
}
