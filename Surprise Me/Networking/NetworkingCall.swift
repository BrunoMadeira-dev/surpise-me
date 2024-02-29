//
//  NetworkingCall.swift
//  Surprise Me
//
//  Created by Bruno Madeira on 28/02/2024.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    
    case badResponse
    case badStatusCode(Int)
    case badData
}

class NetworkingCall {
    
    static let shared = NetworkingCall()
    private let session: URLSession
    
    init() {
        let config = URLSessionConfiguration.default
        session = URLSession(configuration: config)
    }
    
    func responseCall<T: Codable>(url: String, responseType: T.Type, completion: @escaping (T?, Error?) -> Void) {
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
    
        let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if let error = error {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    completion(nil, NetworkError.badResponse)
                }
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                DispatchQueue.main.async {
                    completion(nil, NetworkError.badStatusCode(httpResponse.statusCode))
                }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, NetworkError.badData)
                }
                return
            }
            
            do {
                let response = try JSONDecoder().decode(responseType.self, from: data)
                DispatchQueue.main.async {
                    completion(response, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
}
