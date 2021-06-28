import UIKit

// convert xxx (test PR suggestion)
func convert(_ s: String, _ numRows: Int) -> String {
    guard numRows > 1 else {
        return s
    }

    guard s.indices.count > numRows else {
        return s
    }

    var zigZagStr = ""
    let startEndDistance = numRows * 2 - 2
    for row in 0..<numRows {
        var distance = startEndDistance - row * 2
        if distance == 0 {
            distance = startEndDistance
        }

        let endIndex = s.index(s.endIndex, offsetBy: -1)
        var index = s.index(s.startIndex, offsetBy: row, limitedBy: s.endIndex)

        while index != nil {
            zigZagStr.append(s[index!])
            index = s.index(index!, offsetBy: distance, limitedBy: endIndex)
            distance = startEndDistance - distance
            if distance == 0 {
                distance = startEndDistance
            }
        }
    }
    return zigZagStr
}
