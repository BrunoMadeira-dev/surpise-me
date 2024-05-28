//
//  UserAuthentication.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 12/04/2024.
//

import Foundation
import UIKit
import FirebaseAuth

class UserAuthentication {
    
    func userAuthCreate(email: String, password: String, onComplete: @escaping(Bool,Error?) -> ()) {
        
        Auth.auth().createUser(withEmail: email, password: password) { response, error in
            if error != nil {
                print(error)
                onComplete(false, error)
            } else {
                onComplete(true, nil)
            }
        }
    }
    
    func userAuthLogin(email: String, password: String, onComplete: @escaping(Bool, Error?) -> ()) {
        
        Auth.auth().signIn(withEmail: email, password: password) { authResponse, error in
            if let error = error {
                print(error)
                onComplete(false, error)
            } else {
                onComplete(true, nil)
            }
        }
    }
    
    func userAuthLogOut(onComplete: @escaping(Bool, Error?) -> ()) {
        do {
            try Auth.auth().signOut()
            onComplete(true, nil)
        } catch let signOutError {
            onComplete(false, signOutError)
        }
    }
}
