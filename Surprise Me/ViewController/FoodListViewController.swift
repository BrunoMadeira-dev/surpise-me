//
//  FoodListViewController.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 06/03/2024.
//

import Foundation
import UIKit
import Kingfisher

class FoodListViewController: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var searchFieldLbl: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var tableview: UITableView!
    
    var mealArray: [MealsDetailCategoryDataModel] = []
    var imageArray: [UIImage?] = []
    var mealSelected: [MealsRecipesDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleUI()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.isUserInteractionEnabled = true
        tableview.register(UINib(nibName: K.Identifiers.foodListCell, bundle: nil), forCellReuseIdentifier: K.Identifiers.categoryIdentifier)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection) //possibly lokk into this warning
        
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            styleUI()
        }
    }
    
    func styleUI() {
        
        if traitCollection.userInterfaceStyle == .dark {
            searchFieldLbl.placeholder = K.category
            searchFieldLbl.borderStyle = .roundedRect
            searchFieldLbl.textColor = .label
            titleLbl.text = K.recipeCat
            titleLbl.font = UIFont(name: "Helvetica", size: 20)
            titleLbl.font = UIFont.boldSystemFont(ofSize: 25.0)
            searchBtn.setTitle(K.search, for: [])
            searchBtn.layer.cornerRadius = 10
            searchBtn.layer.borderWidth = 2
            searchBtn.layer.borderColor = UIColor.white.cgColor
            searchBtn.setTitleColor(.label, for: [])
            
            //Navigation
            navigationController?.setNavigationBarHidden(false, animated: false)
            navigationItem.title = K.titleFoodView
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.label]
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonPressed))
            navigationItem.leftBarButtonItem?.tintColor = .white
            
            tabBarController?.tabBar.isTranslucent = false
            tabBarController?.tabBar.backgroundColor = .black
        } else {
            searchFieldLbl.placeholder = K.category
            searchFieldLbl.borderStyle = .roundedRect
            searchFieldLbl.textColor = .label
            titleLbl.text = K.recipeCat
            titleLbl.font = UIFont(name: "Helvetica", size: 20)
            titleLbl.font = UIFont.boldSystemFont(ofSize: 25.0)
            searchBtn.setTitle(K.search, for: [])
            searchBtn.layer.cornerRadius = 10
            searchBtn.layer.borderWidth = 2
            searchBtn.layer.borderColor = UIColor.black.cgColor
            searchBtn.setTitleColor(.label, for: [])
            
            //Navigation
            navigationController?.setNavigationBarHidden(false, animated: false)
            navigationItem.title = K.titleFoodView
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.label]
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonPressed))
            navigationItem.leftBarButtonItem?.tintColor = .black
            tabBarController?.tabBar.isTranslucent = false
            tabBarController?.tabBar.backgroundColor = .white
        }
    }
    
    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func searchPressed(_ sender: Any) {
        searchFieldLbl.endEditing(true)
        let category = searchFieldLbl.text ?? ""
        if category == "" {
            DispatchQueue.main.async {
                let alert = Utils().showPopup(title: K.warning, message: K.phrases.notEmpty)
                self.present(alert, animated: true)
            }
        } else {
            let url = "\(K.foodCategoryURL)\(category)"
            fetchCategoryFood(url: url)
            searchFieldLbl.text = ""
        }
    }
}

//MARK: Tableview extension
extension FoodListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mealArray.count != 0 {
            return mealArray.count
        } else { return 0 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meal = mealArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifiers.categoryIdentifier, for: indexPath) as! FoodListCell
        
        if traitCollection.userInterfaceStyle == .dark {
            cell.view.backgroundColor = UIColor(named: "greyColor")
        } else {
            cell.view.backgroundColor = .white
        }
        
        cell.foodListLbl.text = meal.strMeal
        cell.idMeal = meal.idMeal ?? ""
        if let image = imageArray[indexPath.row] {
            cell.foodImageList.image = image
        } else {
            cell.foodImageList.image = UIImage(systemName: "pencil.circle")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
        let info = mealArray[indexPath.row].idMeal
        let url = "\(K.foodByIdURL)\(info ?? "")"
        fetchRecipeFromTable(url: url, imageData: imageArray[indexPath.row]!)
    }
}

//MARK: Functions to call API
extension FoodListViewController {
    
    func fetchCategoryFood(url: String) {
        
        FoodDataManager().fetchCategory(url: url) { responseObject, error in
            
            if let error = error {
                let alert = Utils().showPopup(title: K.warning, message: "There was an error: \(error.localizedDescription.description)")
                self.present(alert, animated: true)
                print(error)
            } else {
                Utils().showProgressPopUp(view: self.view)
                var count = 0
                if let response = responseObject {
                    self.mealArray = [] //clears the array to display knew foods
                    self.imageArray = []
                    self.mealArray.append(contentsOf: response.meals)
                    for meal in self.mealArray {
                        let url = URL(string: meal.strMealThumb ?? "")
                        KingfisherManager.shared.retrieveImage(with: url!) { result in
                            switch result {
                            case .success(let image):
                                // Retrives an image from RetrieveImageResult
                                self.imageArray.append(image.image)  // Know its correct image its a UIImage?
                            case .failure(let error):
                                //Displays a warning with a message from the api
                                let alert = Utils().showPopup(title: K.warning, message: "There was an error in image processing: \(error.localizedDescription.description)")
                                self.present(alert, animated: true)
                                print(error)
                            }
                            //only do tableview.reload after both arrays are equal
                            if self.imageArray.count == self.mealArray.count {
                                self.tableview.reloadData()
                                Utils().hideProgressPopUp(view: self.view)
                            } else {
                                count += 1
                                print("The Arrays aren't equal yet: \(count)")
                            }
                        }
                    }
                }
            }
        }
    }
    
    //Function to get the recipe when
    func fetchRecipeFromTable(url: String, imageData: UIImage) {
        FoodDataManager().fetchById(url: url) { responseObject, error in
            if let error = error {
                let alert = Utils().showPopup(title: K.warning, message: "There was an error: \(error.localizedDescription.description)")
                self.present(alert, animated: true)
                print(error)
                Utils().hideProgressPopUp(view: self.view)
            } else {
                Utils().showProgressPopUp(view: self.view)
                if let vc = self.storyboard?.instantiateViewController(identifier: K.Identifiers.foodViewController) as? FoodViewController {
                    if let safeResponse = responseObject?.meals {
                        self.mealSelected = []
                        self.mealSelected.append(contentsOf: safeResponse)
                        vc.mealArray = responseObject!.meals
                        vc.isFromList = true
                        vc.imageFinal = imageData
                        let ingredientsAndMeasure = self.mealSelected[0].ingredientsAndMeasures()
                        vc.ingredientsAndMeasures = ingredientsAndMeasure
                        self.navigationController?.pushViewController(vc, animated: true)
                        Utils().hideProgressPopUp(view: self.view)
                    }
                }
            }
        }
    }
}
