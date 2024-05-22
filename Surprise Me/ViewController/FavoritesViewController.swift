//
//  FavoritesViewController.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 22/05/2024.
//

import Foundation
import UIKit

class FavoritesViewController: UIViewController {
    
    @IBOutlet weak var favorites: UILabel!
    
    
    override func viewDidLoad() {
        favorites.text = "Favorites Screen!!"
    }
}
