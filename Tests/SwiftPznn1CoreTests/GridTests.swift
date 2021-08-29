import XCTest
@testable import SwiftPznn1Core

final class GridTests: XCTestCase {
    func testEquals() throws {
        XCTContext.runActivity(named: "equal"){ _ in
            let array = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,0]]
            let grid1 = Grid(value: array)
            let grid2 = Grid(value: array)
            XCTAssertTrue(grid1 == grid2)
        }
        XCTContext.runActivity(named: "not equal"){ _ in
            let array1 = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,0]]
            let array2 = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,15,14,0]]
            let grid1 = Grid(value: array1)
            let grid2 = Grid(value: array2)
            XCTAssertFalse(grid1 == grid2)
        }
    }
}
