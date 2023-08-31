import UIKit

protocol Building{
    var rooms: Int {get set}
    var cost: Int {get set}
    var estateAgent: String {get set}
    
    func summary()
}

struct House: Building{
    var rooms = 4
    var cost = 1_000_000
    var estateAgent = "GHR"
    
    func summary(){
        print("Rooms: \(rooms), Cost: \(cost)$, Estate Agent: \(estateAgent)")
    }
}

struct Office: Building{
    var rooms = 3
    var cost = 500_000
    var estateAgent = "YRS"
    
    func summary(){
        print("Rooms: \(rooms), Cost: \(cost)$, Estate Agent: \(estateAgent)")
    }
}

var office = Office()
office.summary()
