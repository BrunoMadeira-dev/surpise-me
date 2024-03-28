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
        //foodImageList.layer.cornerRadius = 7
        
        foodImageList.layer.shadowColor = UIColor.black.cgColor
        foodImageList.layer.shadowOffset = CGSize(width: 2, height: 5)
        foodImageList.layer.shadowOpacity = 1.5
        foodImageList.layer.shadowRadius = 10
        
        foodImageList.layer.masksToBounds = false
        foodImageList.layer.cornerRadius = 7
        
        //foodImageList.clipsToBounds = true
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            // Configure the view for the selected state
        }
    
}
