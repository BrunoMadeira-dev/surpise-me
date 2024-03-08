//
//  IngredientsViewController.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 05/03/2024.
//

import Foundation
import UIKit

class IngredientsViewController: UIViewController {
    
    @IBOutlet weak var ingredientesScrollView: UIScrollView!
    @IBOutlet weak var ingredientsStackView: UIStackView!
    @IBOutlet weak var titleLbl: UILabel!
    
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
    
    var mealIngredients: [MealsRecipesDataModel] = []

    override func viewDidLoad() {
        populateLabels()
        styleUI()
    }
    
    func styleUI() {
        titleLbl.text = "Ingredients"
        titleLbl.font = UIFont(name: "Helvetica", size: 20)
        titleLbl.font = UIFont.boldSystemFont(ofSize: 25.0)
    }
    
    func populateLabels() {
        if !mealIngredients.isEmpty {

            if let strIngred1 = mealIngredients[0].strIngredient1 {
                    if strIngred1 != "" {
                        self.strIngred1Lbl.isHidden = false
                        self.strIngred1Lbl.text = "Instruction 1: \(strIngred1) - (\(mealIngredients[0].strMeasure1 ?? ""))"
                    } else {
                        self.strIngred1Lbl.isHidden = true
                    }
                } else {
                    self.strIngred1Lbl.isHidden = true
                }
                if let strIngred2 = mealIngredients[0].strIngredient2 {
                    if strIngred2 != "" {
                        self.strIngred2Lbl.isHidden = false
                        self.strIngred2Lbl.text = "Instruction 2: \(strIngred2) - (\(mealIngredients[0].strMeasure2 ?? ""))"
                    } else {
                        self.strIngred2Lbl.isHidden = true
                    }
                } else {
                    self.strIngred2Lbl.isHidden = true
                }
                if let strIngred3 = mealIngredients[0].strIngredient3 {
                    if strIngred3 != "" {
                        self.strIngred3Lbl.isHidden = false
                        self.strIngred3Lbl.text = "Instruction 3: \(strIngred3) - (\(mealIngredients[0].strMeasure3 ?? ""))"
                    } else {
                        self.strIngred3Lbl.isHidden = true
                    }
                } else {
                    self.strIngred3Lbl.isHidden = true
                }
                if let strIngred4 = mealIngredients[0].strIngredient4 {
                    if strIngred4 != "" {
                        self.strIngred4Lbl.isHidden = false
                        self.strIngred4Lbl.text = "Instruction 4: \(strIngred4) - (\(mealIngredients[0].strMeasure4 ?? ""))"
                    } else {
                        self.strIngred4Lbl.isHidden = true
                    }
                } else {
                    self.strIngred4Lbl.isHidden = true
                }
                if let strIngred5 = mealIngredients[0].strIngredient5 {
                    if strIngred5 != "" {
                        self.strIngred5Lbl.isHidden = false
                        self.strIngred5Lbl.text = "Instruction 5: \(strIngred5) - (\(mealIngredients[0].strMeasure5 ?? ""))"
                    } else {
                        self.strIngred5Lbl.isHidden = true
                    }
                } else {
                    self.strIngred5Lbl.isHidden = true
                }
                if let strIngred6 = mealIngredients[0].strIngredient6 {
                    if strIngred6 != "" {
                        self.strIngred6Lbl.isHidden = false
                        self.strIngred6Lbl.text = "Instruction 6: \(strIngred6) - (\(mealIngredients[0].strMeasure6 ?? ""))"
                    } else {
                        self.strIngred6Lbl.isHidden = true
                    }
                } else {
                    self.strIngred6Lbl.isHidden = true
                }
                if let strIngred7 = mealIngredients[0].strIngredient7 {
                    if strIngred7 != "" {
                        self.strIngred7Lbl.isHidden = false
                        self.strIngred7Lbl.text = "Instruction 7: \(strIngred7) - (\(mealIngredients[0].strMeasure7 ?? ""))"
                    } else {
                        self.strIngred7Lbl.isHidden = true
                    }
                } else {
                    self.strIngred7Lbl.isHidden = true
                }
                if let strIngred8 = mealIngredients[0].strIngredient8 {
                    if strIngred8 != "" {
                        self.strIngred8Lbl.isHidden = false
                        self.strIngred8Lbl.text = "Instruction 8: \(strIngred8) - (\(mealIngredients[0].strMeasure8 ?? ""))"
                    } else {
                        self.strIngred8Lbl.isHidden = true
                    }
                } else {
                    self.strIngred8Lbl.isHidden = true
                }
                if let strIngred9 = mealIngredients[0].strIngredient9 {
                    if strIngred9 != "" {
                        self.strIngred9Lbl.isHidden = false
                        self.strIngred9Lbl.text = "Instruction 9: \(strIngred9) - (\(mealIngredients[0].strMeasure9 ?? ""))"
                    } else {
                        self.strIngred9Lbl.isHidden = true
                    }
                } else {
                    self.strIngred9Lbl.isHidden = true
                }
                if let strIngred10 = mealIngredients[0].strIngredient10 {
                    if strIngred10 != "" {
                        self.strIngred10Lbl.isHidden = false
                        self.strIngred10Lbl.text = "Instruction 10: \(strIngred10) - (\(mealIngredients[0].strMeasure10 ?? ""))"
                    } else {
                        self.strIngred10Lbl.isHidden = true
                    }
                } else {
                    self.strIngred10Lbl.isHidden = true
                }
                if let strIngred11 = mealIngredients[0].strIngredient11 {
                    if strIngred11 != "" {
                        self.strIngred11Lbl.isHidden = false
                        self.strIngred11Lbl.text = "Instruction 11: \(strIngred11) - (\(mealIngredients[0].strMeasure11 ?? ""))"
                    } else {
                        self.strIngred11Lbl.isHidden = true
                    }
                } else {
                    self.strIngred11Lbl.isHidden = true
                }
                if let strIngred12 = mealIngredients[0].strIngredient12 {
                    if strIngred12 != "" {
                        self.strIngred12Lbl.isHidden = false
                        self.strIngred12Lbl.text = "Instruction 12: \(strIngred12) - (\(mealIngredients[0].strMeasure12 ?? ""))"
                    } else {
                        self.strIngred12Lbl.isHidden = true
                    }
                } else {
                    self.strIngred12Lbl.isHidden = true
                }
                if let strIngred13 = mealIngredients[0].strIngredient13 {
                    if strIngred13 != "" {
                        self.strIngred13Lbl.isHidden = false
                        self.strIngred13Lbl.text = "Instruction 13: \(strIngred13)-: (\(mealIngredients[0].strMeasure13 ?? ""))"
                    } else {
                        self.strIngred13Lbl.isHidden = true
                    }
                } else {
                    self.strIngred13Lbl.isHidden = true
                }
                if let strIngred14 = mealIngredients[0].strIngredient14 {
                    if strIngred14 != "" {
                        self.strIngred14Lbl.isHidden = false
                        self.strIngred14Lbl.text = "Instruction 14: \(strIngred14) - (\(mealIngredients[0].strMeasure14 ?? ""))"
                    } else {
                        self.strIngred14Lbl.isHidden = true
                    }
                } else {
                    self.strIngred14Lbl.isHidden = true
                }
                if let strIngred15 = mealIngredients[0].strIngredient15 {
                    if strIngred15 != "" {
                        self.strIngred15Lbl.isHidden = false
                        self.strIngred15Lbl.text = "Instruction 15: \(strIngred15) - (\(mealIngredients[0].strMeasure15 ?? ""))"
                    } else {
                        self.strIngred15Lbl.isHidden = true
                    }
                } else {
                    self.strIngred15Lbl.isHidden = true
                }
                if let strIngred16 = mealIngredients[0].strIngredient16 {
                    if strIngred16 != "" {
                        self.strIngred16Lbl.isHidden = false
                        self.strIngred16Lbl.text = "Instruction 16: \(strIngred16) - (\(mealIngredients[0].strMeasure16 ?? ""))"
                    } else {
                        self.strIngred16Lbl.isHidden = true
                    }
                } else {
                    self.strIngred16Lbl.isHidden = true
                }
                if let strIngred17 = mealIngredients[0].strIngredient17 {
                    if strIngred17 != "" {
                        self.strIngred17Lbl.isHidden = false
                        self.strIngred17Lbl.text = "Instruction 17: \(strIngred17) - (\(mealIngredients[0].strMeasure17 ?? ""))"
                    } else {
                        self.strIngred17Lbl.isHidden = true
                    }
                } else {
                    self.strIngred17Lbl.isHidden = true
                }
                if let strIngred18 = mealIngredients[0].strIngredient18 {
                    if strIngred18 != "" {
                        self.strIngred18Lbl.isHidden = false
                        self.strIngred18Lbl.text = "Instruction 18: \(strIngred18) - (\(mealIngredients[0].strMeasure18 ?? ""))"
                    } else {
                        self.strIngred18Lbl.isHidden = true
                    }
                } else {
                    self.strIngred18Lbl.isHidden = true
                }
                if let strIngred19 = mealIngredients[0].strIngredient19 {
                    if strIngred19 != "" {
                        self.strIngred19Lbl.isHidden = false
                        self.strIngred19Lbl.text = "Instruction 19: \(strIngred19) - (\(mealIngredients[0].strMeasure19 ?? ""))"
                    } else {
                        self.strIngred19Lbl.isHidden = true
                    }
                } else {
                    self.strIngred19Lbl.isHidden = true
                }
                if let strIngred20 = mealIngredients[0].strIngredient20 {
                    if strIngred20 != "" {
                        self.strIngred20Lbl.isHidden = false
                        self.strIngred20Lbl.text = "Instruction 20: \(strIngred20) - (\(mealIngredients[0].strMeasure20 ?? ""))"
                    } else {
                        self.strIngred20Lbl.isHidden = true
                    }
                } else {
                    self.strIngred20Lbl.isHidden = true
                }
        } else {
            print("Theres nothing to show")
        }
    }
}
