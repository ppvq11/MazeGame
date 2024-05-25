//
//  MazeGenerator.swift
//  MazeGame
//
//  Created by Muna Aiman Al-hajj on 16/11/1445 AH.
//
import CoreGraphics

//class MazeGenerator {
//    func generateMaze(rows: Int, columns: Int, start: CGPoint, end: CGPoint) -> Maze {
//        var maze = Maze( grid: [], start: start, end: end)
//        generate(from: start, in: &maze)
//        return maze
//    }
//
//    private func generate(from point: CGPoint, in maze: inout Maze) {
//        let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)].shuffled()
//        let x = Int(point.x)
//        let y = Int(point.y)
//        maze.grid[x][y].isWall = false
//
//        for (dx, dy) in directions {
//            let newX = x + dx
//            let newY = y + dy
//            if withinBounds(x: newX, y: newY, in: maze) && maze.grid[newX][newY].isWall {
//                generate(from: CGPoint(x: newX, y: newY), in: &maze)
//            }
//        }
//    }
//
//    private func withinBounds(x: Int, y: Int, in maze: Maze) -> Bool {
//        return x >= 0 && y >= 0 && x < maze.grid.count && y < maze.grid[x].count
//    }
//}




//class MazeGenerator {
//    func generateMaze(level: Int) -> Maze {
//        let size = 10 + level * 2  // Increase size with each level
//        var grid = Array(repeating: Array(repeating: Cell(isWall: true), count: size), count: size)
//
//        // Example maze generation logic
//        for i in 1..<size-1 {
//            for j in 1..<size-1 {
//                grid[i][j].isWall = (i + j) % 4 != 0  // Simple pattern for demonstration
//            }
//        }
//
//        let start = CGPoint(x: 1, y: 1)
//        let end = CGPoint(x: size - 2, y: size - 2)
//        grid[Int(start.x)][Int(start.y)] = Cell(isWall: false, isStart: true, isEnd: false)
//        grid[Int(end.x)][Int(end.y)] = Cell(isWall: false, isStart: false, isEnd: true)
//
//        return Maze(grid: grid, start: start, end: end)
//    }
//}



class MazeGenerator {
    func generateMaze(level: Int) -> Maze {
        let size = 10 + level * 5  // Increase size and complexity with each level
        var grid = Array(repeating: Array(repeating: Cell(isWall: true), count: size), count: size)
        var stack = [CGPoint]()
        let start = CGPoint(x: 1, y: 1)
        var current = start

        // Start path with the initial position
        grid[Int(start.x)][Int(start.y)].isWall = false
        stack.append(start)

        while !stack.isEmpty {
            let currentPos = stack.last!
            let neighbors = getNeighbors(pos: currentPos, grid: grid)

            if !neighbors.isEmpty {
                let nextPos = neighbors.randomElement()!
                // Remove the wall between current and next
                removeWall(current: currentPos, next: nextPos, grid: &grid)
                // Move to next cell
                grid[Int(nextPos.x)][Int(nextPos.y)].isWall = false
                stack.append(nextPos)
            } else {
                stack.removeLast()
            }
        }

        let end = CGPoint(x: size - 2, y: size - 2)  // Set a fixed end point for simplicity
        return Maze(grid: grid, start: start, end: end)
    }

    private func getNeighbors(pos: CGPoint, grid: [[Cell]]) -> [CGPoint] {
        let directions = [(2, 0), (-2, 0), (0, 2), (0, -2)]
        var neighbors = [CGPoint]()

        directions.forEach { (dx, dy) in
            let nx = Int(pos.x) + dx
            let ny = Int(pos.y) + dy

            if nx > 0 && nx < grid.count && ny > 0 && ny < grid[0].count && grid[nx][ny].isWall {
                neighbors.append(CGPoint(x: nx, y: ny))
            }
        }

        return neighbors
    }

    private func removeWall(current: CGPoint, next: CGPoint, grid: inout [[Cell]]) {
        let wallX = Int((current.x + next.x) / 2)
        let wallY = Int((current.y + next.y) / 2)
        grid[wallX][wallY].isWall = false
    }
}
