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
            let recipeView = RecipeSUV(recipeID: self.recipeID)
            let controller = UIHostingController(rootView: recipeView)
            addChild(controller)
            controller.view.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(controller.view)
            controller.didMove(toParent: self)

            NSLayoutConstraint.activate([
                controller.view.widthAnchor.constraint(equalTo: view.widthAnchor),
                controller.view.heightAnchor.constraint(equalTo: view.heightAnchor),
                controller.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                controller.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        }
        
        
        
}
