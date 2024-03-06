//
//  Constants.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 01/03/2024.
//

import Foundation


struct K {
    struct Segue {
        static let moviSegue = "MovieSegue"
        static let foodSegue = "FoodSegue"
    }
    
    static var foodRandomURL = "https://www.themealdb.com/api/json/v1/1/random.php?" //Random search
    static var foodSearchURL = "https://www.themealdb.com/api/json/v1/1/search.php?"
    static var foodCategoryURL = "https://www.themealdb.com/api/json/v1/1/filter.php?"// c=Seafood --> for category Search
    
    struct Identifiers {
        static let mealIdentifier = "ReusableFoodCell"
        static let categoryIdentifier = "ReusableFoodListCell"
    }
}
