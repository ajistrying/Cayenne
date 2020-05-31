//
//  RecipeNetworkManager.swift
//  Cayenne
//
//  Created by Wellington Johnson on 5/30/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import UIKit


class RecipeNetworkManager: ObservableObject {
    
    @Published var recipe = SpecificRecipe()
    
    //Function to fetch the specific recipe given the id
    func fetchRecipe(for recipeID: Int){
        print(recipeID)
    }
                   
}


