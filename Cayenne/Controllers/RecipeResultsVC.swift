//
//  RecipeResultsVC.swift
//  Cayenne
//
//  Created by Wellington Johnson on 5/15/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import UIKit

class RecipeResultsVC: UIViewController {
    
    enum Section {
        case main
    }
    
    var searchQuery: String!
    var dietQuery: String!
    let padding: CGFloat = 20
    let recipeListNetworkManager = RecipeListNetworkManager()
    var recipeResults:[Recipe] = []
    var recipeID = 0
    
    //Initialize a table view
    var recipesTableView: UITableView!
    
    //Create a diffable data source
    var dataSource: UITableViewDiffableDataSource<Section,Recipe>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
        getRecipes()
        configureTableViewDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureViewController(){
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func getRecipes() {
        recipeListNetworkManager.getRecipeList(for: searchQuery, diet: dietQuery) { [weak self] result in
            
            guard let self = self else {return}
            
            switch result {
            case .success(let results):
                self.recipeResults = results.results
                self.createAndApplySnapshotToDataSource()
            case .failure(let error):
                self.popAlertView(alertTitle: "Could not retrieve results", alertBody: error.rawValue, alertButtonTitle: "Ok")
            }
        }
    }
    
    
// MARK: - Configure the table view for recipes and its data source and data snapshot combo
    func configureTableView(){
        recipesTableView = UITableView(frame: view.bounds, style: .plain)
        
        view.addSubview(recipesTableView)
        recipesTableView.delegate = self
        
        recipesTableView.rowHeight = 100
        recipesTableView.pin(to: view)
        recipesTableView.backgroundColor = .systemBackground
        recipesTableView.register(RecipeCell.self, forCellReuseIdentifier: RecipeCell.reuseID)
    }

    func configureTableViewDataSource(){
        dataSource = UITableViewDiffableDataSource<Section,Recipe>(tableView: recipesTableView) { (recipesTableView, indexPath, recipe ) -> UITableViewCell? in
            let cell = recipesTableView.dequeueReusableCell(withIdentifier: RecipeCell.reuseID, for: indexPath) as! RecipeCell
            cell.set(recipe: recipe)
            return cell
        }
    }
    
    func createAndApplySnapshotToDataSource(){
        var snapshot = NSDiffableDataSourceSnapshot<Section,Recipe>()
        snapshot.appendSections([.main])
        snapshot.appendItems(recipeResults)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
}


//Extend out to passing this recipe id to another network manager to handle pulling a single recipe to display
extension RecipeResultsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(recipeResults[indexPath.row].id)
    }
}

