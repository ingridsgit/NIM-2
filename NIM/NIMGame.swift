//
//  NIMGame.swift
//  NIM
//
//  Created by Admin on 28/05/2019.
//  Copyright © 2019 Maxime Britto. All rights reserved.
//

import Foundation

class NIMGame {
    
    let player1: Player
    let player2: Player
    var matchCount = 20
    var currentPlayer: Player
    var isOver = false
    var maxMatchesAllowedPerTurn: Int {
        return min(matchCount, 3)
    }
    
    
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
        currentPlayer = player1
    }
    
    private func switchPlayers(){
        if currentPlayer.id == player1.id {
            currentPlayer = player2
        } else if currentPlayer.id == player2.id{
            currentPlayer = player1
        }
    }
    
    func removeMatches(selectedMatches: Int){
        if selectedMatches > 1 || selectedMatches <= maxMatchesAllowedPerTurn {
            matchCount = matchCount - selectedMatches
            if matchCount == 0 {
                currentPlayer.lose()
                switchPlayers()
                currentPlayer.win()
                isOver = true
            } else{
                switchPlayers()
            }
            
        }
    }

    
}
