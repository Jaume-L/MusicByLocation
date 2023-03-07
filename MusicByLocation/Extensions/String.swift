//
//  String.swift
//  MusicByLocation
//
//  Created by Louis Jaume on 07/03/2023.
//

import Foundation

extension String: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return hash
    }
}
