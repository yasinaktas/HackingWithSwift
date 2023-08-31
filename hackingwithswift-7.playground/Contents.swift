import UIKit

class Animal {
    var legs : Int
    init(legs:Int){
        self.legs = legs
    }
}

class Dog : Animal {
    func speak(){
        print("Hav hav!")
    }
}
class Cat: Animal {
    var isTame: Bool
    init(isTame:Bool, legs:Int){
        self.isTame = isTame
        super.init(legs:legs)
    }
    func speak(){
        print("Miyav miyav!")
    }
}
class Corgi: Dog{
    override func speak(){
        print("Hauv Hauv!")
    }
}
class Poodle: Dog{
    override func speak(){
        print("Haov Haov!")
    }
}

class Persian : Cat{
    override func speak(){
        print("Miyauv Miyauv!")
    }
}

class Lion : Cat{
    override func speak(){
        print("Roarr Roarr!")
    }
}

var commonAnimal = Animal(legs:4)
var commonDog = Dog(legs:4)
var commonCat = Cat(isTame:false,legs:4)
var corgi = Corgi(legs:4)
var poodle = Poodle(legs:4)
var persian = Persian(isTame:true,legs:4)
var lion = Lion(isTame:false,legs:4)
commonDog.speak()
commonCat.speak()
corgi.speak()
poodle.speak()
persian.speak()
lion.speak()
