//
//  StringArray.swift
//  MusicByLocation
//
//  Created by Louis Jaume on 14/03/2023.
//

import Foundation

struct StringArray: Identifiable {
    var id = UUID()
    var value: [String]
    
    init(_ value: [String]) {
        self.value = value
    }
}
