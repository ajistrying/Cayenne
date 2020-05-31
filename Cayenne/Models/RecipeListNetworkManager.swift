//
//  NetworkManager.swift
//  Cayenne
//
//  Created by Wellington Johnson on 5/18/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import Foundation


class RecipeListNetworkManager {
    
    let baseURL = "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?"
    let headers = ["x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
                   "x-rapidapi-key": "yRidRIoQXOmsh896HpN3xh0f58lyp1g3TRujsnrvsHgBvrclVt"]
    
    func getRecipeList(for ingredient: String,diet: String, closure: @escaping(Result<Recipes,ErrorMessage>) -> Void){
        
        // Build the URL Request with URLRequest
        var endpoint = ""
        let numberOfResults: Int = 50
        
        switch diet {
        case "":
            endpoint = baseURL + "number=\(numberOfResults)&query=\(ingredient)"
        case "None":
            endpoint = baseURL + "number=\(numberOfResults)&query=\(ingredient)"
        case "Lacto Vegetarian":
            endpoint = baseURL + "number=\(numberOfResults)&diet=lacto%20vegetarian&query=\(ingredient)"
        case "Ovo Vegetarian":
            endpoint = baseURL + "number=\(numberOfResults)&diet=ovo%20vegetarian&query=\(ingredient)"
        default:
            endpoint = baseURL + "number=\(numberOfResults)&diet=\(diet)&query=\(ingredient)"
        }
        
        guard let url = URL(string: endpoint) else {
            closure(.failure(.invalidRequest))
            return
        }
        
        // Run the URLRequest with URLSession
        
        var ingredientRequest = URLRequest(url: url)
        ingredientRequest.allHTTPHeaderFields = headers
    
        
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


