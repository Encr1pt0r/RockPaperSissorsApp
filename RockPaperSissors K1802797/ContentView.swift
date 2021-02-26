//
//  ContentView.swift
//  RockPaperSissors K1802797
//
//  Created by user185054 on 2/23/21.
//

import SwiftUI

struct ContentView: View {
    
    var game = Game()
    // Scores and round are stored here
    
    let iconset = ["", "🗿", "📜", "✂️"]
    let messages = ["", "You win yay :)", "It's a draw!", "Sorry next time :("]
    // Prepared assets
    
    @State var player = ""
    @State var computer = ""
    @State var gamesState = ""
    @State var playerScore = 0
    @State var compScore = 0
    @State var round = 1
    // Whats shown on the screen
    
    var body: some View {
        
        VStack() {
            Text("Rock, Paper, Sissors")
                .font(.largeTitle)
                .padding(20.0)
            Text("Round: \(round)")
            Text("\(playerScore) : \(compScore)")
                .font(.largeTitle)
                .padding(50.0)
            
                
            HStack() {
                Text(player)
                    .font(.largeTitle)
                Text("vs")
                    .font(.largeTitle)
                Text(computer)
                    .font(.largeTitle)
            }
            .padding(100.0)
            
            // Game state label
            Text(gamesState)
                .padding()
            
            // Buttons for the input
            HStack(alignment: .bottom) {
                Button("Rock") {
                    player = iconset[1]
                    gameLogic(pInput: 0)
                }
                .padding()
                
                Button("Paper") {
                    player = iconset[2]
                    gameLogic(pInput: 1)
                }
                .padding()
                
                Button("Sissors") {
                    player = iconset[3]
                    gameLogic(pInput: 2)
                }
                .padding()
            }
            .padding()
        }
    }
    
    func gameLogic(pInput: Int) -> Void {
        // computer's moves are calculated and displayed
        let compInput = game.calcuateMove()
        computer = iconset[compInput]
        
        // Winner is calculated
        let winner = game.check(player: pInput, opponent: compInput - 1)
        gamesState = messages[winner + 1]
        
        // Score is updated
        game.updateScore(whoWon: winner)
        playerScore = game.getPlayerScore()
        compScore = game.getCompScore()
        round = game.getRound()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
