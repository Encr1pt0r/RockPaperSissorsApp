//
//  Game.swift
//  RockPaperSissors K1802797
//
//  Created by user185054 on 2/23/21.
//

import Foundation

class Game {
    var playerScore: Int
    var compScore: Int
    var roundNo: Int
    
    init() {
        playerScore = 0
        compScore = 0
        roundNo = 1
    }
    
    func check(player: Int, opponent: Int) -> Int {
        // Checks what was inputted into the game and returns a Int saying who won
        // 0 == player
        // 1 == draw
        // 2 == opponent
        // inputs are: 0 = rock, 1 = paper, 2 = sissors
        
        if player == opponent {
            return 1
        } else if player == 0 {
            if opponent == 2 {
                return 0
            } else {
                return 2
            }
        } else if player == 1 {
            if opponent == 2 {
                return 2
            } else {
                return 0
            }
        } else if player == 2 {
            if opponent == 0 {
                return 2
            } else {
                return 0
            }
        }
        return 1
    }
    
    func updateScore(whoWon: Int) -> Void {
        // Updates the score based on who won
        
        if whoWon == 0 {
            playerScore = playerScore + 1
        } else if whoWon == 2 {
            compScore = compScore + 1
        }
        setRound(newRound: getRound() + 1)
    }
    
    func calcuateMove() -> Int {
        // Returns a random number between 1..3 for the computer player
        return Int.random(in: 1...3)
    }
    
    func getPlayerScore() -> Int {
        return playerScore
    }
    
    func setPlayerScore(playerScore: Int) -> Void {
        self.playerScore = playerScore
    }
    
    func getCompScore() -> Int {
        return compScore
    }
    
    func setCompScore(compScore: Int) -> Void {
        self.compScore = compScore
    }
    
    func getRound() -> Int {
        return roundNo
    }
    
    func setRound(newRound: Int) -> Void {
        roundNo = newRound
    }
    
}
