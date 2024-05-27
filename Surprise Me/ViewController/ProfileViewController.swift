//
//  ProfileViewController.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 22/05/2024.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profile: UILabel!
    
    
    override func viewDidLoad() {
        
        profile.text = "Profile View!!!"
        
        stileUI()
    }
    
    func stileUI() {
        //Navigation
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.title = K.titleFoodView
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.label]
    }
}
