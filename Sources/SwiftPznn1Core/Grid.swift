//
//  Grid.swift
//  
//
//  Created by ohmin839 on 2021/08/28.
//

import Foundation

public struct Grid: Equatable {
    var value: [[Int]]
    
    public init(value: [[Int]]) {
        self.value = value
    }
    
    static public func ==(lhs: Grid, rhs: Grid) -> Bool {
        return lhs.value == rhs.value
    }
}
