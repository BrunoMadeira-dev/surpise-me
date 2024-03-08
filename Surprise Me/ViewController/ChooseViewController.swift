//
//  ChooseViewController.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 27/02/2024.
//

import Foundation
import UIKit
import Alamofire

class ChooseViewController: UIViewController {
    
    @IBOutlet weak var movieBtn: UIButton!
    @IBOutlet weak var foodBtn: UIButton!
    @IBOutlet weak var boredBtn: UIButton!
     
    let networker = NetworkingCall()
    
    //MARK: take this url
    //let url = "https://corporatebs-generator.sameerkumar.website/" //mock url jus to test
    
    override func viewDidLoad() {
        styleUI()
    }
    
    func styleUI() {
        movieBtn.layer.cornerRadius = 10
        foodBtn.layer.cornerRadius = 10
        boredBtn.layer.cornerRadius = 10
        
        movieBtn.setTitle("Wich movie?", for: []) //For future feature
        foodBtn.setTitle("Recipe Randomizer", for: [])
        boredBtn.setTitle("Recipe Category", for: [])
        navigationItem.backButtonTitle = ""
        
        movieBtn.isHidden = true
        boredBtn.isHidden = false
    }
    
    
    @IBAction func movieBtnPressed(_ sender: Any) {

    }
    
}
