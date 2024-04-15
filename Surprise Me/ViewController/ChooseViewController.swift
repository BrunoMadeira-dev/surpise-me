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
    let auth = UserAuthentication()
    
    //MARK: take this url
    //let url = "https://corporatebs-generator.sameerkumar.website/" //mock url jus to test
    
    override func viewDidLoad() {
        styleUI()
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.title = K.titleFoodView
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logOutPressed))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    func styleUI() {
        movieBtn.isHidden = true
        boredBtn.isHidden = false
        movieBtn.setTitle("Wich movie?", for: []) //For future feature
        foodBtn.setTitle("Recipe Randomizer", for: [])
        boredBtn.setTitle("Recipe Category", for: [])
        movieBtn.layer.cornerRadius = 10
        foodBtn.layer.cornerRadius = 10
        boredBtn.layer.cornerRadius = 10
    }
    
    @objc func logOutPressed() {
        auth.userAuthLogOut { success, error in
            if error != nil {
                let alert = Utils().showPopup(title: "Alert", message: error?.localizedDescription ?? "There was an error!")
                self.present(alert, animated: true)
            } else {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Segue.foodSegue {
            if let destinationVC = segue.destination as? FoodViewController {
                
                let navVC = UINavigationController(rootViewController: destinationVC)
                navVC.modalPresentationStyle = .fullScreen
                present(navVC, animated: true, completion: nil)
            }
        } else if segue.identifier == K.Segue.foodListSegue {
            if let destinationVC = segue.destination as? FoodListViewController {
                
                let navVC = UINavigationController(rootViewController: destinationVC)
                navVC.modalPresentationStyle = .fullScreen
                present(navVC, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func movieBtnPressed(_ sender: Any) {

    }
    
    @IBAction func randomizerPressed(_ sender: Any) {
        performSegue(withIdentifier: K.Segue.foodSegue, sender: nil)
    }

    @IBAction func foodListPressed(_ sender: Any) {
        performSegue(withIdentifier: K.Segue.foodListSegue, sender: nil)
    }
    
}
