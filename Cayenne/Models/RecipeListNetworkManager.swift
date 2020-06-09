//
//  NetworkManager.swift
//  Cayenne
//
//  Created by Wellington Johnson on 5/18/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import Foundation


class RecipeListNetworkManager {
    
    let betterBaseURL = "https://api.spoonacular.com/recipes/search"
    let keys = Keys()
    
    func getRecipeList(for ingredient: String,diet: String, closure: @escaping(Result<Recipes,ErrorMessage>) -> Void){
        
        // Build the URL Request with URLRequest
        var endpoint = ""
        let numberOfResults: Int = 10
        
        switch diet {
        case "":
            endpoint = betterBaseURL + "?query=\(ingredient)&number=\(numberOfResults)&apiKey=\(keys.spoonAPIKey)"
        case "None":
            endpoint = betterBaseURL + "?query=\(ingredient)&number=\(numberOfResults)&apiKey=\(keys.spoonAPIKey)"
        case "Lacto-Vegetarian":
            endpoint = betterBaseURL + "?query=\(ingredient)&diet=Lacto-Vegetarian&number=\(numberOfResults)&apiKey=\(keys.spoonAPIKey)"
        case "Ovo-Vegetarian":
            endpoint = betterBaseURL + "?query=\(ingredient)&diet=Ovo-Vegetarian&number=\(numberOfResults)&apiKey=\(keys.spoonAPIKey)"
        case "Vegan":
            endpoint = betterBaseURL + "?query=\(ingredient)&diet=Vegan&number=\(numberOfResults)&apiKey=\(keys.spoonAPIKey)"
        case "Vegetarian":
            endpoint = betterBaseURL + "?query=\(ingredient)&diet=Vegetarian&number=\(numberOfResults)&apiKey=\(keys.spoonAPIKey)"
        case "Gluten Free":
            endpoint = betterBaseURL + "?query=\(ingredient)&diet=Gluten-Free&number=\(numberOfResults)&apiKey=\(keys.spoonAPIKey)"
        case "Ketogenic":
            endpoint = betterBaseURL + "?query=\(ingredient)&diet=Ketogenic&number=\(numberOfResults)&apiKey=\(keys.spoonAPIKey)"
        case "Paleo":
            endpoint = betterBaseURL + "?query=\(ingredient)&diet=Paleo&number=\(numberOfResults)&apiKey=\(keys.spoonAPIKey)"
        case "Whole 30":
            endpoint = betterBaseURL + "?query=\(ingredient)&diet=Whole-30&number=\(numberOfResults)&apiKey=\(keys.spoonAPIKey)"
        default:
            endpoint = betterBaseURL + "?query=\(ingredient)&number=\(numberOfResults)&apikey=\(keys.spoonAPIKey)"
        }
        
        
        guard let url = URL(string: endpoint) else {
            closure(.failure(.invalidRequest))
            return
        }
        print(url)
        
        
        // Run the URLRequest with URLSession
        let ingredientRequest = URLRequest(url: url)
        print(ingredientRequest)
    
        
        let task = URLSession.shared.dataTask(with: ingredientRequest) { (data, response, error) in
            
                //Handle error
                    if let _ = error {
                        closure(.failure(.invalidRequest))
                        return
                    }
                    
                    //Handle response
                    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                        closure(.failure(.invalidResponse))
                        return
                    }
                    
                    
                    // Handle data
                    guard let data = data else {
                        closure(.failure(.couldNotRetrieveData))
                        return
                    }
                
                
                    // Decode data
                    do {
                        let recipes = try JSONDecoder().decode(Recipes.self, from: data)
                        closure(.success(recipes))
                    } catch {
                        closure(.failure(.couldNotRetrieveData))
                    }
                    
            }

        task.resume()
    
    }
}


