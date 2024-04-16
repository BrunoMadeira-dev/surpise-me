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
    @IBOutlet weak var btnCancelLogin: UIButton!
    @IBOutlet weak var btnAcceptLogin: UIButton!
    @IBOutlet weak var btnCancelSignin: UIButton!
    @IBOutlet weak var btnAcceptSignin: UIButton!
    @IBOutlet weak var accessLoginStackview: UIStackView!
    @IBOutlet weak var accessSigninStackview: UIStackView!
    
    var countLogin: Int = 0
    var countSignIn: Int = 0
    var desiredHeight: CGFloat = 400
    var error = ""
    var email: String = ""
    var password: String = ""
    var signUpPressed: Bool = false
    var logInPressed: Bool = false
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
        accessLoginStackview.isHidden = true
        accessSigninStackview.isHidden = true
    }
    
    func stileUI() {
        welcomeLbl.text = "Surprise me"
        navigationItem.backButtonTitle = ""
        logInStackView.isHidden = true
        signInStackview.isHidden = true
        
        //Buttons style
        startBtn.layer.cornerRadius = 20
        startBtn.setTitle("Sign Up", for: [])
        logInBtn.layer.cornerRadius = 20
        logInBtn.setTitle("Log In", for: [])
        btnAcceptLogin.setTitle("Log In", for: [])
        btnCancelLogin.setTitle("Cancel", for: [])
        btnAcceptSignin.setTitle("Sign In", for: [])
        btnCancelSignin.setTitle("Cancel", for: [])
        
        //Textfields styles
        logInEmail.placeholder = "example@example.com"
        logInPassword.placeholder = "Password"
        logInPassword.isSecureTextEntry = true
        signInEmail.placeholder = "example@example.com"
        signInPassword.placeholder = "Password"
        signInPassword.isSecureTextEntry = true
        
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

    @IBAction func logInPressed(_ sender: Any) {
        //Quando pressiono este botão mostra os campos e os botões de acesso. Enquanto não pressiono não faz nada e esconde tudo o resto
        if !signUpPressed {
            UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.8) {
                self.logInStackView.isHidden = false
                self.logInPressed = true
                self.logInBtn.isUserInteractionEnabled = false
                self.logInPressed = true
                self.accessLoginStackview.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.accessSigninStackview.isHidden = true
                self.signInStackview.isHidden = true
            }
            UIView.animate(withDuration: 0.4, delay: -0.4, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.8) {
                self.logInStackView.isHidden = false
                self.accessLoginStackview.isHidden = false
                self.accessSigninStackview.layoutIfNeeded()
                self.signInStackview.layoutIfNeeded()
            } completion: { _ in
                self.logInPressed = true
                self.signUpPressed = false
                self.startBtn.isUserInteractionEnabled = true
            }
        }
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        if !logInPressed {
            UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.8) {
                self.signInStackview.isHidden = false
                self.accessSigninStackview.isHidden = false
                self.signUpPressed = true
                self.startBtn.isUserInteractionEnabled = false
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.accessLoginStackview.isHidden = true
                self.logInStackView.isHidden = true
            }
            UIView.animate(withDuration: 0.4, delay: -0.4, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.8) {
                self.signInStackview.isHidden = false
                self.accessSigninStackview.isHidden = false
                self.accessLoginStackview.layoutIfNeeded()
                self.logInStackView.layoutIfNeeded()
            } completion: { _ in
                self.logInPressed = false
                self.signUpPressed = true
                self.logInBtn.isUserInteractionEnabled = true
                
            }
        }
    }
  
    //MARK: Procceed Login
    @IBAction func cancelLoginPressed(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            self.accessLoginStackview.isHidden = true
            self.logInStackView.isHidden = true
        }
        UIView.animate(withDuration: 0.4, delay: -0.4, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.8) {
            self.accessLoginStackview.layoutIfNeeded()
            self.logInStackView.layoutIfNeeded()
        } completion: { _ in
            self.logInPressed = false
            self.logInBtn.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func acceptLoginPressed(_ sender: Any) {
        let error = checkFields()
        if error != "" {
            let alert = Utils().showPopup(title: K.warning, message: error)
            present(alert, animated: true)
        } else {
            auth.userAuthLogin(email: email, password: password) { success, error  in
                if error != nil {
                    let alert = Utils().showPopup(title: K.warning, message: error?.localizedDescription ?? "There was an error")
                    self.present(alert, animated: true)
                } else if success {
                    self.logInEmail.text = ""
                    self.logInPassword.text = ""
                    self.countLogin = 0
                    self.logInBtn.isUserInteractionEnabled = true
                    self.performSegue(withIdentifier: K.Segue.entersSegue, sender: nil)
                }
            }
        }
    }
    
    //MARK: Procceed Signin
    
    @IBAction func cancelSigninPressed(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            self.signInStackview.isHidden = true
            self.accessSigninStackview.isHidden = true
        }
        UIView.animate(withDuration: 0.4, delay: -0.4, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.8) {
            self.accessSigninStackview.layoutIfNeeded()
            self.signInStackview.layoutIfNeeded()
        } completion: { _ in
            self.signUpPressed = false
            self.startBtn.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func acceptSigninPressed(_ sender: Any) {
        let error = checkFields()
        if error != "" {
            let alert = Utils().showPopup(title: K.warning, message: error)
            present(alert, animated: true)
        } else {
            auth.userAuthCreate(email: email, password: password) { success, error in
                if error != nil {
                    let alert = Utils().showPopup(title: K.warning, message: error?.localizedDescription ?? "There was an error")
                    self.present(alert, animated: true)
                } else if success {
                    self.signInEmail.text = ""
                    self.signInPassword.text = ""
                    self.countSignIn = 0
                    self.startBtn.isUserInteractionEnabled = true
                    self.performSegue(withIdentifier: K.Segue.entersSegue, sender: nil)
                }
            }
        }
    }
    
    func checkFields() -> String {
        if signUpPressed {
            if signInEmail.text != "" || signInPassword.text != "" || signInEmail.text != "" || signInPassword.text != "" {
                email = signInEmail.text!
                password = signInPassword.text!
                error = ""
            }
            if signInEmail.text == nil || signInEmail.text == "" {
                error += "Please provide an email\n"
            }
            if signInPassword.text == nil || signInPassword.text == "" {
                error += "Please provide a password"
            }
        } else {
            if logInEmail.text != "" || logInPassword.text != "" || logInEmail.text != "" || logInPassword.text != "" {
                email = logInEmail.text!
                password = logInPassword.text!
                error = ""
            }
            if logInEmail.text == nil || logInEmail.text == "" {
                error += "Please provide an email\n"
            }
            if logInPassword.text == nil || logInPassword.text == "" {
                error += "Please provide a password"
            }
        }
        
        return error
    }
}

