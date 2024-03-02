//
//  FoodDataManager.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 02/03/2024.
//

import Foundation

class FoodDataManager{
    let networCall = NetworkingCall()
    
    func fetchRandomFood(url: String, onComplete: @escaping (MealDataModel?, Error?) -> ()) {
        networCall.responseCall(url: url, responseType: MealDataModel.self) { responseObject, error in
            var dataModel : MealDataModel?
            
            if let error = error {
                print(error)
            } else {
                dataModel = responseObject
            }
            onComplete(dataModel!, error)
        }
    }
}
