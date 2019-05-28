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

let res = allSequence(string)
for chars in res {
    print(chars)
}
