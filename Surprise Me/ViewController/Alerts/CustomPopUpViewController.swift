//
//  CustomPopUpViewController.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 06/06/2024.
//

import UIKit


class CustomPopUpViewController: UIViewController {
    
    static let controllerIdentifier = String(describing: CustomPopUpViewController.self)
    
    @IBOutlet weak var blurBackground: UIView!
    @IBOutlet weak var popUpTitleLbl: UILabel!
    @IBOutlet weak var popUpMsgLbl: UILabel!
    @IBOutlet weak var alertContainerView: UIView!
    @IBOutlet weak var alertImage: UIImageView!
    @IBOutlet weak var btnOK: UIButton!
    
    var errorTitle: String!
    var errorMessage: String!
    
    var okHandle: (() -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.popUpTitleLbl.text = errorTitle
        self.popUpMsgLbl.text = errorMessage

        styleUI()
        fillUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        blurBackground.layer.opacity = 0.6
        
        fillUI()
    }
    
    init(title: String, message: String) {
        super.init(nibName: CustomPopUpViewController.controllerIdentifier, bundle: Bundle(for: CustomPopUpViewController.self))
        
        self.errorTitle = title
        self.errorMessage = message
        
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
    }
    
    init(title: String, message: String, okHandler: @escaping () -> ()) {
        super.init(nibName: CustomPopUpViewController.controllerIdentifier, bundle: Bundle(for: CustomPopUpViewController.self))
        
        self.errorTitle = title
        self.errorMessage = message
        
        self.okHandle = okHandler
        
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
    }
    
    func styleUI() {
        
        alertContainerView.layer.borderWidth = 1.0
        alertContainerView.layer.borderColor = UIColor.black.cgColor
        alertContainerView.layer.cornerRadius = 12
        alertContainerView.layer.shadowOffset = CGSize(width: 2, height: 5)
        alertContainerView.layer.shadowOpacity = 0.7
        alertContainerView.layer.shadowRadius = 5
        alertContainerView.clipsToBounds = true
        
        blurBackground.layer.opacity = 0.3
        
        btnOK.setTitle("Ok", for: [])
        btnOK.tintColor = .label
        btnOK.backgroundColor = UIColor(named: "lightBlueColor")
        btnOK.layer.cornerRadius = 12
        
        alertImage.image = UIImage(named: K.Symbols.attentionSymbol)
        alertImage.tintColor = .label
    }
    
    
    func fillUI() {
        
        popUpTitleLbl.text = self.errorTitle
        popUpMsgLbl.text = self.errorMessage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
        if let callBack = self.okHandle {
            callBack()
        }
    }
    
}
