//
//  NetworkService.swift
//  fetch-rewards-coding-challenge
//
//  Created by Jose Garcia on 5/31/22.
//

import Foundation

enum Result<Success, Failure: Error> {
    case success(Success)
    case failure(Failure)
}

enum MealError: String, Error {
    case invalid = "Invalid"
    case invalidData = "Invalid Data"
    case invalidResponse = "Invalid Response"
    case unableToCompleteRequest = "Unable to complete request."
    case unableToDecode = "Unable to decode."
}

class NetworkService {
    
    func fetchMealCategory(with url: String, completion: @escaping (Result<MealCategoryResponse, MealError>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.invalid))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error)  in
                 
            
            if let _ = error {
                completion(.failure(.unableToCompleteRequest))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let meals = try decoder.decode(MealCategoryResponse.self, from: data)
                completion(.success(meals))
                
            } catch {
                
            }
        }
        
        task.resume()
    }
    
    func fetchMealDescription(with url: String, completion: @escaping (Result<MealDetailsResponse, MealError>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.invalid))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error)  in
                 
            
            if let _ = error {
                completion(.failure(.unableToCompleteRequest))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let meals = try decoder.decode(MealDetailsResponse.self, from: data)
                print(meals)
                completion(.success(meals))
                
            } catch {
                completion(.failure(.unableToDecode))
            }
        }
        
        task.resume()
    }
}
