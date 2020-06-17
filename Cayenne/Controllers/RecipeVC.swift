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
    
    let recipeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 300))
    let recipeScrollView = UIScrollView()
    let recipeStackView = UIStackView()
    let recipeContentView = UIView()
    
    var titleLabel: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "UIStackView inside UIScrollView."
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureRecipePicture()
        configureRecipeScrollView()
        configureRecipeContentView()
        configureRecipeStackView()
        for _ in 0..<15 {
            recipeStackView.addArrangedSubview(titleLabel)
        }
    }
    
    func configureViewController(){
        view.backgroundColor = .systemBackground
        navigationController?.hidesBarsOnSwipe = true
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
        recipeImageView.layer.cornerRadius = 40
        recipeImageView.clipsToBounds = true
        
        recipeImageView.image = UIImage(named: "DefaultRecipePicture")!
        
        
        NSLayoutConstraint.activate([
            recipeImageView.widthAnchor.constraint(equalToConstant: 300),
            recipeImageView.heightAnchor.constraint(equalToConstant: 200),
            recipeImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            recipeImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    
    func configureRecipeScrollView() {
        view.addSubview(recipeScrollView)
        recipeScrollView.translatesAutoresizingMaskIntoConstraints = false
        recipeScrollView.backgroundColor = .red
        
        NSLayoutConstraint.activate([
            recipeScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            recipeScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            recipeScrollView.topAnchor.constraint(equalTo: recipeImageView.bottomAnchor,constant: 10),
            recipeScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
    func configureRecipeContentView(){
        recipeScrollView.addSubview(recipeContentView)
        recipeContentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            recipeContentView.topAnchor.constraint(equalTo: recipeScrollView.topAnchor),
            recipeContentView.leadingAnchor.constraint(equalTo: recipeScrollView.leadingAnchor),
            recipeContentView.bottomAnchor.constraint(equalTo: recipeScrollView.bottomAnchor),
            recipeContentView.trailingAnchor.constraint(equalTo: recipeScrollView.trailingAnchor),
            
            recipeContentView.widthAnchor.constraint(equalTo: recipeScrollView.widthAnchor)
        ])
    }
    
    func configureRecipeStackView() {
        recipeContentView.addSubview(recipeStackView)
        recipeStackView.translatesAutoresizingMaskIntoConstraints = false
        recipeStackView.axis = .vertical
        recipeStackView.distribution = .equalSpacing
        recipeStackView.spacing = 20
        
        
        
        NSLayoutConstraint.activate([
            recipeStackView.topAnchor.constraint(equalTo: recipeScrollView.topAnchor,constant: 10),
            recipeStackView.leadingAnchor.constraint(equalTo: recipeScrollView.leadingAnchor, constant: 10),
            recipeStackView.trailingAnchor.constraint(equalTo: recipeScrollView.trailingAnchor, constant: -10),
            recipeStackView.bottomAnchor.constraint(equalTo: recipeScrollView.bottomAnchor,constant: -10)
        ])
        
    }
    
    
}
