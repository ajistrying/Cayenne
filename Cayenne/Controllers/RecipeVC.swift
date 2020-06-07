//
//  RecipeVC.swift
//  Cayenne
//
//  Created by Wellington Johnson on 5/31/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import UIKit
import SwiftUI

class RecipeVC: UIViewController {
    
    var recipeID: Int?
    let recipeNetworkManager = RecipeNetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        
        if let recipeID = recipeID {
            getRecipe(for: recipeID)
        }
        
    }
    
    
    func configureViewController(){
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func getRecipe(for recipeID: Int){
        recipeNetworkManager.fetchRecipe(for: recipeID) { result in
            
            switch result {
            case .success(let results):
                print(results)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

