//
//  SearchViewController.swift
//  Poddler
//
//  Created by Pohle, Sven on 8/3/18.
//  Copyright © 2018 Pohle, Sven. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorTheme.searchController.background
        
        setupTableView()
        setupSearchBar()
    }
    
    func setupTableView() {
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.separatorColor = .clear
    }
    
    func setupSearchBar() {
        self.definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search for Podcasts..."
        searchController.delegate = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
}

extension SearchViewController: UISearchControllerDelegate {
    
}

extension SearchViewController: UISearchBarDelegate {
    
}
