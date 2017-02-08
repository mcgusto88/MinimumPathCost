//
//  MatrixHandler.swift
//  MinCostPuzzle
//
//  Created by Augustus on 08/02/17.
//  Copyright © 2017 NA. All rights reserved.
//

import Foundation

// Traverses the entire matrix row by row and sends the traversed path to pathhandler class for least path comparison

class MatrixHandler{
    
    private var costMatrix:Matrix!
    private var pathHandler:PathHandler
    
    //Initializer
    init(with matrix:Matrix) {
        costMatrix = matrix
        pathHandler = PathHandler()
    }
    
    // Loops through all rows for traversed path and groups the paths for least path comparison
    func getlowestCostPathForMatrix() -> Path {
        var allPaths = [Path]()
        for row in 0..<costMatrix.numberOfRows {
            let lowestPath =  getLowestCostPath(for: row)
            allPaths.append(lowestPath)
        }
        
        //Path Comparison
        allPaths.sort()
        return allPaths.first!
    }
    
    //Construct a path to traverse for the particular row
    func getLowestCostPath(for row:Int) -> Path {
        let currentPath =  Path(columnsToTraverse: (costMatrix?.numberOfColumns)!);
        traversePathFor(row: row, path: currentPath);
        return pathHandler.leastCostPath!;
    }
    
    //Check for all the adjacent rows path
    //Adds to the path to PathHandler to process the traversed path with the existing path in memory for least cost comparison
    private func traversePathFor(row:Int, path:Path) {
        
        //Check to see if we are good for next iteration or if the path has traversed all the columns
        if (proceedForNextIteration(for: row, inPath: path)) {
            let nextColumn = path.route.count;
            path.appendRoute(row: row+1, cellCost: costMatrix.costValues![row][nextColumn],column: nextColumn)
        }
        
        //Construct the row details of cell edges
        
        // First and last row are also adjacent.
        if(row < 0) || (row >= costMatrix.numberOfRows){
            return
        }
        var upRow = row - 1
        if (row == 0){
            upRow = costMatrix.numberOfRows-1
        }
        var nextPathsRows = [upRow,row]
        
        //If last row, proceed to the first row
        if(row+1 < costMatrix.numberOfRows){
            nextPathsRows.append(row+1)
        }else{
            nextPathsRows.append(0)
        }
        
        var pathExists = false;
        
        //Loops through all the cell edges recursively until it reaches all the columns or until it exceeds threshold limit
        for nextRow in nextPathsRows{
            if(proceedForNextIteration(for: nextRow, inPath: path)){
                let tempPath = Path(withPath: path)
                //Recursive call for cell edge
                traversePathFor(row: nextRow, path: tempPath);
            }
                //Max traverse path is reached, add it to the pathhandler for cost comparison
            else if(!pathExists){
                pathHandler.addPath(pathTraversed: path)
                pathExists = true
            }
        }
    }
    
    //Check if path has traversed all the columns or if cost has exceeded the threshold limit
    private func proceedForNextIteration(for row:Int, inPath path:Path)->Bool{
        
        //First check if it is END of the path before going for nextColumn cost calculation
        if (path.traveseredTillEnd){
            return false;
        }
        
        let nextColumn = path.route.count;
        let nextPathCost = path.cost + (costMatrix.costValues![row][nextColumn])
        if (nextPathCost>EXCEED_COST) {
            return false
        }
        return true
    }
    
}
