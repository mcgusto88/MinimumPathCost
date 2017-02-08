//
//  MatrixUtilities.swift
//  MinCostPuzzle
//
//  Created by Augustus on 08/02/17.
//  Copyright © 2017 NA. All rights reserved.
//

import Foundation

// Validate the input for blank input, Non-Numeric inputs, incorrect spacings, incorrect matrix, uneven columns

class MatrixUtilities {
    
    static func parse(inputString:String, delimitedBy delimitors:(row:String,column:String)) -> (costMatrix:[[Int]]?,success:Bool,error:String) {
        var costInputMatrix = [[Int]]()
        let costInputRows = inputString.components(separatedBy: delimitors.row)
        var columnCount = 0;
        var rowCount = 0;
    
        // Loop through the rows delimited by (\n) new line character
        for row in costInputRows {
            let trimmedRow = row.trimmingCharacters(in: .whitespaces)
            // Check for blank input
            if(rowCount==0 && trimmedRow.isEmpty){
                return(nil,false,"Please enter input")
            }
            rowCount = rowCount + 1;
            
            // Parse the row for Columns delimited by space (" ")
            let columns = trimmedRow.components(separatedBy: delimitors.column)
            let currentRowColumnCount = columns.count;
            
            // Check for uneven columns except the first row
            if (columnCount>0 && currentRowColumnCount>0 && currentRowColumnCount != columnCount) {
                return(nil,false,"Improper Matrix.\n Incorrect columns at row \(rowCount).\nPlease check for spacings")
            }
            
            columnCount = currentRowColumnCount;
            
            // Proceed only if we have columns to process
            if columns.count > 0 {
                var columnMatrix = [Int]()
                for column in columns {
                    // Check for non-numeric characters
                    if let convertedInt = Int(column) {
                        
                        // Group all the columns together
                        columnMatrix.append(convertedInt)
                    } else {
                        return(nil,false,"Improper Matrix.\n Non-numeric characters at row \(rowCount)")
                    }
                }
                
                // Add the grouped columns for rows
                costInputMatrix.append(columnMatrix)
            }
        }
        
        //Validation success
        return (costInputMatrix,true,"Proper Matrix")
    }
    
}
