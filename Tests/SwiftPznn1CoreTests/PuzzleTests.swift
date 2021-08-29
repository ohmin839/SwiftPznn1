import XCTest
@testable import SwiftPznn1Core

final class PuzzleTests: XCTestCase {
    func testInit() throws {
        XCTContext.runActivity(named: "size 3"){ _ in
            let puzzle = Puzzle(size: 3)
            let expected = [
                [-1,-1,-1,-1,-1],
                [-1, 1, 2, 3,-1],
                [-1, 4, 5, 6,-1],
                [-1, 7, 8, 0,-1],
                [-1,-1,-1,-1,-1]]
            XCTAssertEqual(puzzle.grid.value, expected)
        }
        XCTContext.runActivity(named: "size 4"){ _ in
            let puzzle = Puzzle(size: 4)
            let expected = [
                [-1, -1, -1, -1, -1, -1],
                [-1,  1,  2,  3,  4, -1],
                [-1,  5,  6,  7,  8, -1],
                [-1,  9, 10, 11, 12, -1],
                [-1, 13, 14, 15,  0, -1],
                [-1, -1, -1, -1, -1, -1]]
            XCTAssertEqual(puzzle.grid.value, expected)
        }
    }
    
    func testMove() throws {
        XCTContext.runActivity(named: "up, and movable"){ _ in
            let initialGrid = [
                [-1, -1, -1, -1, -1, -1],
                [-1,  9,  2,  0,  4, -1],
                [-1, 14,  7,  5, 12, -1],
                [-1,  6, 13, 11, 10, -1],
                [-1,  1,  3,  8, 15, -1],
                [-1, -1, -1, -1, -1, -1]]
            var puzzle = Puzzle(size: 4)
            puzzle.emptyRow = 1
            puzzle.emptyCol = 3
            puzzle.grid.value = initialGrid
            puzzle.move(to: .up)
            let expected = [
                [-1, -1, -1, -1, -1, -1],
                [-1,  9,  2,  5,  4, -1],
                [-1, 14,  7,  0, 12, -1],
                [-1,  6, 13, 11, 10, -1],
                [-1,  1,  3,  8, 15, -1],
                [-1, -1, -1, -1, -1, -1]]
            XCTAssertEqual(puzzle.grid.value, expected)
        }
        XCTContext.runActivity(named: "up, but not movable"){ _ in
            let initialGrid = [
                [-1, -1, -1, -1, -1, -1],
                [-1,  7,  3,  1, 11, -1],
                [-1,  5, 10,  2,  8, -1],
                [-1,  6,  4, 12, 15, -1],
                [-1, 13,  9, 14,  0, -1],
                [-1, -1, -1, -1, -1, -1]]
            var puzzle = Puzzle(size: 4)
            puzzle.emptyRow = 4
            puzzle.emptyCol = 4
            puzzle.grid.value = initialGrid
            puzzle.move(to: .up)
            let expected = [
                [-1, -1, -1, -1, -1, -1],
                [-1,  7,  3,  1, 11, -1],
                [-1,  5, 10,  2,  8, -1],
                [-1,  6,  4, 12, 15, -1],
                [-1, 13,  9, 14,  0, -1],
                [-1, -1, -1, -1, -1, -1]]
            XCTAssertEqual(puzzle.grid.value, expected)
        }
        XCTContext.runActivity(named: "right, and movable"){ _ in
            let initialGrid = [
                [-1, -1, -1, -1, -1, -1],
                [-1, 10,  3,  8, 14, -1],
                [-1,  7,  2, 11,  0, -1],
                [-1,  5,  6, 15, 12, -1],
                [-1,  9, 13,  1,  4, -1],
                [-1, -1, -1, -1, -1, -1]]
            var puzzle = Puzzle(size: 4)
            puzzle.emptyRow = 2
            puzzle.emptyCol = 4
            puzzle.grid.value = initialGrid
            puzzle.move(to: .right)
            let expected = [
                [-1, -1, -1, -1, -1, -1],
                [-1, 10,  3,  8, 14, -1],
                [-1,  7,  2,  0, 11, -1],
                [-1,  5,  6, 15, 12, -1],
                [-1,  9, 13,  1,  4, -1],
                [-1, -1, -1, -1, -1, -1]]
            XCTAssertEqual(puzzle.grid.value, expected)
        }
        XCTContext.runActivity(named: "right, but not movable"){ _ in
            let initialGrid = [
                [-1, -1, -1, -1, -1, -1],
                [-1, 15, 14,  5,  6, -1],
                [-1,  0,  2, 13,  3, -1],
                [-1,  9, 10,  7,  8, -1],
                [-1, 12,  1,  4,  1, -1],
                [-1, -1, -1, -1, -1, -1]]
            var puzzle = Puzzle(size: 4)
            puzzle.emptyRow = 2
            puzzle.emptyCol = 1
            puzzle.grid.value = initialGrid
            puzzle.move(to: .right)
            let expected = [
                [-1, -1, -1, -1, -1, -1],
                [-1, 15, 14,  5,  6, -1],
                [-1,  0,  2, 13,  3, -1],
                [-1,  9, 10,  7,  8, -1],
                [-1, 12,  1,  4,  1, -1],
                [-1, -1, -1, -1, -1, -1]]
            XCTAssertEqual(puzzle.grid.value, expected)
        }
        XCTContext.runActivity(named: "down, and movable"){ _ in
            let initialGrid = [
                [-1, -1, -1, -1, -1, -1],
                [-1,  7,  3,  1, 11, -1],
                [-1,  5, 10,  2,  8, -1],
                [-1,  6,  4, 12, 15, -1],
                [-1, 13,  9, 14,  0, -1],
                [-1, -1, -1, -1, -1, -1]]
            var puzzle = Puzzle(size: 4)
            puzzle.emptyRow = 4
            puzzle.emptyCol = 4
            puzzle.grid.value = initialGrid
            puzzle.move(to: .down)
            let expected = [
                [-1, -1, -1, -1, -1, -1],
                [-1,  7,  3,  1, 11, -1],
                [-1,  5, 10,  2,  8, -1],
                [-1,  6,  4, 12,  0, -1],
                [-1, 13,  9, 14, 15, -1],
                [-1, -1, -1, -1, -1, -1]]
            XCTAssertEqual(puzzle.grid.value, expected)
        }
        XCTContext.runActivity(named: "down, but not movable"){ _ in
            let initialGrid = [
                [-1, -1, -1, -1, -1, -1],
                [-1,  9,  2,  0,  4, -1],
                [-1, 14,  7,  5, 12, -1],
                [-1,  6, 13, 11, 10, -1],
                [-1,  1,  3,  8, 15, -1],
                [-1, -1, -1, -1, -1, -1]]
            var puzzle = Puzzle(size: 4)
            puzzle.emptyRow = 1
            puzzle.emptyCol = 3
            puzzle.grid.value = initialGrid
            puzzle.move(to: .down)
            let expected = [
                [-1, -1, -1, -1, -1, -1],
                [-1,  9,  2,  0,  4, -1],
                [-1, 14,  7,  5, 12, -1],
                [-1,  6, 13, 11, 10, -1],
                [-1,  1,  3,  8, 15, -1],
                [-1, -1, -1, -1, -1, -1]]
            XCTAssertEqual(puzzle.grid.value, expected)
        }
        XCTContext.runActivity(named: "left, and movable"){ _ in
            let initialGrid = [
                [-1, -1, -1, -1, -1, -1],
                [-1, 15, 14,  5,  6, -1],
                [-1,  0,  2, 13,  3, -1],
                [-1,  9, 10,  7,  8, -1],
                [-1, 12,  1,  4,  1, -1],
                [-1, -1, -1, -1, -1, -1]]
            var puzzle = Puzzle(size: 4)
            puzzle.emptyRow = 2
            puzzle.emptyCol = 1
            puzzle.grid.value = initialGrid
            puzzle.move(to: .left)
            let expected = [
                [-1, -1, -1, -1, -1, -1],
                [-1, 15, 14,  5,  6, -1],
                [-1,  2,  0, 13,  3, -1],
                [-1,  9, 10,  7,  8, -1],
                [-1, 12,  1,  4,  1, -1],
                [-1, -1, -1, -1, -1, -1]]
            XCTAssertEqual(puzzle.grid.value, expected)
        }
        XCTContext.runActivity(named: "left, but not movable"){ _ in
            let initialGrid = [
                [-1, -1, -1, -1, -1, -1],
                [-1, 10,  3,  8, 14, -1],
                [-1,  7,  2, 11,  0, -1],
                [-1,  5,  6, 15, 12, -1],
                [-1,  9, 13,  1,  4, -1],
                [-1, -1, -1, -1, -1, -1]]
            var puzzle = Puzzle(size: 4)
            puzzle.emptyRow = 2
            puzzle.emptyCol = 4
            puzzle.grid.value = initialGrid
            puzzle.move(to: .left)
            let expected = [
                [-1, -1, -1, -1, -1, -1],
                [-1, 10,  3,  8, 14, -1],
                [-1,  7,  2, 11,  0, -1],
                [-1,  5,  6, 15, 12, -1],
                [-1,  9, 13,  1,  4, -1],
                [-1, -1, -1, -1, -1, -1]]
            XCTAssertEqual(puzzle.grid.value, expected)
        }
    }
    
    func testCompleted() throws {
        XCTContext.runActivity(named: "completed"){ _ in
            let puzzle = Puzzle(size: 4)
            XCTAssertTrue(puzzle.completed())
        }
        XCTContext.runActivity(named: "not completed"){ _ in
            var puzzle = Puzzle(size: 4)
            puzzle.move(to: .down)
            XCTAssertFalse(puzzle.completed())
        }
    }
}
