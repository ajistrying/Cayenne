//
//  ErrorMessage.swift
//  Cayenne
//
//  Created by Wellington Johnson on 5/20/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import Foundation


enum ErrorMessage: String, Error {
    case invalidRequest = "The request could not be made. Please try again."
    case invalidResponse = "The response did not come back okay. Please try again."
    case couldNotRetrieveData = "The data could not be retrieved. Please try again."
    case couldNotRetrieveRecipe = "The recipe could not be retrieved. Please find another!"
    case invalidData = "The data retrieved was invalid. Please try again."
}
