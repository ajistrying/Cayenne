//
//  RecipeCollectionViewCell.swift
//  Cayenne
//
//  Created by Wellington Johnson on 6/26/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    //cell identifier
    static let reuseID = "RecipeCollectionViewCell"
    
    let recipeTitleLabel = UILabel()
    let cookTimeLabel = UILabel()
    let servingSizeLabel = UILabel()
    let getThatRecipeButton = UIButton()
    
    var recipeID = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper Functions
        
        func minutesToHours(minutes: Int) -> (Int,Int) {
            return(minutes/60,minutes%60)
        }
        
        
        //Set the cell
        func set(recipe: Recipe) {
            recipeTitleLabel.text = recipe.title.capitalized
            
            let (hours, minutes) = minutesToHours(minutes: recipe.readyInMinutes)
            
            if hours == 0 && minutes > 0 {
                cookTimeLabel.text = "Cook Time: \(String(minutes))m"
            } else if hours > 0 && minutes > 0 {
                cookTimeLabel.text = "Cook Time: \(String(hours))hr \(String(minutes))m"
            } else if hours > 0 && minutes == 0 {
                cookTimeLabel.text = "Cook Time: \(String(hours))hr"
            }
            servingSizeLabel.text = "Serving Size: \(String(recipe.servings))"
            recipeID = recipe.id
        }
        
        
    // MARK: - Configuring cell UI
    
    func configure(){
        configureRecipeTitleLabel()
        configureCookTimeLabel()
        configureServingSizeLabel()
    }
        
        // Configure the recipe title label
        func configureRecipeTitleLabel() {
            addSubview(recipeTitleLabel)
            recipeTitleLabel.numberOfLines = 2
            recipeTitleLabel.font = UIFont(name: "Gill Sans", size: 20)
            //recipeTitleLabel.adjustsFontSizeToFitWidth                                                  = true
            recipeTitleLabel.translatesAutoresizingMaskIntoConstraints                                  = false
            
            NSLayoutConstraint.activate([
                recipeTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                recipeTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                recipeTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                recipeTitleLabel.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
        
    
        // Configure the cook time title label
        func configureCookTimeLabel() {
            addSubview(cookTimeLabel)
            cookTimeLabel.translatesAutoresizingMaskIntoConstraints                                                     = false
            cookTimeLabel.font = UIFont(name: "Gill Sans", size: 18)
            
            NSLayoutConstraint.activate([
                cookTimeLabel.topAnchor.constraint(equalTo: recipeTitleLabel.topAnchor, constant: 40),
                cookTimeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                cookTimeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                cookTimeLabel.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
        
    
        //Configure the serving size title label
        func configureServingSizeLabel() {
            addSubview(servingSizeLabel)
            servingSizeLabel.translatesAutoresizingMaskIntoConstraints                                                 = false
            servingSizeLabel.font = UIFont(name: "Gill Sans", size: 18)
            
            NSLayoutConstraint.activate([
                servingSizeLabel.topAnchor.constraint(equalTo: cookTimeLabel.topAnchor, constant: 30),
                servingSizeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                servingSizeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                servingSizeLabel.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    
}
