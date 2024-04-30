//
//  Constants.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 01/03/2024.
//

import Foundation


struct K {
    
    static let warning = "Warning"
    static let category = "Category"
    static let search = "Search"
    static let recipeCat = "Recipe Category"
    static let titleFoodView = "Foodie"
    static let foodBtnTitle = "Ingredients and measures"
    static let searchPlaceholder = "Recipe Name"
    static let mainTitle = "Recipe Randomizer"
    
    static var foodRandomURL = "https://www.themealdb.com/api/json/v1/1/random.php?" //Random search
    static var foodSearchURL = "https://www.themealdb.com/api/json/v1/1/search.php?s=" //uses a name
    static var foodCategoryURL = "https://www.themealdb.com/api/json/v1/1/filter.php?c="// c=Seafood --> for category Search
    static var foodByIdURL = "https://www.themealdb.com/api/json/v1/1/lookup.php?i="
    
    struct phrases {
        static var notEmpty = "Category can't be empty"
    }
    
    struct Segue {
        static let moviSegue = "MovieSegue"
        static let foodSegue = "FoodSegue"
        static let ingridientSegue = "IngredientSegue"
        static let registerSegue = "RegisterUserSegue"
        static let foodListSegue = "FoodListSegue"
        static let entersSegue = "enterSegue"
    }
    
    struct Identifiers {
        static let ingridientIdentifier = "ReusableIngredientsCell"
        static let ingredientCell = "IngredientsCell"
        
        static let ingredienViewController = "IngredientsViewController"
        static let mealIdentifier = "ReusableFoodCell"
        static let categoryIdentifier = "ReusableFoodListCell"
        static let foodViewController = "FoodViewController"
        static let foodListCell = "FoodListCell"
        //static let ingridentsViewController = "ingredientsViewController"
        static let ingridients = "Ingredients"
        static let customFoodCell = "FooCell"
    }
}
