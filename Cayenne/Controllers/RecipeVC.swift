//
//  RecipeVC.swift
//  Cayenne
//
//  Created by Wellington Johnson on 5/27/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import UIKit

class RecipeVC: UIViewController {
    
    var recipeID: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        guard let id = recipeID else {return}
        print(id)
    }
    
    
    
    


}
