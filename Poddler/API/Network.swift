//
//  Network.swift
//  Poddler
//
//  Created by Pohle, Sven on 8/3/18.
//  Copyright © 2018 Pohle, Sven. All rights reserved.
//

import Foundation
import Alamofire

class Network {
    static let shared = Network()
    
    let baseUrl = "https://itunes.apple.com/search?"
    
    func fetchPodcasts(searchText: String, completionHandler: @escaping ([Podcast]) -> ()) {
        
        let parameters = ["term":searchText, "media":"podcast"]
        
        Alamofire.request(baseUrl, method: .get, parameters: parameters,
                          encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            if let error = dataResponse.error {
                print("Failed to get data: \(error)")
                return
            }
            
            guard let data = dataResponse.data else { return }
            
            do {
                let searchResults = try JSONDecoder().decode(SearchResults.self, from: data)
                
                completionHandler(searchResults.results)
                
            } catch let decodeErr {
                print("Failed to decode: \(decodeErr)")
                return
            }
        }
    }
    
    struct SearchResults: Decodable {
        let resultCount: Int
        let results: [Podcast]
    }
}

