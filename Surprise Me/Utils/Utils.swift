//
//  Utils.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 12/03/2024.
//

import Foundation
import UIKit
import MBProgressHUD
import SCLAlertView

class Utils {
    
    static let shared = Utils()
    
    static func getTopViewController() -> UIViewController? {
            var topViewController: UIViewController?
            if let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first {
                topViewController = window.rootViewController
                while let presentedViewController = topViewController?.presentedViewController {
                    topViewController = presentedViewController
                }
            }
            return topViewController
        }
    
//    func showPopup(title: String, message: String) -> UIAlertController {
//        
//        let warning: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        warning.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
//        return warning
//    }
    
    func showProgressPopUp(view: UIView) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = "Please wait"
    }
    
    func hideProgressPopUp(view: UIView) {
        MBProgressHUD.hide(for: view, animated: true)
    }
    
    func showPopUp(title: String, message: String) {
        let alert = SCLAlertView()
            
        alert.showCustom(title, subTitle: message, color: UIColor(named: "lightBlueColor")!, icon: UIImage(named: K.Symbols.attentionSymbol)!, closeButtonTitle: "OK")
    }
    
    func showPopUpWithHandler(title: String, message: String, okHandle: @escaping () -> ()) {
        let alert = SCLAlertView()
            
        alert.showCustom(title, subTitle: message, color: UIColor(named: "lightBlueColor")!, icon: UIImage(named: K.Symbols.attentionSymbol)!, closeButtonTitle: "OK").setDismissBlock {
            
            okHandle()
        }
    }
    
    func showCustomPopUpWithHandler(title: String, message: String, handle: @escaping () -> ()) {
        
        let alert: CustomPopUpViewController = CustomPopUpViewController(title: title, message: message) {
            handle()
        }
        
        Utils.getTopViewController()?.present(alert, animated: true, completion: nil)
    }
    
    func showCustomPopUp(title: String, message: String) {
        
        let alert: CustomPopUpViewController = CustomPopUpViewController(title: title, message: message)
        
        Utils.getTopViewController()?.present(alert, animated: true, completion: nil)
    }

}
