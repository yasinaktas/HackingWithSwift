import UIKit


func returnRandomValue(numbers:[Int]?) -> Int {
    numbers?[Int.random(in: 0..<(numbers?.count ?? 0))] ?? Int.random(in: 0...100)
}

let numbers:[Int]? = [1000,1001,1002,1003,1004,1005,1006,1007]
let numbers2:[Int]? = nil
print(returnRandomValue(numbers:numbers))
print(returnRandomValue(numbers:numbers2))

