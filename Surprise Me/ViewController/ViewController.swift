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
    @IBOutlet weak var logInStackView: UIStackView!
    @IBOutlet weak var signInStackview: UIStackView!
    @IBOutlet weak var logInEmail: UITextField!
    @IBOutlet weak var logInPassword: UITextField!
    @IBOutlet weak var signInEmail: UITextField!
    @IBOutlet weak var signInPassword: UITextField!
    @IBOutlet weak var buttonStackView: UIStackView!
    @IBOutlet weak var buttonStackLayoutConstraint: NSLayoutConstraint!
    
    var countLogin: Int = 0
    var countSignIn: Int = 0
    var desiredHeight: CGFloat = 400
    var error = ""
    var email: String = ""
    var password: String = ""
    var signUpPressed: Bool = false
    var auth = UserAuthentication()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        stileUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        logInStackView.isHidden = true
        signInStackview.isHidden = true
    }
    
    func stileUI() {
        welcomeLbl.text = "Surprise me"
        startBtn.layer.cornerRadius = 20
        startBtn.setTitle("Sign Up", for: [])
        logInBtn.layer.cornerRadius = 20
        logInBtn.setTitle("Log In", for: [])
        navigationItem.backButtonTitle = ""
        logInStackView.isHidden = true
        signInStackview.isHidden = true
        
        //Textfields styles
        logInEmail.placeholder = "example@example.com"
        logInPassword.placeholder = "Password"
        logInPassword.isSecureTextEntry = true
        signInEmail.placeholder = "example@example.com"
        signInPassword.placeholder = "Password"
        signInPassword.isSecureTextEntry = true
        
    }

    @IBAction func logInPressed(_ sender: Any) {
        countLogin += 1
        logInStackView.isHidden = false
        if !checkFields() && countLogin > 1 {
            let alert = Utils().showPopup(title: K.warning, message: error)
            present(alert, animated: true)
        } else {
            if countLogin == 1 {
                logInStackView.isHidden = false
            } else {
                auth.userAuthLogin(email: email, password: password) { success, error  in
                    if error != nil {
                        let alert = Utils().showPopup(title: K.warning, message: error?.localizedDescription ?? "There was an error")
                        self.present(alert, animated: true)
                    } else if success {
                        self.logInEmail.text = ""
                        self.logInPassword.text = ""
                        self.countLogin = 0
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "choose") as! ChooseViewController
                        let navVC = UINavigationController(rootViewController: vc)
                        navVC.modalPresentationStyle = .fullScreen
                        self.present(navVC, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Segue.entersSegue {
            if let destVC = segue.destination as? ChooseViewController {
                let navVC = UINavigationController(rootViewController: destVC)
                navVC.modalPresentationStyle = .fullScreen
                present(navVC, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        countSignIn += 1
        signUpPressed = true
        if !checkFields() && countSignIn > 1 {
            let alert = Utils().showPopup(title: K.warning, message: error)
            present(alert, animated: true)
        } else {
            if countSignIn == 1 {
                signInStackview.isHidden = false
            } else if checkFields() {
                auth.userAuthCreate(email: email, password: password) { success, error in
                    if error != nil {
                        let alert = Utils().showPopup(title: K.warning, message: error?.localizedDescription ?? "There was an error")
                        self.present(alert, animated: true)
                    } else if success {
                        self.signInEmail.text = ""
                        self.signInPassword.text = ""
                        self.countSignIn = 0
                        self.performSegue(withIdentifier: K.Segue.entersSegue, sender: nil)
                    }
                }
            }
        }
    }
    
    func checkFields() -> Bool {
        if signUpPressed {
            if signInEmail.text != "" || signInPassword.text != "" || signInEmail.text != "" || signInPassword.text != "" && countSignIn > 1 {
                email = signInEmail.text!
                password = signInPassword.text!
                error = ""
            }
            if signInEmail.text == nil || signInEmail.text == "" && countSignIn > 1 {
                error += "Please provide an email\n"
            }
            if signInPassword.text == nil || signInPassword.text == "" && countSignIn > 1 {
                error += "Please provide a password"
            }
        } else {
            if logInEmail.text != "" || logInPassword.text != "" || logInEmail.text != "" || logInPassword.text != "" && countLogin > 1 {
                email = logInEmail.text!
                password = logInPassword.text!
                error = ""
            }
            if logInEmail.text == nil || logInEmail.text == "" && countLogin > 1 {
                error += "Please provide an email\n"
            }
            if logInPassword.text == nil || logInPassword.text == "" && countLogin > 1 {
                error += "Please provide a password"
            }
        }
        
        if error != "" {
            return false
        } else {
            return true
        }
    }
}

