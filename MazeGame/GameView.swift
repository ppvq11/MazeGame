//
//  GameView.swift
//  MazeGame
//
//  Created by Muna Aiman Al-hajj on 16/11/1445 AH.
//

import SwiftUI

//struct GameView: View {
//    @State private var currentLevel = 1
//    @State private var maze: Maze = MazeLevels.level1
//    
//    var body: some View {
//        VStack {
//            Text("Level \(currentLevel)")
//                .font(.largeTitle)
//                .padding()
//
//            MazeView(maze: maze)
//                .padding()
//
//            Button("Next Level") {
//                loadNextLevel()
//            }
////            .disabled(!hasWon)  // Enable button only after winning
//        }
//    }
//    
//    private func loadNextLevel() {
//        currentLevel += 1
//        maze = MazeLevels.generateLevel(level: currentLevel)
//    }
//}
//
//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView()
//    }
//}


//struct GameView: View {
//    @State private var currentLevel = 1
//    @State private var maze: Maze
//
//    init() {
//        _maze = State(initialValue: MazeGenerator().generateMaze(level: 1))
//    }
//
//    var body: some View {
//        VStack {
//            Text("Level \(currentLevel)")
//                .font(.title)
//                .padding()
//
//            MazeView(maze: maze, onWin: {
//                self.loadNextLevel()
//            })
//                .padding()
//
//            Button("Next Level") {
//                loadNextLevel()
//            }
//        }
//    }
//
//    private func loadNextLevel() {
//        currentLevel += 1
//        maze = MazeGenerator().generateMaze(level: currentLevel)
//    }
//}
//
//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView()
//    }
//}


import SwiftUI

struct GameView: View {
    @State private var currentLevel = 1
    @State private var maze: Maze
    @State private var hasWon: Bool = false

    init() {
        _maze = State(initialValue: MazeGenerator().generateMaze(level: 1))
    }

    var body: some View {
        VStack {
            Text("Level \(currentLevel)")
                .font(.largeTitle)
                .padding()

            MazeView(maze: maze, onWin: {
                self.hasWon = true
            })
            .padding()

            Button("Next Level") {
                loadNextLevel()
            }
            .disabled(!hasWon)
        }
    }

    private func loadNextLevel() {
        currentLevel += 1
        maze = MazeGenerator().generateMaze(level: currentLevel)
        hasWon = false
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
