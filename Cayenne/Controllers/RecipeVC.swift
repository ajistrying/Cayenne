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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let recipeID = recipeID {
            addRecipeView(for: recipeID)
        }
    }
    
}

private extension RecipeVC {
    func addRecipeView(for id: Int) {
        //Create child controller
        let recipeView = RecipeSUV(recipeID: id)
        let controller = UIHostingController(rootView: recipeView)
        
        //Add child controller to parent controller
        addChild(controller)
        //Add the child view to parent view
        view.addSubview(controller.view)
        //Call did move after adding the child controller to the parent
        controller.didMove(toParent: self)
        
        //Add constraints for the child controller
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            controller.view.widthAnchor.constraint(equalTo: view.widthAnchor),
            controller.view.heightAnchor.constraint(equalTo: view.heightAnchor),
            controller.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            controller.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    
    
}
