//
//  MinuteConverter.swift
//  Cayenne
//
//  Created by Wellington Johnson on 5/26/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import Foundation

struct MinuteConverter {
    func minutesToHours(minutes: Int) -> (Int,Int) {
        
        return(minutes/60,minutes%60)
        
    }
}
