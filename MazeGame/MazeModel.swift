//
//  MazeModel.swift
//  MazeGame
//
//  Created by Muna Aiman Al-hajj on 16/11/1445 AH.
//

import Foundation
import CoreGraphics
//
//struct Cell {
//    var isWall: Bool
//    var isStart: Bool = false
//    var isEnd: Bool = false
//}
//
//struct Maze {
//    var grid: [[Cell]]
//    var start: CGPoint
//    var end: CGPoint
//
//    init(rows: Int, columns: Int, start: CGPoint, end: CGPoint) {
//        self.start = start
//        self.end = end
//        grid = Array(repeating: Array(repeating: Cell(isWall: true), count: columns), count: rows)
//        grid[Int(start.x)][Int(start.y)].isStart = true
//        grid[Int(end.x)][Int(end.y)].isEnd = true
//    }
//}


struct Cell {
    var isWall: Bool
    var isStart: Bool = false
    var isEnd: Bool = false
}

struct Maze {
    var grid: [[Cell]]
    var start: CGPoint
    var end: CGPoint
}
