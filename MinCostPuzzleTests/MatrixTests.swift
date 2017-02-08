//
//  MatrixTests.swift
//  MinCostPuzzle
//
//  Created by Augustus on 08/02/17.
//  Copyright © 2017 NA. All rights reserved.
//

import XCTest
@testable import MinCostPuzzle

class MatrixTests: XCTestCase {
    
    func testForNonNilMatrix() {
        let inputValues = [[1,2,3,4,5],[4,5,6,7,8],[1,2,3,4,6]];
        let matrix = Matrix(inputCostValues: inputValues)
        XCTAssertNotNil(matrix.costValues)
    }
    
    func testForRowCount() {
        let inputValues = [[1,2,3,4,5],[4,5,6,7,8],[1,2,3,4,6]];
        let matrix = Matrix(inputCostValues: inputValues)
        XCTAssert(matrix.numberOfRows==3)
    }
    
    func testForColumnCount() {
        let inputValues = [[1,2,3,4,5],[4,5,6,7,8],[1,2,3,4,6]];
        let matrix = Matrix(inputCostValues: inputValues)
        XCTAssert(matrix.numberOfColumns==5)
    }
    
    func testForInputThroughMatrixUtilities() {
        let input = "1 20 3 4 5\n1 2 3 4 5\n2 3 4 1 4\n1 2 3 8 90"
        let validationResult = MatrixUtilities.parse(inputString: input, delimitedBy: ("\n"," "))
        let matrix = Matrix(inputCostValues: validationResult.costMatrix!)
        XCTAssertNotNil(matrix.costValues)
    }
    
    func testForColumnCounttThroughMatrixUtilities() {
        let input = "1 20 3 4 5\n1 2 3 4 5\n2 3 4 1 4\n1 2 3 8 90"
        let validationResult = MatrixUtilities.parse(inputString: input, delimitedBy: ("\n"," "))
        let matrix = Matrix(inputCostValues: validationResult.costMatrix!)
        XCTAssert(matrix.numberOfColumns == 5)
    }
    
    func testForRowCounttThroughMatrixUtilities() {
        let input = "1 20 3 4 5\n1 2 3 4 5\n2 3 4 1 4\n1 2 3 8 90"
        let validationResult = MatrixUtilities.parse(inputString: input, delimitedBy: ("\n"," "))
        let matrix = Matrix(inputCostValues: validationResult.costMatrix!)
        XCTAssert(matrix.numberOfColumns == 4)
    }

    
}
