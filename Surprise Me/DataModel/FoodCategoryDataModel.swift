//
//  FoodCategoryDataModel.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 06/03/2024.
//

import Foundation


class MealsCategoryDataModel: Codable {
    
    var meals: [MealsDetailCategoryDataModel]
}

class MealsDetailCategoryDataModel: Codable {
    

    var strMeal: String?
    var strMealThumb: String?
    var idMeal: String?
    
}
