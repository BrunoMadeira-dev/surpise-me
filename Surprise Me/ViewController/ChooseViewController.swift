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
    
    override func viewDidLoad() {
        styleUI()
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection) //possibly lokk into this warning
        
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            styleUI()
        }
    }
    
    func styleUI() {
        if traitCollection.userInterfaceStyle == .dark {
            movieBtn.isHidden = true
            boredBtn.isHidden = false
            movieBtn.setTitle("Wich movie?", for: []) //For future feature
            foodBtn.setTitle("Recipe Randomizer", for: [])
            boredBtn.setTitle("Recipe Category", for: [])
            movieBtn.layer.cornerRadius = 10
            foodBtn.layer.cornerRadius = 10
            boredBtn.layer.cornerRadius = 10
            navigationController?.setNavigationBarHidden(false, animated: false)
            navigationItem.title = K.titleFoodView
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logOutPressed))
            navigationItem.rightBarButtonItem?.tintColor = .white
            tabBarController?.tabBar.isTranslucent = false
            tabBarController?.tabBar.backgroundColor = .black
        } else {
            movieBtn.isHidden = true
            boredBtn.isHidden = false
            movieBtn.setTitle("Wich movie?", for: []) //For future feature
            foodBtn.setTitle("Recipe Randomizer", for: [])
            boredBtn.setTitle("Recipe Category", for: [])
            movieBtn.layer.cornerRadius = 10
            foodBtn.layer.cornerRadius = 10
            boredBtn.layer.cornerRadius = 10
            navigationController?.setNavigationBarHidden(false, animated: false)
            navigationItem.title = K.titleFoodView
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logOutPressed))
            navigationItem.rightBarButtonItem?.tintColor = .black
            tabBarController?.tabBar.isTranslucent = false
            tabBarController?.tabBar.backgroundColor = .white
        }
    }
    
    @objc func logOutPressed() {
        auth.userAuthLogOut { success, error in
            if error != nil {
                Utils().showCustomPopUp(title: K.warning, message: error?.localizedDescription ?? "There was an error!")
            } else {
                if let window = UIApplication.shared.windows.first {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let loginVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                    window.rootViewController = loginVC
                    self.present(loginVC, animated: true)
                }
            }
        }
    }
    
    @IBAction func movieBtnPressed(_ sender: Any) {

    }
    
    @IBAction func randomizerPressed(_ sender: Any) {
        if let navController = self.tabBarController?.selectedViewController as? UINavigationController {
            if let destinationVC = storyboard?.instantiateViewController(identifier: "FoodViewController") as? FoodViewController {
                navController.pushViewController(destinationVC, animated: true)
            }
        }
    }

    @IBAction func foodListPressed(_ sender: Any) {
        if let navController = self.tabBarController?.selectedViewController as? UINavigationController {
            if let destinationVC = storyboard?.instantiateViewController(identifier: "FoodListViewController") as? FoodListViewController {
                navController.pushViewController(destinationVC, animated: true)
            }
        }
    }
    
}
