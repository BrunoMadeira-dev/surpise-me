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
        
        foodTitleLbl.textColor = UIColor.black
        foodCategoryLbl.textColor = UIColor.black
        foodCountryLbl.textColor = UIColor.black
        foodInstructsLbl.textColor = UIColor.black
        
        
        foodImage.layer.shadowColor = UIColor.black.cgColor
        foodImage.layer.shadowOffset = CGSize(width: 2, height: 5)
        foodImage.layer.shadowOpacity = 1.5
        foodImage.layer.shadowRadius = 10
        foodImage.layer.shadowPath = UIBezierPath(rect: foodImage.bounds).cgPath
        foodImage.layer.shouldRasterize = false
        foodImage.layer.masksToBounds = false
        foodImage.layer.cornerRadius = 7
        
        moreRecipesBtn.isHidden = true
    }
}
