//
//  Recipes.swift
//  Cayenne
//
//  Created by Wellington Johnson on 5/18/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct Recipes: Codable, Hashable {
    var results: [Recipe]

}

// MARK: - Result
struct Recipe: Codable, Hashable {
    var id: Int
    var title: String
    var readyInMinutes, servings: Int
    var openLicense: Int
    var image: String?
}


