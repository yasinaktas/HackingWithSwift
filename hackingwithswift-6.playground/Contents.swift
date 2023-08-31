import UIKit

struct Car {
    
    let model = "Fiat"
    let numberOfSeats = 5
    var currentGear : Int
    
    mutating func incCurrentGear(){
        if currentGear < 5 {
            self.currentGear += 1
        }else{
            print("Cannot more than 5")
        }
    }
    mutating func decCurrentGear(){
        if currentGear > 0 {
            self.currentGear -= 1
        }else{
            print("Cannot less than 1")
        }
    }
}

var car = Car(currentGear: 2)
car.decCurrentGear()
car.decCurrentGear()
car.decCurrentGear()
car.decCurrentGear()
car.decCurrentGear()
car.incCurrentGear()
car.incCurrentGear()
car.incCurrentGear()
car.incCurrentGear()
car.incCurrentGear()
car.incCurrentGear()
