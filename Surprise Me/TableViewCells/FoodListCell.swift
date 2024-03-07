//
//  FoodListCell.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 06/03/2024.
//

import Foundation
import UIKit

class FoodListCell: UITableViewCell {
    
    @IBOutlet weak var foodImageList: UIImageView!
    @IBOutlet weak var foodListLbl: UILabel!
    
    var idMeal: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        foodListLbl.isUserInteractionEnabled = true
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            // Configure the view for the selected state
        }
    
}
