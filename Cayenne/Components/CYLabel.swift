//
//  CYLabel.swift
//  Cayenne
//
//  Created by Wellington Johnson on 5/14/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import UIKit

class CYLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(text: String,font: UIFont) {
        super.init(frame: .zero)
        self.text = text
        self.font = font
        configure()
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .label
        textAlignment = .center
        
    }
    
}
