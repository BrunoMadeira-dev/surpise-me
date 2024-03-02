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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var uiViewFood: UIView!
    
    //Filled with API Data
    @IBOutlet weak var foodTitleLbl: UILabel!
    @IBOutlet weak var foodCategoryLbl: UILabel!
    @IBOutlet weak var foodAreaLbl: UILabel!
    @IBOutlet weak var foodInstructLbl: UILabel!
    @IBOutlet weak var strIngred1Lbl: UILabel!
    @IBOutlet weak var strIngred2Lbl: UILabel!
    @IBOutlet weak var strIngred3Lbl: UILabel!
    @IBOutlet weak var strIngred4Lbl: UILabel!
    @IBOutlet weak var strIngred5Lbl: UILabel!
    @IBOutlet weak var strIngred6Lbl: UILabel!
    @IBOutlet weak var strIngred7Lbl: UILabel!
    @IBOutlet weak var strIngred8Lbl: UILabel!
    @IBOutlet weak var strIngred9Lbl: UILabel!
    @IBOutlet weak var strIngred10Lbl: UILabel!
    @IBOutlet weak var strIngred11Lbl: UILabel!
    @IBOutlet weak var strIngred12Lbl: UILabel!
    @IBOutlet weak var strIngred13Lbl: UILabel!
    @IBOutlet weak var strIngred14Lbl: UILabel!
    @IBOutlet weak var strIngred15Lbl: UILabel!
    @IBOutlet weak var strIngred16Lbl: UILabel!
    @IBOutlet weak var strIngred17Lbl: UILabel!
    @IBOutlet weak var strIngred18Lbl: UILabel!
    @IBOutlet weak var strIngred19Lbl: UILabel!
    @IBOutlet weak var strIngred20Lbl: UILabel!
    @IBOutlet weak var strMeasure1Lbl: UILabel!
    @IBOutlet weak var strMeasure2Lbl: UILabel!
    @IBOutlet weak var strMeasure3Lbl: UILabel!
    @IBOutlet weak var strMeasure4Lbl: UILabel!
    @IBOutlet weak var strMeasure5Lbl: UILabel!
    @IBOutlet weak var strMeasure6Lbl: UILabel!
    @IBOutlet weak var strMeasure7Lbl: UILabel!
    @IBOutlet weak var strMeasure8Lbl: UILabel!
    @IBOutlet weak var strMeasure9Lbl: UILabel!
    @IBOutlet weak var strMeasure10Lbl: UILabel!
    @IBOutlet weak var strMeasure11Lbl: UILabel!
    @IBOutlet weak var strMeasure12Lbl: UILabel!
    @IBOutlet weak var strMeasure13Lbl: UILabel!
    @IBOutlet weak var strMeasure14Lbl: UILabel!
    @IBOutlet weak var strMeasure15Lbl: UILabel!
    @IBOutlet weak var strMeasure16Lbl: UILabel!
    @IBOutlet weak var strMeasure17Lbl: UILabel!
    @IBOutlet weak var strMeasure18Lbl: UILabel!
    @IBOutlet weak var strMeasure19Lbl: UILabel!
    @IBOutlet weak var strMeasure20Lbl: UILabel!
    
    var stackViewHeight: Double = 0.0
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
        searchFoodBtn.setTitleColor(UIColor.white, for: [])
        self.scrollView.isHidden = true
        self.stackView.isHidden = true
        self.uiViewFood.isHidden = true
        navigationItem.title = "Foodie"
        navigationItem.leftBarButtonItem?.title = ""
    }
    
    @IBAction func searchFoodPressed(_ sender: Any) {
        foodTextField.endEditing(true)
        food = foodTextField.text ?? ""
        requestFood(url: K.foodURL)
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
    
    func requestFood(url: String) {
        
        FoodDataManager().fetchRandomFood(url: url) { responseObject, error in
            if let error = error {
                print(error)
            }
            
            if let safeResp = responseObject {
                
                if let foodTitle = safeResp.meals[0].strMeal {
                    self.foodTitleLbl.text = "Title: \(foodTitle)"
                } else {
                    self.foodTitleLbl.isHidden = true
                }
                if let foodArea = safeResp.meals[0].strArea {
                    self.foodAreaLbl.text = "Title: \(foodArea)"
                } else {
                    self.foodAreaLbl.isHidden = true
                }
                if let foodCategory = safeResp.meals[0].strCategory {
                    self.foodCategoryLbl.text = "Category: \(foodCategory)"
                } else {
                    self.foodCategoryLbl.isHidden = true
                }
                if let foodInstruct = safeResp.meals[0].strInstructions {
                    self.foodInstructLbl.text = "Instructions: \(foodInstruct)"
                } else {
                    self.foodInstructLbl.isHidden = true
                }
                if let strIngred1 = safeResp.meals[0].strIngredient1 {
                    if strIngred1 != "" {
                        self.strIngred1Lbl.isHidden = false
                        self.strIngred1Lbl.text = "Instruction 1: \(strIngred1)"
                    } else {
                        self.strIngred1Lbl.isHidden = true
                    }
                } else {
                    self.strIngred1Lbl.isHidden = true
                }
                if let strIngred2 = safeResp.meals[0].strIngredient2 {
                    if strIngred2 != "" {
                        self.strIngred2Lbl.isHidden = false
                        self.strIngred2Lbl.text = "Instruction 2: \(strIngred2)"
                    } else {
                        self.strIngred2Lbl.isHidden = true
                    }
                } else {
                    self.strIngred2Lbl.isHidden = true
                }
                if let strIngred3 = safeResp.meals[0].strIngredient3 {
                    if strIngred3 != "" {
                        self.strIngred3Lbl.isHidden = false
                        self.strIngred3Lbl.text = "Instruction 3: \(strIngred3)"
                    } else {
                        self.strIngred3Lbl.isHidden = true
                    }
                } else {
                    self.strIngred3Lbl.isHidden = true
                }
                if let strIngred4 = safeResp.meals[0].strIngredient4 {
                    if strIngred4 != "" {
                        self.strIngred4Lbl.isHidden = false
                        self.strIngred4Lbl.text = "Instruction 4: \(strIngred4)"
                    } else {
                        self.strIngred4Lbl.isHidden = true
                    }
                } else {
                    self.strIngred4Lbl.isHidden = true
                }
                if let strIngred5 = safeResp.meals[0].strIngredient5 {
                    if strIngred5 != "" {
                        self.strIngred5Lbl.isHidden = false
                        self.strIngred5Lbl.text = "Instruction 5: \(strIngred5)"
                    } else {
                        self.strIngred5Lbl.isHidden = true
                    }
                } else {
                    self.strIngred5Lbl.isHidden = true
                }
                if let strIngred6 = safeResp.meals[0].strIngredient6 {
                    if strIngred6 != "" {
                        self.strIngred6Lbl.isHidden = false
                        self.strIngred6Lbl.text = "Instruction 6: \(strIngred6)"
                    } else {
                        self.strIngred6Lbl.isHidden = true
                    }
                } else {
                    self.strIngred6Lbl.isHidden = true
                }
                if let strIngred7 = safeResp.meals[0].strIngredient7 {
                    if strIngred7 != "" {
                        self.strIngred7Lbl.isHidden = false
                        self.strIngred7Lbl.text = "Instruction 7: \(strIngred7)"
                    } else {
                        self.strIngred7Lbl.isHidden = true
                    }
                } else {
                    self.strIngred7Lbl.isHidden = true
                }
                if let strIngred8 = safeResp.meals[0].strIngredient8 {
                    if strIngred8 != "" {
                        self.strIngred8Lbl.isHidden = false
                        self.strIngred8Lbl.text = "Instruction 8: \(strIngred8)"
                    } else {
                        self.strIngred8Lbl.isHidden = true
                    }
                } else {
                    self.strIngred8Lbl.isHidden = true
                }
                if let strIngred9 = safeResp.meals[0].strIngredient9 {
                    if strIngred9 != "" {
                        self.strIngred9Lbl.isHidden = false
                        self.strIngred9Lbl.text = "Instruction 9: \(strIngred9)"
                    } else {
                        self.strIngred9Lbl.isHidden = true
                    }
                } else {
                    self.strIngred9Lbl.isHidden = true
                }
                if let strIngred10 = safeResp.meals[0].strIngredient10 {
                    if strIngred10 != "" {
                        self.strIngred10Lbl.isHidden = false
                        self.strIngred10Lbl.text = "Instruction 10: \(strIngred10)"
                    } else {
                        self.strIngred10Lbl.isHidden = true
                    }
                } else {
                    self.strIngred10Lbl.isHidden = true
                }
                if let strIngred11 = safeResp.meals[0].strIngredient11 {
                    if strIngred11 != "" {
                        self.strIngred11Lbl.isHidden = false
                        self.strIngred11Lbl.text = "Instruction 11: \(strIngred11)"
                    } else {
                        self.strIngred11Lbl.isHidden = true
                    }
                } else {
                    self.strIngred11Lbl.isHidden = true
                }
                if let strIngred12 = safeResp.meals[0].strIngredient12 {
                    if strIngred12 != "" {
                        self.strIngred12Lbl.isHidden = false
                        self.strIngred12Lbl.text = "Instruction 12: \(strIngred12)"
                    } else {
                        self.strIngred12Lbl.isHidden = true
                    }
                } else {
                    self.strIngred12Lbl.isHidden = true
                }
                if let strIngred13 = safeResp.meals[0].strIngredient13 {
                    if strIngred13 != "" {
                        self.strIngred13Lbl.isHidden = false
                        self.strIngred13Lbl.text = "Instruction 13: \(strIngred13)"
                    } else {
                        self.strIngred13Lbl.isHidden = true
                    }
                } else {
                    self.strIngred13Lbl.isHidden = true
                }
                if let strIngred14 = safeResp.meals[0].strIngredient14 {
                    if strIngred14 != "" {
                        self.strIngred14Lbl.isHidden = false
                        self.strIngred14Lbl.text = "Instruction 14: \(strIngred14)"
                    } else {
                        self.strIngred14Lbl.isHidden = true
                    }
                } else {
                    self.strIngred14Lbl.isHidden = true
                }
                if let strIngred15 = safeResp.meals[0].strIngredient15 {
                    if strIngred15 != "" {
                        self.strIngred15Lbl.isHidden = false
                        self.strIngred15Lbl.text = "Instruction 15: \(strIngred15)"
                    } else {
                        self.strIngred15Lbl.isHidden = true
                    }
                } else {
                    self.strIngred15Lbl.isHidden = true
                }
                if let strIngred16 = safeResp.meals[0].strIngredient16 {
                    if strIngred16 != "" {
                        self.strIngred16Lbl.isHidden = false
                        self.strIngred16Lbl.text = "Instruction 16: \(strIngred16)"
                    } else {
                        self.strIngred16Lbl.isHidden = true
                    }
                } else {
                    self.strIngred16Lbl.isHidden = true
                }
                if let strIngred17 = safeResp.meals[0].strIngredient17 {
                    if strIngred17 != "" {
                        self.strIngred17Lbl.isHidden = false
                        self.strIngred17Lbl.text = "Instruction 17: \(strIngred17)"
                    } else {
                        self.strIngred17Lbl.isHidden = true
                    }
                } else {
                    self.strIngred17Lbl.isHidden = true
                }
                if let strIngred18 = safeResp.meals[0].strIngredient18 {
                    if strIngred18 != "" {
                        self.strIngred18Lbl.isHidden = false
                        self.strIngred18Lbl.text = "Instruction 18: \(strIngred18)"
                    } else {
                        self.strIngred18Lbl.isHidden = true
                    }
                } else {
                    self.strIngred18Lbl.isHidden = true
                }
                if let strIngred19 = safeResp.meals[0].strIngredient19 {
                    if strIngred19 != "" {
                        self.strIngred19Lbl.isHidden = false
                        self.strIngred19Lbl.text = "Instruction 19: \(strIngred19)"
                    } else {
                        self.strIngred19Lbl.isHidden = true
                    }
                } else {
                    self.strIngred19Lbl.isHidden = true
                }
                if let strIngred20 = safeResp.meals[0].strIngredient20 {
                    if strIngred20 != "" {
                        self.strIngred20Lbl.isHidden = false
                        self.strIngred20Lbl.text = "Instruction 20: \(strIngred20)"
                    } else {
                        self.strIngred20Lbl.isHidden = true
                    }
                } else {
                    self.strIngred20Lbl.isHidden = true
                }
                
                if let strMeasure1 = safeResp.meals[0].strMeasure1 {
                    if strMeasure1 != " " && strMeasure1 != "" {
                        self.strMeasure1Lbl.isHidden = false
                        self.strMeasure1Lbl.text = "Measure 1: \(strMeasure1)"
                    } else {
                        self.strMeasure1Lbl.isHidden = true
                    }
                } else {
                    self.strMeasure1Lbl.isHidden = true
                }
                if let strMeasure2 = safeResp.meals[0].strMeasure2 {
                    if strMeasure2 != " "  && strMeasure2 != "" {
                        self.strMeasure2Lbl.isHidden = false
                        self.strMeasure2Lbl.text = "Measure 2: \(strMeasure2)"
                    } else {
                        self.strMeasure2Lbl.isHidden = true
                    }
                } else {
                    self.strMeasure2Lbl.isHidden = true
                }
                if let strMeasure3 = safeResp.meals[0].strMeasure3 {
                    if strMeasure3 != " " && strMeasure3 != "" {
                        self.strMeasure3Lbl.isHidden = false
                        self.strMeasure3Lbl.text = "Measure 3: \(strMeasure3)"
                    } else {
                        self.strMeasure3Lbl.isHidden = true
                    }
                } else {
                    self.strMeasure3Lbl.isHidden = true
                }
                if let strMeasure4 = safeResp.meals[0].strMeasure4 {
                    if strMeasure4 != " " && strMeasure4 != "" {
                        self.strMeasure4Lbl.isHidden = false
                        self.strMeasure4Lbl.text = "Measure 4: \(strMeasure4)"
                    } else {
                        self.strMeasure4Lbl.isHidden = true
                    }
                } else {
                    self.strMeasure4Lbl.isHidden = true
                }
                if let strMeasure5 = safeResp.meals[0].strMeasure5 {
                    if strMeasure5 != " " && strMeasure5 != "" {
                        self.strMeasure5Lbl.isHidden = false
                        self.strMeasure5Lbl.text = "Measure 5: \(strMeasure5)"
                    } else {
                        self.strMeasure5Lbl.isHidden = true
                    }
                } else {
                    self.strMeasure5Lbl.isHidden = true
                }
                if let strMeasure6 = safeResp.meals[0].strMeasure6 {
                    if strMeasure6 != " " && strMeasure6 != "" {
                        self.strMeasure6Lbl.isHidden = false
                        self.strMeasure6Lbl.text = "Measure 6: \(strMeasure6)"
                    } else {
                        self.strMeasure6Lbl.isHidden = true
                    }
                } else {
                    self.strMeasure6Lbl.isHidden = true
                }
                if let strMeasure7 = safeResp.meals[0].strMeasure7 {
                    if strMeasure7 != " " && strMeasure7 != "" {
                        self.strMeasure7Lbl.isHidden = false
                        self.strMeasure7Lbl.text = "Measure 7: \(strMeasure7)"
                    } else {
                        self.strMeasure7Lbl.isHidden = true
                    }
                } else {
                    self.strMeasure7Lbl.isHidden = true
                }
                if let strMeasure8 = safeResp.meals[0].strMeasure8 {
                    if strMeasure8 != " " && strMeasure8 != "" {
                        self.strMeasure8Lbl.isHidden = false
                        self.strMeasure8Lbl.text = "Measure 8: \(strMeasure8)"
                    } else {
                        self.strMeasure8Lbl.isHidden = true
                    }
                } else {
                    self.strMeasure8Lbl.isHidden = true
                }
                if let strMeasure9 = safeResp.meals[0].strMeasure9 {
                    if strMeasure9 != " " && strMeasure9 != "" {
                        self.strMeasure9Lbl.isHidden = false
                        self.strMeasure9Lbl.text = "Measure 9: \(strMeasure9)"
                    } else {
                        self.strMeasure9Lbl.isHidden = true
                    }
                } else {
                    self.strMeasure9Lbl.isHidden = true
                }
                if let strMeasure10 = safeResp.meals[0].strMeasure10 {
                    if strMeasure10 != " "  && strMeasure10 != ""{
                        self.strMeasure10Lbl.isHidden = false
                        self.strMeasure10Lbl.text = "Measure 10: \(strMeasure10)"
                    } else {
                        self.strMeasure10Lbl.isHidden = true
                    }
                } else {
                    self.strMeasure10Lbl.isHidden = true
                }
                if let strMeasure11 = safeResp.meals[0].strMeasure11 {
                    if strMeasure11 != " " && strMeasure11 != "" {
                        self.strMeasure11Lbl.isHidden = false
                        self.strMeasure11Lbl.text = "Measure 11: \(strMeasure11)"
                    } else {
                        self.strMeasure11Lbl.isHidden = true
                    }
                } else {
                    self.strMeasure11Lbl.isHidden = true
                }
                if let strMeasure12 = safeResp.meals[0].strMeasure12 {
                    if strMeasure12 != " " && strMeasure12 != "" {
                        self.strMeasure12Lbl.isHidden = false
                        self.strMeasure12Lbl.text = "Measure 12: \(strMeasure12)"
                    } else {
                        self.strMeasure12Lbl.isHidden = true
                    }
                } else {
                    self.strMeasure12Lbl.isHidden = true
                }
                if let strMeasure13 = safeResp.meals[0].strMeasure13 {
                    if strMeasure13 != " " && strMeasure13 != "" {
                        self.strMeasure13Lbl.isHidden = false
                        self.strMeasure13Lbl.text = "Measure 13: \(strMeasure13)"
                    } else {
                        self.strMeasure13Lbl.isHidden = true
                    }
                } else {
                    self.strMeasure13Lbl.isHidden = true
                }
                if let strMeasure14 = safeResp.meals[0].strMeasure14 {
                    if strMeasure14 != " " && strMeasure14 != "" {
                        self.strMeasure14Lbl.isHidden = false
                        self.strMeasure14Lbl.text = "Measure 14: \(strMeasure14)"
                    } else {
                        self.strMeasure14Lbl.isHidden = true
                    }
                } else {
                    self.strMeasure14Lbl.isHidden = true
                }
                if let strMeasure15 = safeResp.meals[0].strMeasure15 {
                    if strMeasure15 != " " && strMeasure15 != "" {
                        self.strMeasure15Lbl.isHidden = false
                        self.strMeasure15Lbl.text = "Measure 15: \(strMeasure15)"
                    } else {
                        self.strMeasure15Lbl.isHidden = true
                    }
                } else {
                    self.strMeasure15Lbl.isHidden = true
                }
                if let strMeasure16 = safeResp.meals[0].strMeasure16 {
                    if strMeasure16 != " " && strMeasure16 != "" {
                        self.strMeasure16Lbl.isHidden = false
                        self.strMeasure16Lbl.text = "Measure 16: \(strMeasure16)"
                    } else {
                        self.strMeasure16Lbl.isHidden = true
                    }
                } else {
                    self.strMeasure16Lbl.isHidden = true
                }
                if let strMeasure17 = safeResp.meals[0].strMeasure17 {
                    if strMeasure17 != " " && strMeasure17 != "" {
                        self.strMeasure17Lbl.isHidden = false
                        self.strMeasure17Lbl.text = "Measure 17: \(strMeasure17)"
                    } else {
                        self.strMeasure17Lbl.isHidden = true
                    }
                } else {
                    self.strMeasure17Lbl.isHidden = true
                }
                if let strMeasure18 = safeResp.meals[0].strMeasure18 {
                    if strMeasure18 != " " && strMeasure18 != "" {
                        self.strMeasure18Lbl.isHidden = false
                        self.strMeasure18Lbl.text = "Measure 18: \(strMeasure18)"
                    } else {
                        self.strMeasure18Lbl.isHidden = true
                    }
                } else {
                    self.strMeasure18Lbl.isHidden = true
                }
                if let strMeasure19 = safeResp.meals[0].strMeasure19 {
                    if strMeasure19 != " " && strMeasure19 != "" {
                        self.strMeasure19Lbl.isHidden = false
                        self.strMeasure19Lbl.text = "Measure 19: \(strMeasure19)"
                    } else {
                        self.strMeasure19Lbl.isHidden = true
                    }
                } else {
                    self.strMeasure19Lbl.isHidden = true
                }
                if let strMeasure20 = safeResp.meals[0].strMeasure20 {
                    if strMeasure20 != " " && strMeasure20 != "" {
                        self.strMeasure20Lbl.isHidden = false
                        self.strMeasure20Lbl.text = "Measure 20: \(strMeasure20)"
                    } else {
                        self.strMeasure20Lbl.isHidden = true
                    }
                } else {
                    self.strMeasure20Lbl.isHidden = true
                }
                self.scrollView.isHidden = false
                self.stackView.isHidden = false
                self.uiViewFood.isHidden = false
            } else {
                self.scrollView.isHidden = true
                self.stackView.isHidden = true
            }
        }
//        networker.responseCall(url: url, responseType: MealDataModel.self) { response, error in
//            
//            if let error = error {
//                print(error)
//            }
//            
//            if let safeResp = response {
//                
//                if let foodTitle = safeResp.meals[0].strMeal {
//                    self.foodTitleLbl.text = "Title: \(foodTitle)"
//                } else {
//                    self.foodTitleLbl.isHidden = true
//                }
//                if let foodArea = safeResp.meals[0].strArea {
//                    self.foodAreaLbl.text = "Title: \(foodArea)"
//                } else {
//                    self.foodAreaLbl.isHidden = true
//                }
//                if let foodCategory = safeResp.meals[0].strCategory {
//                    self.foodCategoryLbl.text = "Category: \(foodCategory)"
//                } else {
//                    self.foodCategoryLbl.isHidden = true
//                }
//                if let foodInstruct = safeResp.meals[0].strInstructions {
//                    self.foodInstructLbl.text = "Instructions: \(foodInstruct)"
//                } else {
//                    self.foodInstructLbl.isHidden = true
//                }
//                if let strIngred1 = safeResp.meals[0].strIngredient1 {
//                    if strIngred1 != "" {
//                        self.strIngred1Lbl.isHidden = false
//                        self.strIngred1Lbl.text = "Instruction 1: \(strIngred1)"
//                    } else {
//                        self.strIngred1Lbl.isHidden = true
//                    }
//                } else {
//                    self.strIngred1Lbl.isHidden = true
//                }
//                if let strIngred2 = safeResp.meals[0].strIngredient2 {
//                    if strIngred2 != "" {
//                        self.strIngred2Lbl.isHidden = false
//                        self.strIngred2Lbl.text = "Instruction 2: \(strIngred2)"
//                    } else {
//                        self.strIngred2Lbl.isHidden = true
//                    }
//                } else {
//                    self.strIngred2Lbl.isHidden = true
//                }
//                if let strIngred3 = safeResp.meals[0].strIngredient3 {
//                    if strIngred3 != "" {
//                        self.strIngred3Lbl.isHidden = false
//                        self.strIngred3Lbl.text = "Instruction 3: \(strIngred3)"
//                    } else {
//                        self.strIngred3Lbl.isHidden = true
//                    }
//                } else {
//                    self.strIngred3Lbl.isHidden = true
//                }
//                if let strIngred4 = safeResp.meals[0].strIngredient4 {
//                    if strIngred4 != "" {
//                        self.strIngred4Lbl.isHidden = false
//                        self.strIngred4Lbl.text = "Instruction 4: \(strIngred4)"
//                    } else {
//                        self.strIngred4Lbl.isHidden = true
//                    }
//                } else {
//                    self.strIngred4Lbl.isHidden = true
//                }
//                if let strIngred5 = safeResp.meals[0].strIngredient5 {
//                    if strIngred5 != "" {
//                        self.strIngred5Lbl.isHidden = false
//                        self.strIngred5Lbl.text = "Instruction 5: \(strIngred5)"
//                    } else {
//                        self.strIngred5Lbl.isHidden = true
//                    }
//                } else {
//                    self.strIngred5Lbl.isHidden = true
//                }
//                if let strIngred6 = safeResp.meals[0].strIngredient6 {
//                    if strIngred6 != "" {
//                        self.strIngred6Lbl.isHidden = false
//                        self.strIngred6Lbl.text = "Instruction 6: \(strIngred6)"
//                    } else {
//                        self.strIngred6Lbl.isHidden = true
//                    }
//                } else {
//                    self.strIngred6Lbl.isHidden = true
//                }
//                if let strIngred7 = safeResp.meals[0].strIngredient7 {
//                    if strIngred7 != "" {
//                        self.strIngred7Lbl.isHidden = false
//                        self.strIngred7Lbl.text = "Instruction 7: \(strIngred7)"
//                    } else {
//                        self.strIngred7Lbl.isHidden = true
//                    }
//                } else {
//                    self.strIngred7Lbl.isHidden = true
//                }
//                if let strIngred8 = safeResp.meals[0].strIngredient8 {
//                    if strIngred8 != "" {
//                        self.strIngred8Lbl.isHidden = false
//                        self.strIngred8Lbl.text = "Instruction 8: \(strIngred8)"
//                    } else {
//                        self.strIngred8Lbl.isHidden = true
//                    }
//                } else {
//                    self.strIngred8Lbl.isHidden = true
//                }
//                if let strIngred9 = safeResp.meals[0].strIngredient9 {
//                    if strIngred9 != "" {
//                        self.strIngred9Lbl.isHidden = false
//                        self.strIngred9Lbl.text = "Instruction 9: \(strIngred9)"
//                    } else {
//                        self.strIngred9Lbl.isHidden = true
//                    }
//                } else {
//                    self.strIngred9Lbl.isHidden = true
//                }
//                if let strIngred10 = safeResp.meals[0].strIngredient10 {
//                    if strIngred10 != "" {
//                        self.strIngred10Lbl.isHidden = false
//                        self.strIngred10Lbl.text = "Instruction 10: \(strIngred10)"
//                    } else {
//                        self.strIngred10Lbl.isHidden = true
//                    }
//                } else {
//                    self.strIngred10Lbl.isHidden = true
//                }
//                if let strIngred11 = safeResp.meals[0].strIngredient11 {
//                    if strIngred11 != "" {
//                        self.strIngred11Lbl.isHidden = false
//                        self.strIngred11Lbl.text = "Instruction 11: \(strIngred11)"
//                    } else {
//                        self.strIngred11Lbl.isHidden = true
//                    }
//                } else {
//                    self.strIngred11Lbl.isHidden = true
//                }
//                if let strIngred12 = safeResp.meals[0].strIngredient12 {
//                    if strIngred12 != "" {
//                        self.strIngred12Lbl.isHidden = false
//                        self.strIngred12Lbl.text = "Instruction 12: \(strIngred12)"
//                    } else {
//                        self.strIngred12Lbl.isHidden = true
//                    }
//                } else {
//                    self.strIngred12Lbl.isHidden = true
//                }
//                if let strIngred13 = safeResp.meals[0].strIngredient13 {
//                    if strIngred13 != "" {
//                        self.strIngred13Lbl.isHidden = false
//                        self.strIngred13Lbl.text = "Instruction 13: \(strIngred13)"
//                    } else {
//                        self.strIngred13Lbl.isHidden = true
//                    }
//                } else {
//                    self.strIngred13Lbl.isHidden = true
//                }
//                if let strIngred14 = safeResp.meals[0].strIngredient14 {
//                    if strIngred14 != "" {
//                        self.strIngred14Lbl.isHidden = false
//                        self.strIngred14Lbl.text = "Instruction 14: \(strIngred14)"
//                    } else {
//                        self.strIngred14Lbl.isHidden = true
//                    }
//                } else {
//                    self.strIngred14Lbl.isHidden = true
//                }
//                if let strIngred15 = safeResp.meals[0].strIngredient15 {
//                    if strIngred15 != "" {
//                        self.strIngred15Lbl.isHidden = false
//                        self.strIngred15Lbl.text = "Instruction 15: \(strIngred15)"
//                    } else {
//                        self.strIngred15Lbl.isHidden = true
//                    }
//                } else {
//                    self.strIngred15Lbl.isHidden = true
//                }
//                if let strIngred16 = safeResp.meals[0].strIngredient16 {
//                    if strIngred16 != "" {
//                        self.strIngred16Lbl.isHidden = false
//                        self.strIngred16Lbl.text = "Instruction 16: \(strIngred16)"
//                    } else {
//                        self.strIngred16Lbl.isHidden = true
//                    }
//                } else {
//                    self.strIngred16Lbl.isHidden = true
//                }
//                if let strIngred17 = safeResp.meals[0].strIngredient17 {
//                    if strIngred17 != "" {
//                        self.strIngred17Lbl.isHidden = false
//                        self.strIngred17Lbl.text = "Instruction 17: \(strIngred17)"
//                    } else {
//                        self.strIngred17Lbl.isHidden = true
//                    }
//                } else {
//                    self.strIngred17Lbl.isHidden = true
//                }
//                if let strIngred18 = safeResp.meals[0].strIngredient18 {
//                    if strIngred18 != "" {
//                        self.strIngred18Lbl.isHidden = false
//                        self.strIngred18Lbl.text = "Instruction 18: \(strIngred18)"
//                    } else {
//                        self.strIngred18Lbl.isHidden = true
//                    }
//                } else {
//                    self.strIngred18Lbl.isHidden = true
//                }
//                if let strIngred19 = safeResp.meals[0].strIngredient19 {
//                    if strIngred19 != "" {
//                        self.strIngred19Lbl.isHidden = false
//                        self.strIngred19Lbl.text = "Instruction 19: \(strIngred19)"
//                    } else {
//                        self.strIngred19Lbl.isHidden = true
//                    }
//                } else {
//                    self.strIngred19Lbl.isHidden = true
//                }
//                if let strIngred20 = safeResp.meals[0].strIngredient20 {
//                    if strIngred20 != "" {
//                        self.strIngred20Lbl.isHidden = false
//                        self.strIngred20Lbl.text = "Instruction 20: \(strIngred20)"
//                    } else {
//                        self.strIngred20Lbl.isHidden = true
//                    }
//                } else {
//                    self.strIngred20Lbl.isHidden = true
//                }
//                
//                if let strMeasure1 = safeResp.meals[0].strMeasure1 {
//                    if strMeasure1 != " " && strMeasure1 != "" {
//                        self.strMeasure1Lbl.isHidden = false
//                        self.strMeasure1Lbl.text = "Measure 1: \(strMeasure1)"
//                    } else {
//                        self.strMeasure1Lbl.isHidden = true
//                    }
//                } else {
//                    self.strMeasure1Lbl.isHidden = true
//                }
//                if let strMeasure2 = safeResp.meals[0].strMeasure2 {
//                    if strMeasure2 != " "  && strMeasure2 != "" {
//                        self.strMeasure2Lbl.isHidden = false
//                        self.strMeasure2Lbl.text = "Measure 2: \(strMeasure2)"
//                    } else {
//                        self.strMeasure2Lbl.isHidden = true
//                    }
//                } else {
//                    self.strMeasure2Lbl.isHidden = true
//                }
//                if let strMeasure3 = safeResp.meals[0].strMeasure3 {
//                    if strMeasure3 != " " && strMeasure3 != "" {
//                        self.strMeasure3Lbl.isHidden = false
//                        self.strMeasure3Lbl.text = "Measure 3: \(strMeasure3)"
//                    } else {
//                        self.strMeasure3Lbl.isHidden = true
//                    }
//                } else {
//                    self.strMeasure3Lbl.isHidden = true
//                }
//                if let strMeasure4 = safeResp.meals[0].strMeasure4 {
//                    if strMeasure4 != " " && strMeasure4 != "" {
//                        self.strMeasure4Lbl.isHidden = false
//                        self.strMeasure4Lbl.text = "Measure 4: \(strMeasure4)"
//                    } else {
//                        self.strMeasure4Lbl.isHidden = true
//                    }
//                } else {
//                    self.strMeasure4Lbl.isHidden = true
//                }
//                if let strMeasure5 = safeResp.meals[0].strMeasure5 {
//                    if strMeasure5 != " " && strMeasure5 != "" {
//                        self.strMeasure5Lbl.isHidden = false
//                        self.strMeasure5Lbl.text = "Measure 5: \(strMeasure5)"
//                    } else {
//                        self.strMeasure5Lbl.isHidden = true
//                    }
//                } else {
//                    self.strMeasure5Lbl.isHidden = true
//                }
//                if let strMeasure6 = safeResp.meals[0].strMeasure6 {
//                    if strMeasure6 != " " && strMeasure6 != "" {
//                        self.strMeasure6Lbl.isHidden = false
//                        self.strMeasure6Lbl.text = "Measure 6: \(strMeasure6)"
//                    } else {
//                        self.strMeasure6Lbl.isHidden = true
//                    }
//                } else {
//                    self.strMeasure6Lbl.isHidden = true
//                }
//                if let strMeasure7 = safeResp.meals[0].strMeasure7 {
//                    if strMeasure7 != " " && strMeasure7 != "" {
//                        self.strMeasure7Lbl.isHidden = false
//                        self.strMeasure7Lbl.text = "Measure 7: \(strMeasure7)"
//                    } else {
//                        self.strMeasure7Lbl.isHidden = true
//                    }
//                } else {
//                    self.strMeasure7Lbl.isHidden = true
//                }
//                if let strMeasure8 = safeResp.meals[0].strMeasure8 {
//                    if strMeasure8 != " " && strMeasure8 != "" {
//                        self.strMeasure8Lbl.isHidden = false
//                        self.strMeasure8Lbl.text = "Measure 8: \(strMeasure8)"
//                    } else {
//                        self.strMeasure8Lbl.isHidden = true
//                    }
//                } else {
//                    self.strMeasure8Lbl.isHidden = true
//                }
//                if let strMeasure9 = safeResp.meals[0].strMeasure9 {
//                    if strMeasure9 != " " && strMeasure9 != "" {
//                        self.strMeasure9Lbl.isHidden = false
//                        self.strMeasure9Lbl.text = "Measure 9: \(strMeasure9)"
//                    } else {
//                        self.strMeasure9Lbl.isHidden = true
//                    }
//                } else {
//                    self.strMeasure9Lbl.isHidden = true
//                }
//                if let strMeasure10 = safeResp.meals[0].strMeasure10 {
//                    if strMeasure10 != " "  && strMeasure10 != ""{
//                        self.strMeasure10Lbl.isHidden = false
//                        self.strMeasure10Lbl.text = "Measure 10: \(strMeasure10)"
//                    } else {
//                        self.strMeasure10Lbl.isHidden = true
//                    }
//                } else {
//                    self.strMeasure10Lbl.isHidden = true
//                }
//                if let strMeasure11 = safeResp.meals[0].strMeasure11 {
//                    if strMeasure11 != " " && strMeasure11 != "" {
//                        self.strMeasure11Lbl.isHidden = false
//                        self.strMeasure11Lbl.text = "Measure 11: \(strMeasure11)"
//                    } else {
//                        self.strMeasure11Lbl.isHidden = true
//                    }
//                } else {
//                    self.strMeasure11Lbl.isHidden = true
//                }
//                if let strMeasure12 = safeResp.meals[0].strMeasure12 {
//                    if strMeasure12 != " " && strMeasure12 != "" {
//                        self.strMeasure12Lbl.isHidden = false
//                        self.strMeasure12Lbl.text = "Measure 12: \(strMeasure12)"
//                    } else {
//                        self.strMeasure12Lbl.isHidden = true
//                    }
//                } else {
//                    self.strMeasure12Lbl.isHidden = true
//                }
//                if let strMeasure13 = safeResp.meals[0].strMeasure13 {
//                    if strMeasure13 != " " && strMeasure13 != "" {
//                        self.strMeasure13Lbl.isHidden = false
//                        self.strMeasure13Lbl.text = "Measure 13: \(strMeasure13)"
//                    } else {
//                        self.strMeasure13Lbl.isHidden = true
//                    }
//                } else {
//                    self.strMeasure13Lbl.isHidden = true
//                }
//                if let strMeasure14 = safeResp.meals[0].strMeasure14 {
//                    if strMeasure14 != " " && strMeasure14 != "" {
//                        self.strMeasure14Lbl.isHidden = false
//                        self.strMeasure14Lbl.text = "Measure 14: \(strMeasure14)"
//                    } else {
//                        self.strMeasure14Lbl.isHidden = true
//                    }
//                } else {
//                    self.strMeasure14Lbl.isHidden = true
//                }
//                if let strMeasure15 = safeResp.meals[0].strMeasure15 {
//                    if strMeasure15 != " " && strMeasure15 != "" {
//                        self.strMeasure15Lbl.isHidden = false
//                        self.strMeasure15Lbl.text = "Measure 15: \(strMeasure15)"
//                    } else {
//                        self.strMeasure15Lbl.isHidden = true
//                    }
//                } else {
//                    self.strMeasure15Lbl.isHidden = true
//                }
//                if let strMeasure16 = safeResp.meals[0].strMeasure16 {
//                    if strMeasure16 != " " && strMeasure16 != "" {
//                        self.strMeasure16Lbl.isHidden = false
//                        self.strMeasure16Lbl.text = "Measure 16: \(strMeasure16)"
//                    } else {
//                        self.strMeasure16Lbl.isHidden = true
//                    }
//                } else {
//                    self.strMeasure16Lbl.isHidden = true
//                }
//                if let strMeasure17 = safeResp.meals[0].strMeasure17 {
//                    if strMeasure17 != " " && strMeasure17 != "" {
//                        self.strMeasure17Lbl.isHidden = false
//                        self.strMeasure17Lbl.text = "Measure 17: \(strMeasure17)"
//                    } else {
//                        self.strMeasure17Lbl.isHidden = true
//                    }
//                } else {
//                    self.strMeasure17Lbl.isHidden = true
//                }
//                if let strMeasure18 = safeResp.meals[0].strMeasure18 {
//                    if strMeasure18 != " " && strMeasure18 != "" {
//                        self.strMeasure18Lbl.isHidden = false
//                        self.strMeasure18Lbl.text = "Measure 18: \(strMeasure18)"
//                    } else {
//                        self.strMeasure18Lbl.isHidden = true
//                    }
//                } else {
//                    self.strMeasure18Lbl.isHidden = true
//                }
//                if let strMeasure19 = safeResp.meals[0].strMeasure19 {
//                    if strMeasure19 != " " && strMeasure19 != "" {
//                        self.strMeasure19Lbl.isHidden = false
//                        self.strMeasure19Lbl.text = "Measure 19: \(strMeasure19)"
//                    } else {
//                        self.strMeasure19Lbl.isHidden = true
//                    }
//                } else {
//                    self.strMeasure19Lbl.isHidden = true
//                }
//                if let strMeasure20 = safeResp.meals[0].strMeasure20 {
//                    if strMeasure20 != " " && strMeasure20 != "" {
//                        self.strMeasure20Lbl.isHidden = false
//                        self.strMeasure20Lbl.text = "Measure 20: \(strMeasure20)"
//                    } else {
//                        self.strMeasure20Lbl.isHidden = true
//                    }
//                } else {
//                    self.strMeasure20Lbl.isHidden = true
//                }
//                self.scrollView.isHidden = false
//                self.stackView.isHidden = false
//                self.uiViewFood.isHidden = false
//            } else {
//                self.scrollView.isHidden = true
//                self.stackView.isHidden = true
//            }
//        }
        
    }
    
}
