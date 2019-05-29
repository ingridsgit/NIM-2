//
//  ViewController.swift
//  NIM
//
//  Created by Maxime Britto on 28/05/2019.
//  Copyright © 2019 Maxime Britto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var ui_allMatches: [UIButton]!
    @IBOutlet weak var statusLabel: UILabel!
    var ui_matchesToRemove:[UIButton] = []
    var pickedMatches = 0
    var currentGame: NIMGame?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for match in ui_allMatches {
            match.setImage(nil, for: .disabled)
        }
        startNewGame()
    }

    @IBAction func matchTouched(_ sender: UIButton) {
        if let buttonPosition = ui_matchesToRemove.firstIndex(of: sender){
            ui_matchesToRemove.remove(at: buttonPosition)
            sender.isSelected = false
        } else {
            sender.isSelected = true
            ui_matchesToRemove.append(sender)
        }
    }
    
    @IBAction func onConfirmClicked(_ sender: UIButton) {
        if let currentGame = currentGame{
        switch currentGame.isOver {
        case true:
            sender.setTitle(NSLocalizedString("Confirm", comment: ""), for: .normal)
            dismiss(animated: true, completion: nil)
        default:
            
                if ui_matchesToRemove.count < 1 || ui_matchesToRemove.count > 3 {
                    let format = NSLocalizedString("%@, please pick 1 to %d matches.", comment: "current player's name")
                    statusLabel.text = String(format: format, currentGame.currentPlayer.name, currentGame.maxMatchesAllowedPerTurn)
                } else {
                    for match in ui_matchesToRemove {
                        match.isEnabled = false
                        match.alpha = 0
                    }
                    currentGame.removeMatches(selectedMatches: ui_matchesToRemove.count)
                    ui_matchesToRemove.removeAll()
                    if currentGame.isOver {
                        let format = NSLocalizedString("%@, you won. \n%@ : %d points \n%@ : %d points", comment: "Current's player name - Player 1's name - Player 1's points - Player 2's name - Player 2's points")
                        statusLabel.text = String(format: format, currentGame.currentPlayer.name, currentGame.player1.name, currentGame.player1.points, currentGame.player2.name, currentGame.player2.points)
                        sender.setTitle(NSLocalizedString("Play again", comment: ""), for: .normal)
                    } else {
                        updateStatusLabel()
                    }
                }
            }
            
        }
        
    }
    
    
    
    func updateStatusLabel(){
        if let currentGame = currentGame{
            let format = NSLocalizedString("It's %@'s turn to play", comment: "Current's player name ")
        statusLabel.text = String(format: format, currentGame.currentPlayer.name)
        }
        
    }
    
    func startNewGame() {
        if let nameOne = UserDefaults.standard.string(forKey: "PLAYER_ONE"),
            let nameTwo = UserDefaults.standard.string(forKey: "PLAYER_TWO"){
            let playerOne = Player(name: nameOne)
            let playerTwo = Player(name: nameTwo)
            currentGame = NIMGame(player1: playerOne, player2: playerTwo)
        }
        updateStatusLabel()
        for matchButton in ui_allMatches {
            matchButton.isSelected = false
            matchButton.isEnabled = true
            matchButton.alpha = 1
        }
    }
}

