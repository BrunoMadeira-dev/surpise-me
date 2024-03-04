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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        foodTitleLbl.textColor = UIColor.white
        foodCategoryLbl.textColor = UIColor.white
        foodCountryLbl.textColor = UIColor.white
        foodInstructsLbl.textColor = UIColor.white
        moreRecipesBtn.isHidden = true
    }
}
