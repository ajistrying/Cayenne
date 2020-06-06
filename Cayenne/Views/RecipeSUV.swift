//
//  RecipeSUV.swift
//  Cayenne
//
//  Created by Wellington Johnson on 5/31/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import SwiftUI

struct RecipeSUV: View {
    let recipeID: Int?
    @ObservedObject var recipeNetworkManager = RecipeNetworkManager()
    
    var body: some View {
        HStack{
            Text(recipeNetworkManager.recipe.title!)
        }
        .onAppear{
            self.recipeNetworkManager.fetchRecipe(for: self.recipeID!) { result in
                
                switch result {
                case .success(_):
                    print(self.recipeNetworkManager.recipe.title!)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
}

struct RecipeSUV_Previews: PreviewProvider {
    static var previews: some View {
        RecipeSUV(recipeID: 0)
    }
}
