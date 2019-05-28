import UIKit

let string = "abcd"

func allSequence(_ stringInput:String) -> [[Character]] {
    var string = stringInput
    if string.count == 1 {
        return [[string.first!]]
    }
    
    let taken = string.remove(at: string.startIndex)
    let res = allSequence(string)
    var output = [[Character]]()
    
    output.append(contentsOf: res)
    output.append([taken])
    for chars in res {
        output.append([taken]+chars)
    }
    return output
}

func allStringSequence(string:String) -> [String] {
    let res = allSequence(string)
    var output = [String]()
    for chars in res {
        output.append(String(chars))
    }
    return  output
}

func getLongest(lhs:[String], rhs:[String]) -> Int {
    var longest = 0
    for outer in lhs {
        for inner in rhs {
            if inner == outer, longest < inner.count {
                longest = inner.count
                print(inner)
            }
        }
    }
    return longest
}


let longest = getLongest(
    lhs: allStringSequence(string: "AGGTAB"),
    rhs: allStringSequence(string: "GXTXAYB"))

print(longest)
