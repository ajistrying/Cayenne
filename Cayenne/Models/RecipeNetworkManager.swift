//
//  RecipeNetworkManager.swift
//  Cayenne
//
//  Created by Wellington Johnson on 5/30/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import UIKit


class RecipeNetworkManager: ObservableObject {
    
    
    let headers = ["x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
                   "x-rapidapi-key": "yRidRIoQXOmsh896HpN3xh0f58lyp1g3TRujsnrvsHgBvrclVt"]
    
    @Published var recipe = SpecificRecipe()
    
    //Function to fetch the specific recipe given the id
    func fetchRecipe(for recipeID: Int, closure: @escaping(Result<SpecificRecipe,ErrorMessage>) -> Void){
        let baseURL = "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/\(recipeID)/information"
        
        guard let url = URL(string: baseURL) else {
            closure(.failure(.invalidRequest))
            return
        }
        
        var recipeRequest = URLRequest(url: url)
        recipeRequest.allHTTPHeaderFields = headers
        
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


