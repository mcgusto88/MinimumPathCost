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
    
    //Sample 1: (6X5 matrix normal flow)
    func testForSampleSet1() {
        let input = "3 4 1 2 8 6\n6 1 8 2 7 4\n5 9 3 9 9 5\n8 4 1 3 2 6\n3 7 2 8 6 4";
        let expectedPath = [1,2,3,4,4,5]
        
        let validationResult = MatrixUtilities.parse(inputString: input, delimitedBy: ("\n"," "))
        let matrix = Matrix(inputCostValues: validationResult.costMatrix!)
        let matrixHanlder = MatrixHandler(with: matrix)
        let path = matrixHanlder.getlowestCostPathForMatrix()
        
        XCTAssertTrue(path.traveseredTillEnd)
        XCTAssertTrue(path.cost==16)
        print(path.route)
        XCTAssertTrue(path.route==expectedPath)
    }
    
    //Sample 2: (6X5 matrix normal flow)
    func testForSampleSet2() {
        let input = "3 4 1 2 8 6\n6 1 8 2 7 4\n5 9 3 9 9 5\n8 4 1 3 2 6\n3 7 2 1 2 3";
        let expectedPath = [1,2,1,5,4,5]
        
        let validationResult = MatrixUtilities.parse(inputString: input, delimitedBy: ("\n"," "))
        let matrix = Matrix(inputCostValues: validationResult.costMatrix!)
        let matrixHanlder = MatrixHandler(with: matrix)
        let path = matrixHanlder.getlowestCostPathForMatrix()
        
        XCTAssertTrue(path.traveseredTillEnd)
        XCTAssertTrue(path.cost==11)
        XCTAssertTrue(path.route==expectedPath)
    }
    
    //Sample 3: (5X3 matrix with no path <50)
    func testForSampleSet3() {
        let inputCost = "19 10 19 10 19\n21 23 20 19 12\n20 12 20 11 10";
        let expectedPath = [1,1,1]
        
        let validationResult = MatrixUtilities.parse(inputString: inputCost, delimitedBy: ("\n"," "))
        let matrix = Matrix(inputCostValues: validationResult.costMatrix!)
        let matrixHanlder = MatrixHandler(with: matrix)
        let path = matrixHanlder.getlowestCostPathForMatrix()
        
        XCTAssertFalse(path.traveseredTillEnd)
        XCTAssertTrue(path.cost==48)
        XCTAssertTrue(path.route==expectedPath)
    }
    
    //Sample 4: (1X5 matrix)
    func testForSampleSet4() {
        let inputCost = "5 8 5 3 5"
        let expectedPath = [1,1,1,1,1]
        
        let validationResult = MatrixUtilities.parse(inputString: inputCost, delimitedBy: ("\n"," "))
        let matrix = Matrix(inputCostValues: validationResult.costMatrix!)
        let matrixHanlder = MatrixHandler(with: matrix)
        let path = matrixHanlder.getlowestCostPathForMatrix()
        
        XCTAssertTrue(path.traveseredTillEnd)
        XCTAssertTrue(path.cost==26)
        XCTAssertTrue(path.route==expectedPath)
    }
    
    //Sample 5: (5X1 matrix)
    func testForSampleSet5() {
        let inputCost = "5\n8\n5\n3\n5";
        let expectedPath = [4]
        
        let validationResult = MatrixUtilities.parse(inputString: inputCost, delimitedBy: ("\n"," "))
        let matrix = Matrix(inputCostValues: validationResult.costMatrix!)
        let matrixHanlder = MatrixHandler(with: matrix)
        let path = matrixHanlder.getlowestCostPathForMatrix()
        
        XCTAssertTrue(path.traveseredTillEnd)
        XCTAssertTrue(path.cost==3)
        XCTAssertTrue(path.route==expectedPath)
    }
    
    //Sample 8: (Starting with >50)
    func testForSampleSet8() {
        let inputCost = "69 10 19 10 19\n51 23 20 19 12\n60 12 20 11 10"
        let expectedPath:[Int] = []
        
        let validationResult = MatrixUtilities.parse(inputString: inputCost, delimitedBy: ("\n"," "))
        let matrix = Matrix(inputCostValues: validationResult.costMatrix!)
        let matrixHanlder = MatrixHandler(with: matrix)
        let path = matrixHanlder.getlowestCostPathForMatrix()
        
        XCTAssertFalse(path.traveseredTillEnd)
        XCTAssertTrue(path.cost==0)
        XCTAssertTrue(path.route == expectedPath)
    }
    
    //Sample 9: (One value >50)
    func testForSampleSet9() {
        let inputCost = "60 3 3 6\n6 3 7 9\n5 6 8 3"
        let expectedPath:[Int] = [3,2,1,3]
        
        let validationResult = MatrixUtilities.parse(inputString: inputCost, delimitedBy: ("\n"," "))
        let matrix = Matrix(inputCostValues: validationResult.costMatrix!)
        let matrixHanlder = MatrixHandler(with: matrix)
        let path = matrixHanlder.getlowestCostPathForMatrix()
        
        XCTAssertTrue(path.traveseredTillEnd)
        XCTAssertTrue(path.cost==14)
        XCTAssertTrue(path.route == expectedPath)
    }
    
    //Sample 10: (Negative values)
    func testForSampleSet10() {
        let inputCost = "6 3 -5 9\n-5 2 4 10\n3 -2 6 10\n6 -1 -2 10"
        let expectedPath:[Int] = [2,3,4,1]
        
        let validationResult = MatrixUtilities.parse(inputString: inputCost, delimitedBy: ("\n"," "))
        let matrix = Matrix(inputCostValues: validationResult.costMatrix!)
        let matrixHanlder = MatrixHandler(with: matrix)
        let path = matrixHanlder.getlowestCostPathForMatrix()
        
        XCTAssertTrue(path.traveseredTillEnd)
        XCTAssertTrue(path.cost==0)
        XCTAssertTrue(path.route == expectedPath)
    }
    
    
    
}
