//
//  FoodListViewController.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 06/03/2024.
//

import Foundation
import UIKit
import Kingfisher

class FoodListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var searchFieldLbl: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var tableview: UITableView!
    
    var isLoaded: Bool = false
    var mealArray: [MealsDetailCategoryDataModel] = []
    var imageArray: [UIImage?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleUI()
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.register(UINib(nibName: "FoodListCell", bundle: nil), forCellReuseIdentifier: K.Identifiers.categoryIdentifier)
    }
    
    func styleUI() {
        searchFieldLbl.placeholder = "Category"
        searchFieldLbl.borderStyle = .roundedRect
        
        searchBtn.setTitle("Search", for: [])
        searchBtn.layer.cornerRadius = 10
        searchBtn.layer.borderWidth = 2
        searchBtn.layer.borderColor = UIColor.black.cgColor
        searchBtn.setTitleColor(UIColor.black, for: [])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if mealArray.count != 0 {
            return mealArray.count
        } else { return 0 }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meal = mealArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifiers.categoryIdentifier, for: indexPath) as! FoodListCell
        
        cell.foodListLbl.text = meal.strMeal
        if let image = imageArray[indexPath.row] {
            cell.foodImageList.image = image
        } else {
            cell.foodImageList.image = UIImage(systemName: "pencil.circle")
        }
        
        return cell
    }
    
    @IBAction func searchPressed(_ sender: Any) {
        searchFieldLbl.endEditing(true)
        var category = searchFieldLbl.text ?? ""
        let warning: UIAlertController = UIAlertController(title: "Warning", message: "You have to choose a category", preferredStyle: .alert)
        if category == "" {
            warning.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
            self.navigationController?.present(warning, animated: true, completion: nil)
            
        } else {
            let url = "\(K.foodCategoryURL)c=\(category)"
            fetchCategoryFood(url: url)
            tableview.reloadData()
            searchFieldLbl.text = ""
        }
    }
}

extension FoodListViewController {
    
    func fetchCategoryFood(url: String) {
        
        FoodDataManager().fetchCategory(url: url) { responseObject, error in
            
            if let error = error {
                print(error)
            }
            
            if let response = responseObject {
                self.mealArray = []
                self.mealArray.append(contentsOf: response.meals)
                //self.tableview.reloadData()
                for meal in self.mealArray {
                    let url = URL(string: meal.strMealThumb ?? "")
                    KingfisherManager.shared.retrieveImage(with: url!) { result in
                        switch result {
                        case .success(let image):
                            // Extraia a imagem do RetrieveImageResult
                            self.imageArray.append(image.image)  // Agora está correto, pois image é um UIImage?
                        case .failure(let error):
                            print(error)
                        }
                        
                        if self.imageArray.count == self.mealArray.count {
                            self.tableview.reloadData()
                        } else {
                            print("Algo deu erro")
                        }
                    }
                }
            }
        }
    }
}
