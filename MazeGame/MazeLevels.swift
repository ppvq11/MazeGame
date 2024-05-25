//
//  MazeLevels.swift
//  MazeGame
//
//  Created by Muna Aiman Al-hajj on 16/11/1445 AH.
//

import SwiftUI

//struct MazeLevels {
//    static let level1: Maze = {
//        let start = CGPoint(x: 1, y: 1)
//        let end = CGPoint(x: 8, y: 8)
//        let generator = MazeGenerator()
//        return generator.generateMaze(rows: 10, columns: 10, start: start, end: end)
//    }()
//
//    static func generateLevel(level: Int) -> Maze {
//        let rows = 10 + level * 2
//        let columns = 10 + level * 2
//        let start = CGPoint(x: 1, y: 1)
//        let end = CGPoint(x: rows - 2, y: columns - 2)
//        return MazeGenerator().generateMaze(rows: rows, columns: columns, start: start, end: end)
//    }
//}


struct MazeLevels {
    static let level1: Maze = {
        var grid = [
            [1, 1, 1, 1, 1, 1],
            [1, 0, 0, 0, 1, 1],
            [1, 0, 1, 0, 0, 1],
            [1, 0, 1, 1, 0, 1],
            [1, 0, 0, 0, 0, 1],
            [1, 1, 1, 1, 1, 1]
        ].map { row in row.map { Cell(isWall: $0 == 1) } }
        
        let start = CGPoint(x: 1, y: 1)
        let end = CGPoint(x: 4, y: 4)
        grid[Int(start.x)][Int(start.y)].isStart = true
        grid[Int(end.x)][Int(end.y)].isEnd = true
        
        return Maze(grid: grid, start: start, end: end)
    }()
}
