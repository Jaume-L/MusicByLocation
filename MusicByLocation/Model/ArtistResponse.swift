//
//  ArtistResponse.swift
//  MusicByLocation
//
//  Created by Louis Jaume on 03/03/2023.
//

import Foundation

struct ArtistResponse: Codable {
    var count: Int
    var results: [Artist]
    
    private enum CodingKeys: String, CodingKey {
        case count = "resultCount"
        case results
    }
}
