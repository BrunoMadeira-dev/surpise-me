//
//  Utils.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 12/03/2024.
//

import Foundation
import UIKit
import MBProgressHUD

class Utils {
    
    func showPopup(title: String, message: String) -> UIAlertController {
        
        let warning: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        warning.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
        return warning
    }
    
    func showProgressPopUp(view: UIView) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = "Please wait"
    }
    
    func hideProgressPopUp(view: UIView) {
        MBProgressHUD.hide(for: view, animated: true)
    }
}
