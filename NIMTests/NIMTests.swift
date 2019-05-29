//
//  NIMTests.swift
//  NIMTests
//
//  Created by Admin on 29/05/2019.
//  Copyright © 2019 Maxime Britto. All rights reserved.
//

import XCTest
@testable import NIM

class NIMTests: XCTestCase {
    
    var currentGame: NIMGame?

    override func setUp() {
        currentGame = NIMGame(player1: Player(name: "Joueur1"), player2: Player(name: "Joueur 2"))
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        currentGame = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGameEnding() {
        if let currentGame = currentGame {
            while !currentGame.isOver{
                currentGame.removeMatches(selectedMatches: 2)
            }
            XCTAssert(currentGame.isOver)
            XCTAssertEqual(currentGame.player1.points, 30)
            XCTAssertEqual(currentGame.player2.points, -30)
            
        }
    }

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
