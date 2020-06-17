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
    
    //Initialize an empty list of Recipes to place the filtered results in
    var filteredRecipes: [Recipe] = []
    //By initializing UISearchController with a nil value for searchResultsController, you’re telling the search controller that you want to use the same view you’re searching to display the results.
    let searchController = UISearchController(searchResultsController: nil)
    //A Boolean to tell if the searchbar is empty or not
    var isSearchBarEmpty: Bool {
        searchController.searchBar.text?.isEmpty ?? true
    }

    //Initialize a table view
    var recipesTableView: UITableView!
    
    //Create a diffable data source
    var dataSource: UITableViewDiffableDataSource<Section,Recipe>!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureSearchController()
        configureFilterButton()
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
    
// MARK: - Configure Navigation Items
    func configureSearchController(){
        // 1 Set searchResultsUpdater to self.
        searchController.searchResultsUpdater = self
        
        // 2 Turn off default behavior of dimming background during searching.
        searchController.obscuresBackgroundDuringPresentation = false
        
        // 3 Set the placeholder to something that’s specific to this app.
        searchController.searchBar.placeholder = "Search Recipes"
        
        // 4 Add the searchBar to the navigationItem. This is necessary because Interface Builder is not yet compatible with UISearchController.
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        // 5 Ensure that the search bar doesn’t remain on the screen if the user navigates to another view controller while the UISearchController is active.
        definesPresentationContext = true
        
    }
    
    // TODO: Address filter button to present filters VC modally
    func configureFilterButton(){
        let filterButton = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = filterButton
    }
   

// MARK: - Function to get the recipes
    
    func getRecipes() {
        recipeListNetworkManager.getRecipeList(for: searchQuery, diet: dietQuery) { [weak self] result in
            
            guard let self = self else {return}
            
            switch result {
            case .success(let results):
                self.recipeResults = results.results
                if self.recipeResults.count == 0 {
                    self.popAlertView(alertTitle: "", alertBody: "No results found for this ingredient and diet choice, please try again!", alertButtonTitle: "Ok")
                }
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
    
    // Function used to filter the recipe list based on the text entered in the search bar
    func performQuery(with filter: String){
        filteredRecipes = recipeResults.filter{
            return $0.title.lowercased().contains(filter.lowercased())
        }
        
        if isSearchBarEmpty {
            createAndApplySnapshotToDataSource()
        } else {
            var snapshot = NSDiffableDataSourceSnapshot<Section,Recipe>()
            snapshot.appendSections([.main])
            snapshot.appendItems(filteredRecipes)
            DispatchQueue.main.async {
                self.dataSource.apply(snapshot, animatingDifferences: true)
            }
        }
    }
    
}

// MARK: - Delegate Extensions

//Whenever the user adds or removes text in the search bar, the UISearchController will inform the MasterViewController class of the change via a call to updateSearchResults(for:), which in turn calls filterRecipes(_:)
extension RecipeResultsVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        performQuery(with: searchBar.text ?? "")
    }
}


//Extend out to passing this recipe id to another network manager to handle pulling a single recipe to display
extension RecipeResultsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = recipeResults[indexPath.row]
        
        //Set specific recipe details into the recipe view controller
        let recipeVC = RecipeVC()
        recipeVC.recipeID = row.id
        navigationController?.pushViewController(recipeVC, animated: true)
        
    }
}



