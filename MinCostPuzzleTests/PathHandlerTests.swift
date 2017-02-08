//
//  PathHandlerTests.swift
//  MinCostPuzzle
//
//  Created by Augustus on 08/02/17.
//  Copyright © 2017 NA. All rights reserved.
//

import XCTest
@testable import MinCostPuzzle

class PathHandlerTests: XCTestCase {
    
    func testForSingleLeastCostPathComparision(){
        
        var pathHandler = PathHandler()
        let path = Path(columnsToTraverse: 2)
        path.appendRoute(row: 2, cellCost: 10, column: 1)
        path.appendRoute(row: 1, cellCost: 20, column: 2)
        pathHandler.addPath(pathTraversed:path)
        XCTAssertTrue(pathHandler.leastCostPath?.cost == 30)
    }
    
    func testForLeastCostPathComparisionWithMultilplePaths(){
        
        var pathHandler = PathHandler()
        let path = Path(columnsToTraverse: 3)
        path.appendRoute(row: 2, cellCost: 1, column: 1)
        path.appendRoute(row: 1, cellCost: 9, column: 2)
        path.appendRoute(row: 0, cellCost: 8, column: 2)
        pathHandler.addPath(pathTraversed:path)

        let path2 = Path(columnsToTraverse: 3)
        path2.appendRoute(row: 1, cellCost: 4, column: 2)
        path2.appendRoute(row: 2, cellCost: 1, column: 3)
        path2.appendRoute(row: 1, cellCost: 2, column: 2)
        pathHandler.addPath(pathTraversed:path2)

        let path3 = Path(columnsToTraverse: 3)
        path3.appendRoute(row: 3, cellCost: 4, column: 2)
        path3.appendRoute(row: 2, cellCost: 6, column: 3)
        path3.appendRoute(row: 2, cellCost: 2, column: 2)
        pathHandler.addPath(pathTraversed:path3)
        
        //path2 - >4 1 2
        XCTAssertTrue(pathHandler.leastCostPath?.cost == 7)
    }

}
