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
    let url = "https://corporatebs-generator.sameerkumar.website/" //mock url jus to test
    
    override func viewDidLoad() {
        styleUI()
    }
    
    func styleUI() {
        movieBtn.layer.cornerRadius = 10
        foodBtn.layer.cornerRadius = 10
        boredBtn.layer.cornerRadius = 10
        
        movieBtn.setTitle("Wich movie?", for: [])
        foodBtn.setTitle("What to eat?", for: [])
        boredBtn.setTitle("What to do?", for: [])
        navigationItem.backButtonTitle = ""
        
        movieBtn.isHidden = true
        boredBtn.isHidden = true
    }
    
    //TODO: Remove this function
//    func getPhrases() {
//        networker.responseCall(url: url, responseType: EnterpriseDataModel?.self) { response, error in
//            if let responseNew = response??.phrase {
//                print(responseNew)
//            }
//        }
//    }
    
    @IBAction func movieBtnPressed(_ sender: Any) {
        //getPhrases()
    }
    
}
