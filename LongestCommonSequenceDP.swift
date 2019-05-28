import UIKit

extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    subscript (bounds: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ..< end]
    }
    subscript (bounds: CountableClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ... end]
    }
    subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(endIndex, offsetBy: -1)
        return self[start ... end]
    }
    subscript (bounds: PartialRangeThrough<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ... end]
    }
    subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ..< end]
    }
}

extension Substring {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    subscript (bounds: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ..< end]
    }
    subscript (bounds: CountableClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ... end]
    }
    subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(endIndex, offsetBy: -1)
        return self[start ... end]
    }
    subscript (bounds: PartialRangeThrough<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ... end]
    }
    subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ..< end]
    }
}

//X(0..m-1)
//Y(0..n-1)
// L(X(0..m-1), Y(0..n-1)) = 1 + L(X(0..m-2), Y(0..n-2))

func getLongest(lhs:String, idxLhs:Int, rhs:String, idxRhs:Int) -> Int {
    if idxLhs < 0 || idxRhs < 0 {
        return 0
    }
    if lhs[idxLhs]  == rhs[idxRhs] {
        return 1 + getLongest(lhs: lhs, idxLhs: idxLhs - 1, rhs: rhs, idxRhs: idxRhs - 1)
    }
    return max(getLongest(lhs: lhs, idxLhs: idxLhs, rhs: rhs, idxRhs: idxRhs - 1), getLongest(lhs: lhs, idxLhs: idxLhs - 1, rhs: rhs, idxRhs: idxRhs))
}

print(getLongest(lhs: "ABCDGH", idxLhs: 5, rhs: "AEDFHR", idxRhs: 5))
print(getLongest(lhs: "AGGTAB", idxLhs: 5, rhs: "GXTXAYB", idxRhs: 6))

//countTable[m][n] = L(X[0..m-1], Y[0..n-1])
// L(X(0..m-1), Y(0..n-1)) = 1 + L(X(0..m-2), Y(0..n-2))
func getLongestDP(lhs:String, rhs:String) -> Int {
    let M = lhs.count;
    let N = rhs.count;
    
    var countTable = [[Int]]()
    for _ in 0...M {
        let row = Array.init(repeating: 0, count: N+1)
        countTable.append(row)
    }
    
    for m in 0...M {
        for n in 0...N {
            if m == 0 || n == 0 {
                countTable[m][n] = 0
            }else if lhs[m-1] == rhs[n-1] {
                countTable[m][n] = 1 + countTable[m-1][n-1]
            }else {
                countTable[m][n] = max(countTable[m][n-1], countTable[m-1][n])
            }
        }
    }
    
    return countTable[M][N]
}

print(getLongestDP(lhs: "ABCDGH", rhs: "AEDFHR"))
print(getLongestDP(lhs: "AGGTAB", rhs: "GXTXAYB"))

