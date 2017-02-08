//
//  Path.swift
//  MinCostPuzzle
//
//  Created by Augustus on 08/02/17.
//  Copyright © 2017 NA. All rights reserved.
//

import Foundation

// Model to store the Cost, route traversed.

class Path : Comparable {
    
    private(set) var cost = 0;
    private(set) var route = [Int]()
    private(set) var columns = [Int]()
    private(set) var totalColumnsToTraverse = 0
    
    var traveseredTillEnd:Bool {
        get {
            return (route.count == totalColumnsToTraverse)
        }
    }

    //Initializers
    init(columnsToTraverse:Int) {
        totalColumnsToTraverse = columnsToTraverse
    }
    
    //Used to create a copy of model
    init(withPath path:Path){
        cost = path.cost;
        totalColumnsToTraverse = path.totalColumnsToTraverse;

        for value in path.route {
            route.append(value)
        }
        
        for value in path.columns {
            columns.append(value)
        }
    }
    
    //Add traversed row to the route array and sum up the cost
    func appendRoute(row:Int,cellCost:Int,column:Int){
        route.append(row)
        columns.append(column)
        cost = cost + cellCost;
    }

    //Check for threshold cost limit
    func costExcedded() -> Bool {
        return cost > EXCEED_COST;
    }
    
    //Path comparison for least cost
    static func <(lhs:Path, rhs: Path) -> Bool {
        if (lhs.route.count != rhs.route.count){
            return lhs.route.count < rhs.route.count
        }
        return lhs.cost<rhs.cost
    }
    
    //Equatable comparison for least cost
    static func ==(lhs: Path, rhs: Path) -> Bool {
        return lhs.cost == rhs.cost &&  lhs.route.count == rhs.route.count
    }
    

}
