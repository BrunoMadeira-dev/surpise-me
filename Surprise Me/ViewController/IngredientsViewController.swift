//
//  IngredientsViewController.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 05/03/2024.
//

import Foundation
import UIKit

class IngredientsViewController: UIViewController {
    
    @IBOutlet weak var ingredientsTable: UITableView!
    @IBOutlet weak var ingredientsLbl: UILabel!
    
    var mealIngredients: [MealsRecipesDataModel] = []
    var isFromList: Bool = false
    var ingredientsAndMeasures: [String: String] = [:]
    var isSelected: Bool = false
    var selectedIndex: IndexPath?
    var ingridientsData: [IngridientDataModel] = []
    

    override func viewDidLoad() {
        //populateLabels()
        styleUI()
        ingredientsTable.dataSource = self
        ingredientsTable.delegate = self
        ingredientsTable.register(UINib(nibName: K.Identifiers.ingredientCell, bundle: nil), forCellReuseIdentifier: K.Identifiers.ingridientIdentifier)
        
        for (ingridients, measures) in ingredientsAndMeasures {
            let newIngredient = IngridientDataModel(ingridient: ingridients, measure: measures)
            ingridientsData.append(newIngredient)
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection) //possibly lokk into this warning
        
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            styleUI()
        }
    }
    
    func styleUI() {
        
        if traitCollection.userInterfaceStyle == .dark {
            ingredientsLbl.text = "Ingredients"
            ingredientsLbl.font = UIFont(name: "Helvetica", size: 20)
            ingredientsLbl.font = UIFont.boldSystemFont(ofSize: 25.0)
            
            navigationController?.setNavigationBarHidden(false, animated: false)
            navigationItem.title = K.titleFoodView
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.label]
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonPressed))
            navigationItem.leftBarButtonItem?.tintColor = .white
            
            tabBarController?.tabBar.isTranslucent = false
            tabBarController?.tabBar.backgroundColor = .black
            ingredientsTable.reloadData()
        } else {
            ingredientsLbl.text = "Ingredients"
            ingredientsLbl.font = UIFont(name: "Helvetica", size: 20)
            ingredientsLbl.font = UIFont.boldSystemFont(ofSize: 25.0)
            
            navigationController?.setNavigationBarHidden(false, animated: false)
            navigationItem.title = K.titleFoodView
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.label]
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonPressed))
            navigationItem.leftBarButtonItem?.tintColor = .black
            
            tabBarController?.tabBar.isTranslucent = false
            tabBarController?.tabBar.backgroundColor = .white
            ingredientsTable.reloadData()
        }
    }
    
    @objc func backButtonPressed() {
            navigationController?.popViewController(animated: true)
    }
}


//MARK: Table View Extension
extension IngredientsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingridientsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ingredientsTable.dequeueReusableCell(withIdentifier: K.Identifiers.ingridientIdentifier, for: indexPath) as! IngredientsCell
        cell.viewCell.layer.cornerRadius = 10
        cell.viewCell.layer.shadowOffset = CGSize(width: 2, height: 5)
        cell.viewCell.layer.shadowOpacity = 0.7
        cell.viewCell.layer.shadowRadius = 5
        
        if traitCollection.userInterfaceStyle == .dark {
            cell.viewCell.backgroundColor = UIColor(named: "greyColor")
        } else {
            cell.viewCell.backgroundColor = .white
        }
        
        let key = Array(ingredientsAndMeasures.keys)
        let value = Array(ingredientsAndMeasures.values)
        cell.checkImage.image = UIImage(named: "checked")
        
        if ingridientsData[indexPath.row].isSelected {
            cell.checkImage.isHidden = false
        } else {
            cell.checkImage.isHidden = true
            
        }
        
        cell.ingridientLbl.text = "\(key[indexPath.row]) - \(value[indexPath.row])"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ingredientsTable.deselectRow(at: indexPath, animated: true)
        
        ingridientsData[indexPath.row].isSelected = !ingridientsData[indexPath.row].isSelected
        
        ingredientsTable.reloadRows(at: [indexPath], with: .automatic)
    }
}

