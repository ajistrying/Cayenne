//
//  CYTitleLabel.swift
//  Cayenne
//
//  Created by Wellington Johnson on 5/17/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import UIKit

class CYTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat, lineBreakMode: NSLineBreakMode ){
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        self.lineBreakMode = lineBreakMode
        configure()
    }
    
    private func configure(){
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        translatesAutoresizingMaskIntoConstraints = false
    }
}
