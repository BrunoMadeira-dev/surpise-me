//
//  MovieViewController.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 29/02/2024.
//

import Foundation
import UIKit


class MovieViewController: UIViewController {
    
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var searchCategoryBtn: UIButton!
    
    var categoria: String = ""
    override func viewDidLoad() {
        
        styleUI()
    }
    
    func styleUI() {
        categoryTextField.placeholder = "Category"
        categoryTextField.borderStyle = .roundedRect
        searchCategoryBtn.setTitle("Search", for: [])
        searchCategoryBtn.layer.cornerRadius = 10
        searchCategoryBtn.layer.borderWidth = 2
        searchCategoryBtn.layer.borderColor = UIColor.black.cgColor
    }
    
    
    
    
    @IBAction func searchTapped(_ sender: Any) {
        
        
    }
    
}

extension MovieViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = categoryTextField.text {
            categoria = text
        }
        categoryTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        categoryTextField.resignFirstResponder()
        return true
    }
}
