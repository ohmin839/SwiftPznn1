//
//  Puzzle.swift
//  
//
//  Created by ohmin839 on 2021/08/28.
//

import Foundation

public struct Puzzle {
    var grid: Grid
    let size: UInt
    var emptyRow: Int
    var emptyCol: Int
    
    public init(size: UInt) {
        var grid: [[Int]] = []
        
        for _ in 0..<size+2 {
            var row: [Int] = []
            for _ in 0..<size+2 {
                row.append(-1)
            }
            grid.append(row)
        }
        
        for i in 1...size {
            for j in 1...size {
                grid[Int(i)][Int(j)] = Int(size) * Int(i-1) + Int(j)
            }
        }
        
        grid[Int(size)][Int(size)] = 0
        
        self.grid = Grid(value: grid)
        self.size = size
        self.emptyRow = Int(size)
        self.emptyCol = Int(size)
    }
    
    func movable(to dir: Direction.V) -> Bool {
        switch dir {
        case .up:
            return grid.value[emptyRow+1][emptyCol] > 0 ? true : false
        case .right:
            return grid.value[emptyRow][emptyCol-1] > 0 ? true : false
        case .down:
            return grid.value[emptyRow-1][emptyCol] > 0 ? true : false
        case .left:
            return grid.value[emptyRow][emptyCol+1] > 0 ? true : false
        default:
            return false
        }
    }
    
    public mutating func move(to dir: Direction.V) {
        if !movable(to: dir) {
            return
        }
        var nextEmptyRow = emptyRow
        var nextEmptyCol = emptyCol
        switch dir {
        case .up:
            nextEmptyRow += 1
        case .right:
            nextEmptyCol -= 1
        case .down:
            nextEmptyRow -= 1
        case .left:
            nextEmptyCol += 1
        default:
            break
        }
        
        grid.value[emptyRow][emptyCol] = grid.value[nextEmptyRow][nextEmptyCol]
        grid.value[nextEmptyRow][nextEmptyCol] = 0
        
        emptyRow = nextEmptyRow
        emptyCol = nextEmptyCol
    }
    
    func movableDirections() -> [Direction.V] {
        return Direction.allDirections()
            .filter { movable(to: $0) }
    }
    
    mutating func moveRandom(except prevDir: Direction.V = .nowhere) -> Direction.V {
        var options = movableDirections()
        if prevDir != .nowhere {
            options.removeAll(where: { $0 == Direction.oppositeDirection(of: prevDir)} )
        }
        guard let choice = options.randomElement() else {
            return .nowhere
        }
        move(to: choice)
        return choice
    }
    
    public mutating func shuffle(by count: UInt) {
        var prevDir = Direction.V.nowhere
        for _ in 1...count {
            prevDir = moveRandom(except: prevDir)
        }
    }
    
    public func completed() -> Bool {
        let pz = Puzzle(size: self.size)
        return self.grid == pz.grid
    }
}

extension Puzzle: CustomStringConvertible {
    public var description: String {
        var innerGrid: [[Int]] = []
        for i in 1...size {
            var row: [Int] = []
            for j in 1...size {
                row.append(grid.value[Int(i)][Int(j)])
            }
            innerGrid.append(row)
        }
        
        return innerGrid.map { row in
            row.map { e in
                e != 0 ? String(format: "%3d", e) : "   "
            }.reduce("") {
                $0 + $1
            }
        }.reduce("") {
            "\($0)\n\($1)"
        }
    }
}
