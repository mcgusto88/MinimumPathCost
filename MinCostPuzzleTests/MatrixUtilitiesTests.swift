//
//  MatrixUtilitiesTests.swift
//  MinCostPuzzle
//
//  Created by Augustus on 08/02/17.
//  Copyright © 2017 NA. All rights reserved.
//

import XCTest
@testable import MinCostPuzzle

class MatrixUtilitiesTests: XCTestCase {
    
    func testForNonNumericInputCharacters() {
        let input = "1 a c\n2 3 4"
        let validationResult = MatrixUtilities.parse(inputString: input, delimitedBy: ("\n"," "))
        XCTAssertFalse(validationResult.success)
    }
    
    func testForEmptyInput() {
        let input = " "
        let validationResult = MatrixUtilities.parse(inputString: input, delimitedBy: ("\n"," "))
        XCTAssertFalse(validationResult.success)
    }
    
    func testForIncorrectColumns() {
        let input = "1 2 3 4 5\n1 2 3 4 5 6"
        let validationResult = MatrixUtilities.parse(inputString: input, delimitedBy: ("\n"," "))
        XCTAssertFalse(validationResult.success)
    }
    
    func testForSingleRowInput() {
        let input = "1 2 3 4 5"
        let validationResult = MatrixUtilities.parse(inputString: input, delimitedBy: ("\n"," "))
        XCTAssertTrue(validationResult.success)
    }
    
    func testForIncorrectSpacings() {
        let input = "1 2 3 4 5\n1 2 3 4  5"
        let validationResult = MatrixUtilities.parse(inputString: input, delimitedBy: ("\n"," "))
        XCTAssertFalse(validationResult.success)
    }
    
    func testForNonNilMatrix() {
        let input = "1 20 3 4 5\n1 2 3 4 5\n2 3 4 1 4\n1 2 3 8 90"
        let validationResult = MatrixUtilities.parse(inputString: input, delimitedBy: ("\n"," "))
        XCTAssertNotNil(validationResult.costMatrix)
    }
    
    func testForNilMatrix() {
        let input = "1 20 3 4 5\n1 2"
        let validationResult = MatrixUtilities.parse(inputString: input, delimitedBy: ("\n"," "))
        XCTAssertNil(validationResult.costMatrix)
    }
    
    func testForFailureRowCount() {
        let input = "1 20 3 4 5\n1 2 3 1 2\n2 4 1 3 1\n1 24 1 8 9"
        let validationResult = MatrixUtilities.parse(inputString: input, delimitedBy: ("\n"," "))
        XCTAssert(validationResult.costMatrix?.count != 2)
    }
    
    func testForCorrectRowCount() {
        let input = "1 20 3 4 5\n1 2 3 1 2\n2 4 1 3 1\n1 24 1 8 9"
        let validationResult = MatrixUtilities.parse(inputString: input, delimitedBy: ("\n"," "))
        XCTAssert(validationResult.costMatrix?.count == 4)
    }

    
}
