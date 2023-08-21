import UIKit

enum SqrtError : Error{
    case outOfBounds, noRoot
}

func calculateSquareRoot(_ number:Int) throws -> Int {
    if(number < 1 || number > 10_000){
        throw SqrtError.outOfBounds
    }
    for i in 1...number{
        if i * i == number {
            return i
        }
    }
    throw SqrtError.noRoot
}

do{
    try calculateSquareRoot(10000)
}catch SqrtError.outOfBounds{
    print("Out of Bounds Error")
}catch SqrtError.noRoot{
    print("No Root Error")
}
