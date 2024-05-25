//
//  MazeView.swift
//  MazeGame
//
//  Created by Muna Aiman Al-hajj on 16/11/1445 AH.
//

import SwiftUI


//struct MazeView: View {
//    let maze: Maze
//    @State private var playerPosition: CGPoint
//    @State private var hasWon: Bool = false
//
//    init(maze: Maze) {
//        self.maze = maze
//        _playerPosition = State(initialValue: maze.start)
//    }
//
//    var body: some View {
//        VStack {
//            if hasWon {
//                Text("Congratulations! You've reached the end!")
//                    .foregroundColor(.green)
//                    .padding()
//            }
//
//            // Maze grid
//            ForEach(0..<maze.grid.count, id: \.self) { row in
//                HStack {
//                    ForEach(0..<maze.grid[row].count, id: \.self) { column in
//                        Rectangle()
//                            .fill(cellColor(row: row, column: column))
//                            .frame(width: 30, height: 30)
//                            .border(Color.gray, width: 1)
//                    }
//                }
//            }
//
//            // Movement buttons
//            controlButtons()
//        }
//    }
//
//    private func cellColor(row: Int, column: Int) -> Color {
//        let position = CGPoint(x: row, y: column)
//        if position == playerPosition {
//            return .blue
//        } else if maze.grid[row][column].isStart {
//            return .green
//        } else if maze.grid[row][column].isEnd {
//            return .red
//        } else if maze.grid[row][column].isWall {
//            return .black
//        } else {
//            return .white
//        }
//    }
//
//    private func movePlayer(to position: CGPoint) {
//        let x = Int(position.x)
//        let y = Int(position.y)
//        if x >= 0 && y >= 0 && x < maze.grid.count && y < maze.grid[y].count && !maze.grid[x][y].isWall {
//            playerPosition = position
//            if position == maze.end {
//                hasWon = true
//            }
//        }
//    }
//
//    private func controlButtons() -> some View {
//        VStack {
//            Button("Up") {
//                movePlayer(dx: 0, dy: -1)
//            }
//            HStack {
//                Button("Left") {
//                    movePlayer(dx: -1, dy: 0)
//                }
//                Button("Right") {
//                    movePlayer(dx: 1, dy: 0)
//                }
//            }
//            Button("Down") {
//                movePlayer(dx: 0, dy: 1)
//            }
//        }
//    }
//
//    private func movePlayer(dx: Int, dy: Int) {
//        let newX = Int(playerPosition.x) + dx
//        let newY = Int(playerPosition.y) + dy
//        let newPosition = CGPoint(x: newX, y: newY)
//        if withinBounds(position: newPosition) && !maze.grid[newX][newY].isWall {
//            playerPosition = newPosition
//            if newPosition == maze.end {
//                hasWon = true
//            }
//        }
//    }
//
//    private func withinBounds(position: CGPoint) -> Bool {
//        let x = Int(position.x)
//        let y = Int(position.y)
//        return x >= 0 && y >= 0 && x < maze.grid.count && y < maze.grid[x].count
//    }
//}


//
//import SwiftUI
//
//struct MazeView: View {
//    let maze: Maze
//    @State private var playerPosition: CGPoint
//    var onWin: () -> Void
//
//    init(maze: Maze, onWin: @escaping () -> Void) {
//        self.maze = maze
//        _playerPosition = State(initialValue: maze.start)
//        self.onWin = onWin
//    }
//
//    var body: some View {
//        ScrollView(.vertical, showsIndicators: true) {
//            ScrollView(.horizontal, showsIndicators: true) {
//                VStack {
//                    ForEach(0..<maze.grid.count, id: \.self) { row in
//                        HStack {
//                            ForEach(0..<maze.grid[row].count, id: \.self) { column in
//                                Rectangle()
//                                    .fill(self.cellColor(row: row, column: column))
//                                    .frame(width: 30, height: 30)
//                                    .onTapGesture {
//                                        self.movePlayer(to: CGPoint(x: row, y: column))
//                                    }
//                            }
//                        }
//                    }
//                }
//                .padding()
//            }
//        }
//    }
//
//    private func cellColor(row: Int, column: Int) -> Color {
//        let position = CGPoint(x: row, y: column)
//        if position == playerPosition {
//            return .blue
//        } else if maze.grid[row][column].isStart {
//            return .green
//        } else if maze.grid[row][column].isEnd {
//            return .red
//        } else if maze.grid[row][column].isWall {
//            return .black
//        } else {
//            return .white
//        }
//    }
//
//    private func movePlayer(to position: CGPoint) {
//        let x = Int(position.x)
//        let y = Int(position.y)
//        if x >= 0 && y >= 0 && x < maze.grid.count && y < maze.grid[x].count {
//            if !maze.grid[x][y].isWall {
//                playerPosition = position
//                if maze.grid[x][y].isEnd {
//                    onWin()
//                }
//            }
//        }
//    }
//}




struct MazeView: View {
    let maze: Maze
    @State private var playerPosition: CGPoint
    var onWin: () -> Void  // Closure to execute when the player wins

    init(maze: Maze, onWin: @escaping () -> Void) {
        self.maze = maze
        self.onWin = onWin
        _playerPosition = State(initialValue: maze.start)
    }

    var body: some View {
        ScrollView([.horizontal, .vertical], showsIndicators: true) {
            VStack(spacing: 0) {
                ForEach(0..<maze.grid.count, id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<maze.grid[row].count, id: \.self) { column in
                            Rectangle()
                                .fill(self.cellColor(row: row, column: column))
                                .frame(width: 30, height: 30)
                                .onTapGesture {
                                    let newPosition = CGPoint(x: row, y: column)
                                    movePlayer(to: newPosition)
                                }
                        }
                    }
                }
            }
        }
    }

    private func cellColor(row: Int, column: Int) -> Color {
        let position = CGPoint(x: row, y: column)
        if position == playerPosition {
            return .blue
        } else if maze.grid[row][column].isStart {
            return .green
        } else if maze.grid[row][column].isEnd {
            return .red
        } else if maze.grid[row][column].isWall {
            return .black
        } else {
            return .white
        }
    }

    private func movePlayer(to position: CGPoint) {
        let x = Int(position.x)
        let y = Int(position.y)
        if x >= 0 && y >= 0 && x < maze.grid.count && y < maze.grid[x].count && !maze.grid[x][y].isWall {
            playerPosition = position
            if maze.grid[x][y].isEnd {
                onWin()
            }
        }
    }
}
