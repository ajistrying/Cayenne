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
    var recipe: SpecificRecipe?
    let recipeNetworkManager = RecipeNetworkManager()
    let recipeImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureRecipePicture()
        
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
                self.recipe = results
            case .failure(let error):
                self.popAlertView(alertTitle: "Recipe Unavailable", alertBody: error.rawValue, alertButtonTitle: "Ok")
            }
        }
    }
    
    // MARK: - Configure UI
    func configureRecipePicture() {
        view.addSubview(recipeImageView)
        recipeImageView.translatesAutoresizingMaskIntoConstraints = false
        
        //TODO: Add in an option to get the actual picture if possible, and default to this one
        recipeImageView.image = UIImage(named: "DefaultRecipePicture")!
        
        NSLayoutConstraint.activate([
            recipeImageView.widthAnchor.constraint(equalToConstant: 200),
            recipeImageView.heightAnchor.constraint(equalToConstant: 200),
            recipeImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            recipeImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
    }
    
}
