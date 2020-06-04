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
    let vegetarian, vegan, glutenFree, dairyFree: Bool?
    let veryHealthy, cheap, veryPopular, sustainable: Bool?
    let preparationMinutes, cookingMinutes: Int?
    let creditsText, sourceName: String?
    let extendedIngredients: [ExtendedIngredient]?
    let id: Int?
    let title: String?
    let readyInMinutes, servings: Int?
    let sourceURL: String?
    let image: String?
    let imageType, summary: String?
    let dishTypes, diets: [String]?
    let analyzedInstructions: [AnalyzedInstruction]?
    
    init() {
        self.vegetarian = nil
        self.vegan = nil
        self.glutenFree = nil
        self.dairyFree = nil
        self.veryHealthy = nil
        self.cheap = nil
        self.veryPopular = nil
        self.sustainable = nil
        self.preparationMinutes = nil
        self.cookingMinutes = nil
        self.creditsText = nil
        self.sourceName = nil
        self.extendedIngredients = nil
        self.id = nil
        self.title = nil
        self.readyInMinutes = nil
        self.servings = nil
        self.sourceURL = nil
        self.image = nil
        self.imageType = nil
        self.summary = nil
        self.dishTypes = nil
        self.diets = nil
        self.analyzedInstructions = nil
    }
}

// MARK: - AnalyzedInstruction
struct AnalyzedInstruction: Codable {
    let steps: [Step]?
}

// MARK: - Step
struct Step: Codable {
    let number: Int?
    let step: String?
    let ingredients, equipment: [Ent]?
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
    var id: Int?
    let aisle, image, consistency, name: String?
    let original, originalString, originalName: String?
    let amount: Double?
    let unit: String?
    let meta, metaInformation: [String]?
    let measures: Measures?
}

// MARK: - Measures
struct Measures: Codable {
    let us, metric: Metric?
}

// MARK: - Metric
struct Metric: Codable {
    let amount: Double?
    let unitShort, unitLong: String?
}

