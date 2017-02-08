//
//  MatrixHandlerTests.swift
//  MinCostPuzzle
//
//  Created by Augustus on 08/02/17.
//  Copyright © 2017 NA. All rights reserved.
//

import XCTest
@testable import MinCostPuzzle

class MatrixHandlerTests: XCTestCase {
    
    func testForSampleSet1() {
        let input = "3 4 1 2 8 6\n6 1 8 2 7 4\n5 9 3 9 9 5\n8 4 1 3 2 6\n3 7 2 8 6 4";
        let expectedPath = [0,1,2,3,3,4]
        
        let validationResult = MatrixUtilities.parse(inputString: input, delimitedBy: ("\n"," "))
        let matrix = Matrix(inputCostValues: validationResult.costMatrix!)
        let matrixHanlder = MatrixHandler(with: matrix)
        let path = matrixHanlder.getlowestCostPathForMatrix()
        
        XCTAssertTrue(path.traveseredTillEnd)
        XCTAssertTrue(path.cost==16)
        XCTAssertTrue(path.route==expectedPath)        
    }
    
    func testForSampleSet2() {
        let input = "3 4 1 2 8 6\n6 1 8 2 7 4\n5 9 3 9 9 5\n8 4 1 3 2 6\n3 7 2 1 2 3";
        let expectedPath = [0,1,0,4,3,4]
        
        let validationResult = MatrixUtilities.parse(inputString: input, delimitedBy: ("\n"," "))
        let matrix = Matrix(inputCostValues: validationResult.costMatrix!)
        let matrixHanlder = MatrixHandler(with: matrix)
        let path = matrixHanlder.getlowestCostPathForMatrix()
        
        XCTAssertTrue(path.traveseredTillEnd)
        XCTAssertTrue(path.cost==11)
        XCTAssertTrue(path.route==expectedPath)
    }
    
    func testForSampleSet3() {
        let inputCost = "1 2 3 4 5\n9 3 7 5 6\n4 1 2 2 5\n3 2 1 2 3";
        let expectedPath = [0,3,3,2,3]

        let validationResult = MatrixUtilities.parse(inputString: inputCost, delimitedBy: ("\n"," "))
        let matrix = Matrix(inputCostValues: validationResult.costMatrix!)
        let matrixHanlder = MatrixHandler(with: matrix)
        let path = matrixHanlder.getlowestCostPathForMatrix()
        
        XCTAssertTrue(path.traveseredTillEnd)
        XCTAssertTrue(path.cost==9)
        XCTAssertTrue(path.route==expectedPath)
    }

    


    
    
}
