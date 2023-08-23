import UIKit

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let luckyNumbersEvensOut = luckyNumbers.filter({$0 % 2 != 0})
let luckyNumbersSortedAscending = luckyNumbersEvensOut.sorted(by:{ $1 > $0 })
let printLuckyNumber = luckyNumbersSortedAscending.map({print("\($0) is a lucky number")})
