//
//  PathTest.swift
//  MinCostPuzzle
//
//  Created by Augustus on 08/02/17.
//  Copyright © 2017 NA. All rights reserved.
//

import XCTest
@testable import MinCostPuzzle

class PathTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testForNoTraversal(){
        let path = Path(columnsToTraverse: 4)
        XCTAssert(path.route.count == 0)
    }
    
    func testForSingleRouteTraversal(){
        let path = Path(columnsToTraverse: 4)
        path.appendRoute(row: 2, cellCost: 10, column: 1)
        XCTAssert(path.route.count == 1)
    }
    
    func testForMultipleRouteTraversal(){
        let path = Path(columnsToTraverse: 4)
        path.appendRoute(row: 2, cellCost: 10, column: 1)
        path.appendRoute(row: 4, cellCost: 20, column: 2)
        path.appendRoute(row: 5, cellCost: 10, column: 4)
        XCTAssert(path.route.count == 3)
    }
    
    func testForRoutePath(){
        let path = Path(columnsToTraverse: 4)
        path.appendRoute(row: 2, cellCost: 10, column: 1)
        path.appendRoute(row: 4, cellCost: 20, column: 2)
        path.appendRoute(row: 5, cellCost: 10, column: 4)
        XCTAssert(path.route == [2,4,5])
    }
    
    func testForTotalCostAfterAppend(){
        let path = Path(columnsToTraverse: 4)
        path.appendRoute(row: 2, cellCost: 10, column: 1)
        path.appendRoute(row: 4, cellCost: 20, column: 2)
        path.appendRoute(row: 5, cellCost: 10, column: 4)
        XCTAssert(path.cost == 40)
    }
    
    func testForLeastCostPathComparision() {
        let path = Path(columnsToTraverse: 4)
        path.appendRoute(row: 2, cellCost: 10, column: 1)
        path.appendRoute(row: 1, cellCost: 20, column: 2)
        path.appendRoute(row: 3, cellCost: 20, column: 2)

        let path2 = Path(columnsToTraverse: 4)
        path2.appendRoute(row: 1, cellCost: 1, column: 1)
        path2.appendRoute(row: 3, cellCost: 2, column: 3)
        path2.appendRoute(row: 2, cellCost: 5, column: 2)
        
        let paths = [path,path2]
        let sortedPaths = paths.sorted()
        XCTAssert(sortedPaths.first == path2)
    }
    
    
}
