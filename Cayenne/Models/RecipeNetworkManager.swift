//
//  RecipeNetworkManager.swift
//  Cayenne
//
//  Created by Wellington Johnson on 5/30/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import UIKit


class RecipeNetworkManager {
    
    let keys = Keys()
    
    //Function to fetch the specific recipe given the id
    func fetchRecipe(for recipeID: Int, closure: @escaping(Result<SpecificRecipe,ErrorMessage>) -> Void){
        let baseURL = "https://api.spoonacular.com/recipes/\(recipeID)/information?apiKey=\(keys.spoonAPIKey)"
        
        guard let url = URL(string: baseURL) else {
            closure(.failure(.invalidRequest))
            return
        }
        
        let recipeRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: recipeRequest) { (data, response, error) in
        
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
                    let recipe = try JSONDecoder().decode(SpecificRecipe.self, from: data)
                    closure(.success(recipe))
                } catch {
                    closure(.failure(.couldNotRetrieveData))
                }
                
        }
        
        task.resume()
    }
    
}


