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
    @IBOutlet weak var view: UIView!
    
    var idMeal: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        foodListLbl.isUserInteractionEnabled = true
        //foodImageList.layer.cornerRadius = 7
        
        foodImageList.layer.masksToBounds = true
        foodImageList.layer.cornerRadius = 7
        
        view.layer.cornerRadius = 10
        view.layer.shadowOffset = CGSize(width: 2, height: 5)
        view.layer.shadowOpacity = 0.7
        view.layer.shadowRadius = 5
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            // Configure the view for the selected state
        }
    
}
