//
//  Podcast.swift
//  Poddler
//
//  Created by Pohle, Sven on 8/3/18.
//  Copyright © 2018 Pohle, Sven. All rights reserved.
//

import Foundation

struct Podcast: Decodable, Encodable {
    var trackName: String?
    var artistName: String?
    var artworkUrl600: String?
    var trackCount: Int?
    var feedUrl: String?
}
