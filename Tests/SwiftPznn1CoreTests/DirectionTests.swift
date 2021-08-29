import XCTest
@testable import SwiftPznn1Core

final class DirectionTests: XCTestCase {
    func testAllDirections() throws {
        let expected: [Direction.V] = [.up, .right, .down, .left]
        let result = Direction.allDirections()
        XCTAssertEqual(result, expected)
    }
    
    func testOppositeDirection() throws {
        XCTContext.runActivity(named: "down for up"){ _ in
            let expected = Direction.V.down
            let result = Direction.oppositeDirection(of: .up)
            XCTAssertEqual(result, expected)
        }
        XCTContext.runActivity(named: "left for right") {_ in
            let expected = Direction.V.left
            let result = Direction.oppositeDirection(of: .right)
            XCTAssertEqual(result, expected)
        }
        XCTContext.runActivity(named: "up for down") {_ in
            let expected = Direction.V.up
            let result = Direction.oppositeDirection(of: .down)
            XCTAssertEqual(result, expected)
        }
        XCTContext.runActivity(named: "right for left") {_ in
            let expected = Direction.V.right
            let result = Direction.oppositeDirection(of: .left)
            XCTAssertEqual(result, expected)
        }
        XCTContext.runActivity(named: "nowhere for nowhere") {_ in
            let expected = Direction.V.nowhere
            let result = Direction.oppositeDirection(of: .nowhere)
            XCTAssertEqual(result, expected)
        }
    }
}
