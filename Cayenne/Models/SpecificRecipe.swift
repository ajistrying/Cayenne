//
//  SpecificRecipe.swift
//  Cayenne
//
//  Created by Wellington Johnson on 5/30/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import Foundation

// MARK: - SpecificRecipe
struct SpecificRecipe {
    var vegetarian, vegan, glutenFree, dairyFree: Bool?
    var veryHealthy, cheap, veryPopular, sustainable: Bool?
    var preparationMinutes, cookingMinutes: Int?
    var creditsText, sourceName: String?
    var extendedIngredients: [ExtendedIngredient]?
    var id: Int?
    var title: String?
    var readyInMinutes, servings: Int?
    var sourceURL: String?
    var image: String?
    var imageType, summary: String?
    var cuisines: [Any?]?
    var dishTypes, diets: [String]?
    var winePairing: WinePairing?
    var analyzedInstructions: [AnalyzedInstruction]?
    var originalID: NSNull?
}

// MARK: - AnalyzedInstruction
struct AnalyzedInstruction {
    var steps: [Step]?
}

// MARK: - Step
struct Step {
    var number: Int?
    var step: String?
    var ingredients, equipment: [Ent]?
    var length: Length?
}

// MARK: - Ent
struct Ent {
    var id: Int?
    var name, image: String?
}

// MARK: - Length
struct Length {
    var number: Int?
    var unit: String?
}

// MARK: - ExtendedIngredient
struct ExtendedIngredient {
    var id: Int?
    var aisle, image, consistency, name: String?
    var original, originalString, originalName: String?
    var amount: Double?
    var unit: String?
    var meta, metaInformation: [String]?
    var measures: Measures?
}

// MARK: - Measures
struct Measures {
    var us, metric: Metric?
}

// MARK: - Metric
struct Metric {
    var amount: Double?
    var unitShort, unitLong: String?
}

// MARK: - WinePairing
struct WinePairing {
}
