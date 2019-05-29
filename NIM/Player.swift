

import UIKit

class Player {
    static var idCount = 1
    var name: String
    var points = 0
    var id: Int
    
    init(name: String) {
        self.name = name
        id = Player.idCount
        Player.idCount = Player.idCount+1
    }
    
    func win(){
        points = points + 30
    }
    
    func lose(){
        points = points - 30
    }
    
    
}
