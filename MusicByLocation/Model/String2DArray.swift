//
//  String2DArray.swift
//  MusicByLocation
//
//  Created by Louis Jaume on 14/03/2023.
//

import Foundation

struct String2DArray: Identifiable, RandomAccessCollection {
    var id = UUID()
    var matrix: [[String]]
    
    typealias Index = Int
    var startIndex: Index { matrix.startIndex }
    var endIndex: Index { matrix.endIndex }
    subscript(position: Index) -> [String] { matrix[position] }
    
    init(_ matrix: [[String]]) {
        self.matrix = matrix
    }
    
    func index(after i: Index) -> Index { matrix.index(after: i) }
    func index(before i: Index) -> Index { matrix.index(before: i) }
    func index(_ i: Index, offsetBy distance: Int) -> Index { matrix.index(i, offsetBy: distance) }
    func distance(from start: Index, to end: Index) -> Int { matrix.distance(from: start, to: end) }
    
}
