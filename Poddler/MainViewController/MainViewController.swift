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
        setupUserInterface()
        setupViewControllers()
    }
    
    fileprivate func setupUserInterface() {
        // sets the tint color for the background of the bar
        tabBar.barTintColor = ColorTheme.tabBarTintColor
        
        // sets the tint color for the tabbar items
        tabBar.tintColor = .white
    }
    
    fileprivate func setupViewControllers() {
        viewControllers = [
            generateNavigationController(viewController: SearchViewController(), title: "Search", image: UIImage(named: "find")!)
        ]
        
        let selectedColor   = UIColor.white
        let unselectedColor = UIColor.orange

        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
    }
    
    //MARK: - Helper Functions
    fileprivate func generateNavigationController(viewController: UIViewController,
                                                  title: String,
                                                  image: UIImage) -> UINavigationController {
        
        viewController.navigationItem.title = title
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        
        return navController
    }
}
