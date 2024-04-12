//
//  ViewController.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 26/02/2024.
//

import UIKit
import CLTypingLabel

class ViewController: UIViewController {

    @IBOutlet weak var welcomeLbl: CLTypingLabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var logInBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        welcomeLbl.text = "Surprise me"
        startBtn.layer.cornerRadius = 20
        startBtn.setTitle("Sign In", for: [])
        logInBtn.layer.cornerRadius = 20
        logInBtn.setTitle("Log In", for: [])
        navigationItem.backButtonTitle = ""
    }

    @IBAction func startPressed(_ sender: Any) {
    }
    
}

