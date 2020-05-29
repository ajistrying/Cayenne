//
//  CYAlertVC.swift
//  Cayenne
//
//  Created by Wellington Johnson on 5/17/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import UIKit

class CYAlertVC: UIViewController {

// MARK: - UI Elements
    let alertView = CYAlertView()
    let titleLabel = CYTitleLabel(textAlignment: .center, fontSize: 20,lineBreakMode: .byTruncatingTail)
    let bodyLabel = CYBodyLabel(textAlignment: .center)
    let actionButton = CYButton(title: "Ok", backgroundColor: .systemPink)
    
    let padding: CGFloat = 20
    
    
// MARK: - Creating the initializer section to call this view controller from other view controllers
    var alertTitle: String?
    var alertBody: String?
    var alertButtonTitle: String?
    
    init(alertTitle: String, alertBody: String, alertButtonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alertTitle
        self.alertBody = alertBody
        self.alertButtonTitle = alertButtonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        super.viewDidLoad()
        configureAlertView()
        configureTitleLabel()
        configureActionButton()
        configureBodyLabel()
    }
    
    
// MARK: - UI Building
    func configureAlertView(){
        view.addSubview(alertView)
        
        NSLayoutConstraint.activate([
            alertView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertView.heightAnchor.constraint(equalToConstant: 220),
            alertView.widthAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    
    func configureTitleLabel(){
        alertView.addSubview(titleLabel)
        
        titleLabel.text = alertTitle ?? "Something went wrong"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: alertView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    //Helper function to dismiss the current view
    @objc func dismissVC(){
        self.dismiss(animated: true)
    }
    
    func configureActionButton(){
        alertView.addSubview(actionButton)
        
        actionButton.setTitle(alertButtonTitle, for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureBodyLabel(){
        alertView.addSubview(bodyLabel)
        
        bodyLabel.text = alertBody ?? "Unable to complete request"
        bodyLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            bodyLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12),
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            bodyLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: padding),
            bodyLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -padding)
        ])
    }
    
    
    
    
    
}
