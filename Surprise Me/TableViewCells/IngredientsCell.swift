//
//  IngredientsCell.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 29/04/2024.
//

import Foundation
import UIKit


class IngredientsCell: UITableViewCell {
    
    @IBOutlet weak var ingridientLbl: UILabel!
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var checkImage: UIImageView!
    
    var wasSelected: Bool = false
    
    override class func awakeFromNib() {
        super.awakeFromNib()

    }
}
