//
//  FoodViewController.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 29/02/2024.
//

import Foundation
import UIKit
import CoreImage

class FoodViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var foodTextField: UITextField!
    @IBOutlet weak var searchFoodBtn: UIButton!
    @IBOutlet weak var foodTableView: UITableView!
    @IBOutlet weak var showMoreBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    
    var stackViewHeight: Double = 0.0
    var food: String = ""
    let networker = NetworkingCall()
    var mealArray: [MealsRecipesDataModel] = []
    var isLoaded: Bool = false
    var imageFinal = UIImage()
    var isFromList: Bool = false
    
    override func viewDidLoad() {
        styleUI()
        isLoaded = false
        foodTableView.delegate = self
        foodTableView.dataSource = self
        foodTableView.reloadData()
        foodTableView.register(UINib(nibName: "FooCell", bundle: nil), forCellReuseIdentifier: K.Identifiers.mealIdentifier)
        titleLbl.text = "Recipe Randomizer"
        titleLbl.font = UIFont(name: "Helvetica", size: 20)
        titleLbl.font = UIFont.boldSystemFont(ofSize: 25.0)
    }
    
    func styleUI() {
        
        //if statement to define thw workflow
        if isFromList {
            foodTextField.isHidden = true
            searchFoodBtn.isHidden = true
            showMoreBtn.isHidden = false
            showMoreBtn.setTitle("Ingredients and measures", for: [])
            showMoreBtn.layer.cornerRadius = 10
            showMoreBtn.layer.borderWidth = 2
            showMoreBtn.layer.borderColor = UIColor.black.cgColor
        } else {
            foodTextField.placeholder = "Recipe Name"
            foodTextField.borderStyle = .roundedRect
            searchFoodBtn.setTitle("Search", for: [])
            searchFoodBtn.layer.cornerRadius = 10
            searchFoodBtn.layer.borderWidth = 2
            searchFoodBtn.layer.borderColor = UIColor.black.cgColor
            searchFoodBtn.setTitleColor(UIColor.black, for: [])
            showMoreBtn.setTitle("Ingredients and measures", for: [])
            showMoreBtn.layer.cornerRadius = 10
            showMoreBtn.layer.borderWidth = 2
            showMoreBtn.layer.borderColor = UIColor.black.cgColor
            showMoreBtn.isHidden = true
        }
        navigationItem.title = "Foodie"
        navigationItem.backButtonTitle = ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFromList || isLoaded {
            return 1
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meal = mealArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifiers.mealIdentifier, for: indexPath) as! FoodCell
    
        cell.foodTitleLbl.text = "Name: \(meal.strMeal ?? "" )"
        cell.foodCategoryLbl.text = "Category: \(meal.strCategory ?? "")"
        cell.foodCountryLbl.text = "Country: \(meal.strArea ?? "")"
        cell.foodInstructsLbl.text = "Instructions: \(meal.strInstructions ?? "")"
        cell.foodImage.image = imageFinal
        cell.foodImage.layer.cornerRadius = 10
        cell.isUserInteractionEnabled = false
        
        return cell
    }
    
    @IBAction func searchFoodPressed(_ sender: Any) {
        foodTextField.endEditing(true)
        food = foodTextField.text ?? ""
        //When button is pressed checks if the textfield is empty or not if empty hides the textfield and presents the recipe
        //if theres a keyword 
        if food == "" {
            foodTextField.isHidden = true
            requestFood(url: K.foodRandomURL)
            foodTableView.reloadData()
        } else {
            foodTextField.isHidden = false
            let categoryURL = "\(K.foodSearchURL)s=\(food)"
            requestFood(url: categoryURL)
            foodTextField.text = "" //clears the textfield for another search
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "IngredientSegue" {
            if let destVC = segue.destination as? IngredientsViewController {
                
                destVC.mealIngredients = mealArray
            }
        }
    }
    
    @IBAction func ingredientsBtnPressed(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Ingredients", bundle: nil)
        let navVC = storyboard.instantiateViewController(withIdentifier: "ingredientsViewController") as! IngredientsViewController
        
        navVC.mealIngredients = mealArray
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
                self.mealArray = []
                self.mealArray.append(contentsOf: safeResp.meals)
                self.isLoaded = true
                self.showMoreBtn.isHidden = false
                
                FoodDataManager().fetchImage(url: safeResp.meals[0].strMealThumb ?? "") { data in
                    self.imageFinal = data!
                    self.foodTableView.reloadData()
                }

            } else {
                print("Error obtaining an answer")
            }
        }
    }
}
