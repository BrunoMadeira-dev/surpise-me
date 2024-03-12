//
//  Utils.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 12/03/2024.
//

import Foundation
import UIKit

class Utils {
    
    func showPopup(title: String, message: String) -> UIAlertController {
        
        let warning: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        warning.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
        return warning
    }
}
