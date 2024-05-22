//
//  FoodViewController.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 29/02/2024.
//

import Foundation
import UIKit
import CoreImage

class FoodViewController: UIViewController {
    
    @IBOutlet weak var foodTextField: UITextField!
    @IBOutlet weak var searchFoodBtn: UIButton!
    @IBOutlet weak var foodTableView: UITableView!
    @IBOutlet weak var showMoreBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    
    var food: String = ""
    let networker = NetworkingCall()
    var mealArray: [MealsRecipesDataModel] = []
    var isLoaded: Bool = false
    var imageFinal = UIImage()
    var isFromList: Bool = false
    var ingredients: [String] = []
    var measures: [String] = []
    var ingredientsAndMeasures: [String: String] = [:]
    var isBtnSearchPressed: Bool = false
    
    override func viewDidLoad() {
        styleUI()
        
        isLoaded = false
        foodTableView.delegate = self
        foodTableView.dataSource = self
        foodTableView.reloadData()
        foodTableView.register(UINib(nibName: K.Identifiers.customFoodCell, bundle: nil), forCellReuseIdentifier: K.Identifiers.mealIdentifier)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection) //possibly lokk into this warning
        
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            styleUI()
        }
    }
    
    func styleUI() {
        //if statement to define thw workflow
        if isFromList {
            if traitCollection.userInterfaceStyle == .dark {
                foodTextField.isHidden = true
                searchFoodBtn.isHidden = true
                showMoreBtn.isHidden = false
                showMoreBtn.setTitle(K.foodBtnTitle, for: [])
                showMoreBtn.setTitleColor(.label, for: [])
                showMoreBtn.layer.cornerRadius = 10
                showMoreBtn.layer.borderWidth = 2
                showMoreBtn.layer.borderColor = UIColor.white.cgColor
                titleLbl.text = mealArray[0].strMeal
                titleLbl.font = UIFont(name: "Helvetica", size: 20)
                titleLbl.font = UIFont.boldSystemFont(ofSize: 25.0)
                navigationController?.setNavigationBarHidden(false, animated: false)
                navigationItem.title = K.titleFoodView
                navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.label]
                navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonPressed))
                navigationItem.leftBarButtonItem?.tintColor = .white
            } else {
                foodTextField.isHidden = true
                searchFoodBtn.isHidden = true
                showMoreBtn.isHidden = false
                showMoreBtn.setTitle(K.foodBtnTitle, for: [])
                showMoreBtn.setTitleColor(.label, for: [])
                showMoreBtn.layer.cornerRadius = 10
                showMoreBtn.layer.borderWidth = 2
                showMoreBtn.layer.borderColor = UIColor.black.cgColor
                titleLbl.text = mealArray[0].strMeal
                titleLbl.font = UIFont(name: "Helvetica", size: 20)
                titleLbl.font = UIFont.boldSystemFont(ofSize: 25.0)
                navigationController?.setNavigationBarHidden(false, animated: false)
                navigationItem.title = K.titleFoodView
                navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.label]
                navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonPressed))
                navigationItem.leftBarButtonItem?.tintColor = .black
            }
        } else {
            if traitCollection.userInterfaceStyle == .dark {
                foodTextField.placeholder = K.searchPlaceholder
                foodTextField.borderStyle = .roundedRect
                foodTextField.textColor = .systemBackground
                searchFoodBtn.setTitle(K.search, for: [])
                searchFoodBtn.layer.cornerRadius = 10
                searchFoodBtn.layer.borderWidth = 2
                searchFoodBtn.setTitleColor(.label, for: [])
                searchFoodBtn.tintColor = .systemBackground
                showMoreBtn.setTitle(K.foodBtnTitle, for: [])
                showMoreBtn.layer.cornerRadius = 10
                showMoreBtn.layer.borderWidth = 2
                if !isBtnSearchPressed {
                    showMoreBtn.isHidden = true
                }
                showMoreBtn.setTitleColor(.label, for: [])
                titleLbl.text = K.mainTitle
                titleLbl.font = UIFont(name: "Helvetica", size: 20)
                titleLbl.font = UIFont.boldSystemFont(ofSize: 25.0)
                titleLbl.textColor = .label
                foodTableView.backgroundColor = .systemBackground
                showMoreBtn.layer.borderColor = UIColor.white.cgColor
                searchFoodBtn.layer.borderColor = UIColor.white.cgColor
                navigationController?.setNavigationBarHidden(false, animated: false)
                navigationItem.title = K.titleFoodView
                navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.label]
                navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonPressed))
                navigationItem.leftBarButtonItem?.tintColor = .white
            } else {
                foodTextField.placeholder = K.searchPlaceholder
                foodTextField.borderStyle = .roundedRect
                foodTextField.textColor = .systemBackground
                searchFoodBtn.setTitle(K.search, for: [])
                searchFoodBtn.layer.cornerRadius = 10
                searchFoodBtn.layer.borderWidth = 2
                searchFoodBtn.setTitleColor(.label, for: [])
                showMoreBtn.setTitle(K.foodBtnTitle, for: [])
                showMoreBtn.layer.cornerRadius = 10
                showMoreBtn.layer.borderWidth = 2
                if !isBtnSearchPressed {
                    showMoreBtn.isHidden = true
                }
                showMoreBtn.setTitleColor(.label, for: [])
                titleLbl.text = K.mainTitle
                titleLbl.font = UIFont(name: "Helvetica", size: 20)
                titleLbl.font = UIFont.boldSystemFont(ofSize: 25.0)
                titleLbl.textColor = .label
                searchFoodBtn.layer.borderColor = UIColor.black.cgColor
                showMoreBtn.layer.borderColor = UIColor.black.cgColor
                foodTableView.backgroundColor = .systemBackground
                navigationController?.setNavigationBarHidden(false, animated: false)
                navigationItem.title = K.titleFoodView
                navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.label]
                navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonPressed))
                navigationItem.leftBarButtonItem?.tintColor = .black
            }
        }
    }
    
    @objc func backButtonPressed() {
        if !isFromList {
            //dismiss(animated: true)
            navigationController?.popViewController(animated: true)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func searchFoodPressed(_ sender: Any) {
        foodTextField.endEditing(true)
        food = foodTextField.text ?? ""
        isBtnSearchPressed = true
        //When button is pressed checks if the textfield is empty or not if empty hides the textfield and presents the recipe
        //if theres a keyword 
        if food == "" {
            foodTextField.isHidden = true
            requestFood(url: K.foodRandomURL)
            foodTableView.reloadData()
        } else {
            foodTextField.isHidden = false
            let categoryURL = "\(K.foodSearchURL)\(food)"
            requestFood(url: categoryURL)
            foodTextField.text = "" //clears the textfield for another search
        }
    }
    
    @IBAction func ingredientsBtnPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Ingredients", bundle: nil)
        
       let vc = storyboard.instantiateViewController(withIdentifier: K.Identifiers.ingredienViewController) as! IngredientsViewController
        vc.ingredientsAndMeasures = self.ingredientsAndMeasures
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: Tableview Extensions
extension FoodViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //if fromList = true means that there is already information needed to show something
        //if isLoaded = true means that there is something from the search
        if isFromList || isLoaded {
            return 1
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meal = mealArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifiers.mealIdentifier, for: indexPath) as! FoodCell
        if isFromList {
            cell.foodTitleLbl.isHidden = true
            cell.foodCategoryLbl.text = "Category: \(meal.strCategory ?? "")"
            cell.foodCountryLbl.text = "Country: \(meal.strArea ?? "")"
            cell.foodInstructsLbl.text = "Instructions: \n\(meal.strInstructions ?? "")"
            cell.foodImage.image = imageFinal
            cell.foodImage.layer.cornerRadius = 10
            cell.isUserInteractionEnabled = false
        } else {
            cell.foodTitleLbl.text = "Name: \(meal.strMeal ?? "" )"
            cell.foodCategoryLbl.text = "Category: \(meal.strCategory ?? "")"
            cell.foodCountryLbl.text = "Country: \(meal.strArea ?? "")"
            cell.foodInstructsLbl.text = "Instructions: \n\(meal.strInstructions ?? "")"
            cell.foodImage.image = imageFinal
            cell.foodImage.layer.cornerRadius = 10
            cell.isUserInteractionEnabled = false
        }
        return cell
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
        Utils().showProgressPopUp(view: self.view)
        FoodDataManager().fetchRandomFood(url: url) { responseObject, error in
            if let error = error {
                let alert = Utils().showPopup(title: K.warning, message: "There was an error: \(error.localizedDescription.description)")
                self.present(alert, animated: true)
                print(error)
                Utils().hideProgressPopUp(view: self.view)
            }
            if let safeResp = responseObject {
                self.mealArray = []
                self.mealArray.append(contentsOf: safeResp.meals)
                self.isLoaded = true
                
                let ingredientsAndMeasure = self.mealArray[0].ingredientsAndMeasures()
                self.ingredientsAndMeasures = ingredientsAndMeasure
                print(self.ingredientsAndMeasures.count)
                FoodDataManager().fetchImage(url: safeResp.meals[0].strMealThumb ?? "") { data, error in
                    if error != nil {
                        let alert = Utils().showPopup(title: K.warning, message: "There was an error in image processing: \(error?.localizedDescription.description ?? "Erro!")")
                        self.present(alert, animated: true)
                        print(error ?? "erro")
                        Utils().hideProgressPopUp(view: self.view)
                    } else {
                        self.imageFinal = data!
                        self.foodTableView.reloadData()
                        Utils().hideProgressPopUp(view: self.view)
                        self.showMoreBtn.isHidden = false
                    }
                }

            } else {
                Utils().hideProgressPopUp(view: self.view)
                print("Error obtaining an answer")
            }
        }
    }
}
