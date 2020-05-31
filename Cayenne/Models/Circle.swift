//
//  Circle.swift
//  Cayenne
//
//  Created by Wellington Johnson on 5/31/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import Foundation
import Combine

class CircleModel: ObservableObject {
    @Published var text: String

    init(text: String) {
        self.text = text
    }
}
