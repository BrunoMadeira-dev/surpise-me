//
//  FoodCell.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 04/03/2024.
//

import Foundation
import UIKit

class FoodCell: UITableViewCell {
    
    @IBOutlet weak var foodTitleLbl: UILabel!
    @IBOutlet weak var foodCategoryLbl: UILabel!
    @IBOutlet weak var foodCountryLbl: UILabel!
    @IBOutlet weak var foodInstructsLbl: UILabel!
    @IBOutlet weak var moreRecipesBtn: UIButton!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var allView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        let cornerRadius: CGFloat = 10
//        let maskPath = UIBezierPath(roundedRect: foodImage.bounds,
//                                    byRoundingCorners: [.allCorners],
//                                    cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
//        let maskLayer = CAShapeLayer()
//        maskLayer.frame = foodImage.bounds
//        maskLayer.path = maskPath.cgPath
//        foodImage.layer.mask = maskLayer
        
        foodTitleLbl.textColor = .label
        foodCategoryLbl.textColor = .label
        foodCountryLbl.textColor = .label
        foodInstructsLbl.textColor = .label
        allView.backgroundColor = .systemBackground
        
        view.layer.cornerRadius = 10
        view.layer.shadowOffset = CGSize(width: 2, height: 5)
        view.layer.shadowOpacity = 0.7
        view.layer.shadowRadius = 5
        foodImage.layer.masksToBounds = true
        foodImage.layer.cornerRadius = 7
        
        moreRecipesBtn.isHidden = true
    }
}
