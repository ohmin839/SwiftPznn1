//
//  Direction.swift
//  
//
//  Created by ohmin839 on 2021/08/28.
//

import Foundation

public class Direction {
    public enum V: Int {
        case up = 1
        case right = 2
        case down = -1
        case left = -2
        case nowhere = 0
    }
    
    public static func allDirections() -> [Direction.V] {
        return [.up, .right, .down, .left]
    }
    
    public static func oppositeDirection(of dir: Direction.V) -> Direction.V {
        switch dir {
        case .up:
            return .down
        case .right:
            return .left
        case .down:
            return .up
        case .left:
            return .right
        default:
            return .nowhere
        }
    }
}
