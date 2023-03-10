//
//  Artist.swift
//  MusicByLocation
//
//  Created by Louis Jaume on 03/03/2023.
//

import Foundation

struct Artist: Codable {
    var name: String
    var genre: String?
    
    private enum CodingKeys: String, CodingKey {
        case name = "artistName"
        case genre = "primaryGenreName"
    }
}
