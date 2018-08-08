//
//  SearchViewController.swift
//  Poddler
//
//  Created by Pohle, Sven on 8/3/18.
//  Copyright © 2018 Pohle, Sven. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController {
    
    let podcastsSearchTableCellId = "poddlerSearchTableCellId"
    let searchController = UISearchController(searchResultsController: nil)
    var podcasts = [Podcast]()
    let animationDuration = 0.25
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupSearchBar()
    }
    
    func setupTableView() {
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.separatorColor = .clear
        tableView.register(PoddlerSearchCell.self, forCellReuseIdentifier: podcastsSearchTableCellId)
        tableView.backgroundColor = UIColor(r: 55, g: 55, b: 55)
    }
    
    func setupSearchBar() {
        self.definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search for Podcasts..."
        searchController.delegate = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
        let scb = searchController.searchBar
        // tintcolor is the color of the cancel button and text line
        scb.tintColor = UIColor.red
        
        if let textfield = scb.value(forKey: "searchField") as? UITextField {
            textfield.textColor = UIColor.blue
            if let backgroundview = textfield.subviews.first {
                backgroundview.backgroundColor = UIColor.lightGray
                backgroundview.layer.cornerRadius = 10;
                backgroundview.clipsToBounds = true;
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: podcastsSearchTableCellId, for: indexPath) as! PoddlerSearchCell
        cell.podcast = self.podcasts[indexPath.row]
        
        if indexPath.row%2 == 0 {
            cell.backgroundColor = UIColor(r: 55, g: 55, b: 55)
        } else {
            cell.backgroundColor = UIColor(r: 40, g: 40, b: 40)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension SearchViewController: UISearchControllerDelegate {
    func willPresentSearchController(_ searchController: UISearchController) {
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
            Network.shared.fetchPodcasts(searchText: searchText) { (podcasts) in
                self.podcasts = podcasts
                self.tableView.reloadData()
            }
        }
    }
}
