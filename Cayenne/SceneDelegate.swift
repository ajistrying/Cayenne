//
//  SceneDelegate.swift
//  Cayenne
//
//  Created by Wellington Johnson on 5/13/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Initialize a window with the bounds of the windowScene above
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        
        // Every window, should have a window scene, so we're going to add the windowScene to the window
        window?.windowScene = windowScene
        
        //Set our root view controller to the tab bar controller that will hold our navigation controllers that hold our view controllers
        window?.rootViewController = createTabBar()
        
        // Show the current window with the attached windwoScene and view controller
        window?.makeKeyAndVisible()
    }
    
    
    func createSearchIngredientNavigationController() -> UINavigationController {
        let searchIngredientVC = SearchIngredientVC()
        searchIngredientVC.title = "Recipe Finder"
        searchIngredientVC.tabBarItem = UITabBarItem(title: "Find Recipes",  image: UIImage(systemName: "magnifyingglass"), tag: 0)
        return UINavigationController(rootViewController: searchIngredientVC)
    }
    
    func createCookbookNavigationController() -> UINavigationController {
        let  cookbookListVC = CookbookListVC()
        cookbookListVC.title = "My Cookbooks"
        cookbookListVC.tabBarItem = UITabBarItem(title: "Cookbooks", image: UIImage(systemName: "book.fill"), tag: 1)
        return UINavigationController(rootViewController: cookbookListVC)
    }
    
    
    func createTabBar() -> UITabBarController{
        let tabbar = UITabBarController()
        tabbar.viewControllers = [createSearchIngredientNavigationController(),createCookbookNavigationController()]
        return tabbar
    }
    
    
    
    
    
    

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

