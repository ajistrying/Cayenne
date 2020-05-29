//
//  ExtensionsForViewController.swift
//  Cayenne
//
//  Created by Wellington Johnson on 5/17/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import UIKit

// Extend the functionality of a view controller to be able to run this function
extension UIViewController {
    func popAlertView(alertTitle: String, alertBody: String, alertButtonTitle: String){
        
        // Dispatch this on the main thread
        DispatchQueue.main.async {
            let alertView = CYAlertVC(alertTitle: alertTitle, alertBody: alertBody, alertButtonTitle: alertButtonTitle)
            
            alertView.modalPresentationStyle = .overFullScreen // Set the way the view controller is presented
            alertView.modalTransitionStyle = .crossDissolve // Set the way the view controller is transitioned onto the screen
            
            self.present(alertView, animated: true)
        }
        
        
    }
}

