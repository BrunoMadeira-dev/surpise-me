//
//  FoodDataManager.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 02/03/2024.
//

import Foundation
import UIKit

class FoodDataManager{
    let networCall = NetworkingCall()
    
    func fetchRandomFood(url: String, onComplete: @escaping (MealDataModel?, Error?) -> ()) {
        networCall.responseCall(url: url, responseType: MealDataModel.self) { responseObject, error in
            var dataModel: MealDataModel?
            
            if let error = error {
                print(error)
            } else {
                dataModel = responseObject
            }
            onComplete(dataModel!, error)
        }
    }
    
    func fetchImage(url: String, onComplete: @escaping (UIImage?) -> ()) {
        
        networCall.fetchImage(url: url) { data in
            if let safeData = data {
                onComplete(data)
            }
        }
    }
    
    func fetchCategory(url: String, onComplete: @escaping (MealsCategoryDataModel?, Error?) -> ()) {
        networCall.responseCall(url: url, responseType: MealsCategoryDataModel.self) { responseObject, error in
            var dataModel: MealsCategoryDataModel?
            
            if let error = error {
                print(error)
            } else {
                dataModel = responseObject
            }
            onComplete(dataModel, error)
        }
    }
}
