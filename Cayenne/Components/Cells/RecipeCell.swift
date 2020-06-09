//
//  RecipeCell.swift
//  Cayenne
//
//  Created by Wellington Johnson on 5/23/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    //Set cell identifier
    static let reuseID = "RecipeCell"
    
    // Create UI items to place into the cell
    let recipeTitleLabel = UILabel()
    let cookTimeLabel = UILabel()
    let servingSizeLabel = UILabel()
    let getThatRecipeButton = UIButton()
    let recipeResultsVC = RecipeResultsVC()
    var recipeID = 0
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureRecipeTitleLabel()
        configureCookTimeLabel()
        configureServingSizeLabel()
        configureGetThatRecipeButton()
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
    
    // Configure the recipe title label
    func configureRecipeTitleLabel() {
        addSubview(recipeTitleLabel)
        recipeTitleLabel.numberOfLines = 0
        recipeTitleLabel.font = UIFont(name: "Gill Sans", size: 20)
        recipeTitleLabel.adjustsFontSizeToFitWidth                                                  = true
        recipeTitleLabel.translatesAutoresizingMaskIntoConstraints                                  = false
        
        recipeTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                  = true
        recipeTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive    = true
        recipeTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive                      = true
        recipeTitleLabel.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
    }
    
    // Configure the cook time title label
    func configureCookTimeLabel() {
        addSubview(cookTimeLabel)
        cookTimeLabel.translatesAutoresizingMaskIntoConstraints                                                     = false
        cookTimeLabel.font = UIFont(name: "Gill Sans", size: 18)
        
        cookTimeLabel.leadingAnchor.constraint(equalTo: recipeTitleLabel.trailingAnchor, constant: 10).isActive     = true
        cookTimeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive                    = true
        cookTimeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive                               = true
        
    }
    
    //Configure the serving size title label
    func configureServingSizeLabel() {
        addSubview(servingSizeLabel)
        servingSizeLabel.translatesAutoresizingMaskIntoConstraints                                                 = false
        servingSizeLabel.font = UIFont(name: "Gill Sans", size: 18)
        
        servingSizeLabel.leadingAnchor.constraint(equalTo: recipeTitleLabel.trailingAnchor, constant: 10).isActive = true
        servingSizeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive                = true
        servingSizeLabel.topAnchor.constraint(equalTo: cookTimeLabel.bottomAnchor, constant: 20).isActive          = true
    }
    
    //Configure the button to get the recipe
    func configureGetThatRecipeButton() {
        addSubview(getThatRecipeButton)
        getThatRecipeButton.translatesAutoresizingMaskIntoConstraints                                  = false
        getThatRecipeButton.setBackgroundImage(UIImage(systemName: "chevron.right"), for: .normal)
        getThatRecipeButton.tintColor = .black
        
        getThatRecipeButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                  = true
        getThatRecipeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        getThatRecipeButton.widthAnchor.constraint(equalToConstant: 30).isActive                       = true
        getThatRecipeButton.heightAnchor.constraint(equalToConstant: 30).isActive                      = true
    }
    
}
