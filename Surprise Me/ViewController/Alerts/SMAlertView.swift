//
//  SMAlertView.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 29/05/2024.
//

import Foundation
import UIKit
import CFAlertViewController

class SMAlertView: UIViewController {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var smImageView: UIImageView!
    @IBOutlet weak var smTitleLbl: UILabel!
    @IBOutlet weak var smMessageLbl: UILabel!
    @IBOutlet weak var smOkBtn: UIButton!
    @IBOutlet weak var viewContainer: UIView!
    
    var titleText: String!
    var message: String!
    
    var okHandler: (() -> Void)?
    
    // Init para quando carregado via storyboard ou XIB
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(title: String!, message: String!, okHanlde: @escaping () -> ()) {
        super.init(nibName: "SMAlertView", bundle: nil)
        self.smTitleLbl.text = title
        self.smMessageLbl.text = message
        self.okHandler = okHanlde
        
        modalPresentationStyle = .overCurrentContext
        view?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        loadViewIfNeeded()
    }
    
    init(title: String!, message: String!) {
        super.init(nibName: "SMAlertView", bundle: nil)
        self.smTitleLbl.text = title
        self.smMessageLbl.text = message
        
        modalPresentationStyle = .overCurrentContext
        view?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        loadViewIfNeeded()
    }
    
//    private func setupView() {
//        //loadXib()
//        smOkBtn.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)
//    }
//      
    override func viewDidLoad() {
        styleUI()
        fillUI()
    }
    
    func styleUI() {
        containerView.layer.cornerRadius = 4
        
        smTitleLbl.textColor = .label
        smMessageLbl.textColor = .label
        
        smTitleLbl.sizeToFit()
        smMessageLbl.sizeToFit()
    }
    func fillUI() {
        smTitleLbl.text = self.titleText
        smMessageLbl.text = self.message
        smOkBtn.setTitle("Ok", for: [])
    }
    func configure(title: String, message: String, okHandler: @escaping () -> Void) {
        smTitleLbl.text = title
        smMessageLbl.text = message
        self.okHandler = okHandler
    }
    
    func addOkButtonAction(handleOK: @escaping () -> ()) {
        self.okHandler = handleOK
    }
    
    @IBAction func actionOK(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
        if let callBack = self.okHandler {
            callBack()
        }
    }
    
}
