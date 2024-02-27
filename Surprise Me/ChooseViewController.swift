//
//  ChooseViewController.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 27/02/2024.
//

import Foundation
import UIKit

class ChooseViewController: UIViewController {
    
    @IBOutlet weak var movieBtn: UIButton!
    @IBOutlet weak var foodBtn: UIButton!
    @IBOutlet weak var boredBtn: UIButton!
    
    
    override func viewDidLoad() {
        styleUI()
    }
    
    func styleUI() {
        movieBtn.layer.cornerRadius = 10
        foodBtn.layer.cornerRadius = 10
        boredBtn.layer.cornerRadius = 10
        
        movieBtn.titleLabel?.text = "Wich Movie?"
        foodBtn.titleLabel?.text = "What to eat?"
        boredBtn.titleLabel?.text = "What to do?"
    }
    
}
