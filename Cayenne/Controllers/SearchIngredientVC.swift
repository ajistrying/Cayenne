//
//  searchIngredientVC.swift
//  Cayenne
//
//  Created by Wellington Johnson on 5/14/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import UIKit

class SearchIngredientVC: UIViewController {
    
// MARK: - UI Variables
    let cayenneLogoImageView = UIImageView()
    let dietPickerView = UIPickerView()
    let searchIngredientTextField = CYTextField()
    let dietLabel = CYLabel(text: "Diet Choice",font: UIFont.preferredFont(forTextStyle: .largeTitle))
    let searchButton = CYButton(title: "Search",backgroundColor: .systemPink)
    
    
// MARK: - Model Variabels
    let dietChoices = DietChoices()
    var dietChoiceSelected = ""
    
    //Calculated property to validate whether the ingredient search field is empty or not
    var isIngredientEmpty: Bool {
        return searchIngredientTextField.text!.isEmpty
    }
    
// MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground // Adapts to dark and light mode
        
        configureCayenneLogoImageView()
        configureSearchIngredientTextField()
        configureDietLabel()
        configureDietPickerView()
        configureSearchButton()
        createDismissKeyboardTapGesture()
    }
    
    // Hide the navigation controller on this screen
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
// MARK: - UI Action Functions
    @objc func pushToRecipeResultsVC(){
        
        if isIngredientEmpty {
            popAlertView(alertTitle: "Empty Search", alertBody: "Please enter an ingredient to find tasty recipes!", alertButtonTitle: "Ok")
        } else {
            let recipeResultsListVC = RecipeResultsVC()
            recipeResultsListVC.title = searchIngredientTextField.text
            recipeResultsListVC.searchQuery = searchIngredientTextField.text
            recipeResultsListVC.dietQuery = dietChoiceSelected
            navigationController?.pushViewController(recipeResultsListVC, animated: true)
        
        }
        
        
    }
    
    // Create a function to dismiss the keyboard when we click outside of the textfield
       func createDismissKeyboardTapGesture(){
           // Initialize a gesture recognizer that will detect a tap or multiple taps
           // We specify a target of the gesture, which will be the view and then assign an action that the target will receive which is .endEditing
           let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
           
           //Attach the gesture to the view with .addGestureRecognizer
           view.addGestureRecognizer(tap)
       }
    
    
    
// MARK: - UI Styling
    func configureCayenneLogoImageView() {
        view.addSubview(cayenneLogoImageView)
        cayenneLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        cayenneLogoImageView.image = UIImage(named: "ca-logo")!
        
        NSLayoutConstraint.activate([
            cayenneLogoImageView.widthAnchor.constraint(equalToConstant: 200),
            cayenneLogoImageView.heightAnchor.constraint(equalToConstant: 200),
            cayenneLogoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            cayenneLogoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    
    func configureSearchIngredientTextField() {
        view.addSubview(searchIngredientTextField)
        
        searchIngredientTextField.delegate = self
        
        NSLayoutConstraint.activate([
            searchIngredientTextField.topAnchor.constraint(equalTo: cayenneLogoImageView.bottomAnchor, constant: 10),
            searchIngredientTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            searchIngredientTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            searchIngredientTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
        
    }
    
    
    func configureDietLabel(){
        view.addSubview(dietLabel)
        
        NSLayoutConstraint.activate([
            dietLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            dietLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            dietLabel.topAnchor.constraint(equalTo: searchIngredientTextField.bottomAnchor, constant: 40)
        ])
    }
    
    
    func configureDietPickerView(){
        view.addSubview(dietPickerView)
        dietPickerView.translatesAutoresizingMaskIntoConstraints = false
        
        dietPickerView.dataSource = self
        dietPickerView.delegate = self
        
        NSLayoutConstraint.activate([
            dietPickerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            dietPickerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            dietPickerView.topAnchor.constraint(equalTo: dietLabel.bottomAnchor, constant: 10),
            dietPickerView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func configureSearchButton(){
        view.addSubview(searchButton)
        
        // Adding an action for the button to push to the results list with the action function
        searchButton.addTarget(self, action: #selector(pushToRecipeResultsVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            searchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            searchButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            searchButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70),
            searchButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }

}





// MARK: - Extention
extension SearchIngredientVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dietChoices.dietChoices.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        dietChoices.dietChoices[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.dietChoiceSelected = dietChoices.dietChoices[row]
    }
    
    
}


extension SearchIngredientVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

