//
//  NewGameViewController.swift
//  NIM
//
//  Created by Admin on 28/05/2019.
//  Copyright © 2019 Maxime Britto. All rights reserved.
//

import UIKit

class NewGameViewController: UIViewController {

    @IBOutlet weak var playerOneTextField: UITextField!
    @IBOutlet weak var playerTwoTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onNewGameClicked(_ sender: Any) {
        if let playerOne = playerOneTextField.text,
            let playerTwo = playerTwoTextField.text {
            UserDefaults.standard.setValue(playerOne, forKey: "PLAYER_ONE")
            UserDefaults.standard.setValue(playerTwo, forKey: "PLAYER_TWO")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
