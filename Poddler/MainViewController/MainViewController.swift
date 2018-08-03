//
//  MainViewController.swift
//  Poddler
//
//  Created by Pohle, Sven on 8/3/18.
//  Copyright © 2018 Pohle, Sven. All rights reserved.
//

import UIKit


class MainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = ColorTheme.tabBarTintColor
        
        setupViewControllers()
    }
    
    
    fileprivate func setupViewControllers() {
        viewControllers = [
            generateNavigationController(viewController: SearchViewController(), title: "Search", image: UIImage(named: "search")!)
        ]
    }
    
    //MARK: - Helper Functions
    fileprivate func generateNavigationController(viewController: UIViewController, title: String, image: UIImage) -> UINavigationController {
        
        viewController.navigationItem.title = title
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        
        return navController
    }
}
