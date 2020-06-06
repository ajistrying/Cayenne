//
//  SpecificRecipe.swift
//  Cayenne
//
//  Created by Wellington Johnson on 5/30/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import Foundation

// MARK: - SpecificRecipe
struct SpecificRecipe: Codable {
    let vegetarian, vegan, glutenFree, dairyFree: Bool
    let veryHealthy, cheap, veryPopular, sustainable: Bool
    let preparationMinutes, cookingMinutes: Int
    let creditsText, sourceName: String
    let extendedIngredients: [ExtendedIngredient]
    let title: String
    let readyInMinutes, servings: Int
    let sourceURL: String?
    let image: String?
    let summary: String
}

// MARK: - Step
struct Step: Codable {
    let number: Int
    let step: String
    let ingredients, equipment: [Ent]
    let length: Length?
}

// MARK: - Ent
struct Ent: Codable {
    let id: Int?
    let name, image: String?
}

// MARK: - Length
struct Length: Codable {
    let number: Int?
    let unit: String?
}

// MARK: - ExtendedIngredient
struct ExtendedIngredient: Codable {
    var id: Int
    let aisle, image, consistency, name: String
    let original, originalString, originalName: String
    let amount: Double
    let unit: String
    let meta, metaInformation: [String]?
}
