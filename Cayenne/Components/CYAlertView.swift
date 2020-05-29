//
//  CYAlertView.swift
//  Cayenne
//
//  Created by Wellington Johnson on 5/17/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import UIKit

class CYAlertView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        layer.cornerRadius = 16
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
