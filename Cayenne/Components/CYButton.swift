//
//  CYButton.swift
//  Cayenne
//
//  Created by Wellington Johnson on 5/15/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import UIKit

class CYButton: UIButton {

    override init(frame: CGRect) {
           super.init(frame: frame)
        
        configure()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
    init(title: String,backgroundColor: UIColor) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        configure()
       }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    }
}
