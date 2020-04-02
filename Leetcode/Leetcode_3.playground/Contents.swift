import UIKit

/* 超出时间限制 */
func lengthOfLongestSubstring(_ s: String) -> Int {
    var maxLength = 0
    var currentLength = 0
    var startIndex = 0
    var indexIntValue = 0
    var dict = [Character: Int]()
    for index in s.indices {
        indexIntValue = s.distance(from: s.startIndex, to: index)
        let char = s[index]

        // 重复
        if let existIndex = dict[char], existIndex >= startIndex  {
            if currentLength > maxLength {
                maxLength = currentLength
            }

            startIndex = existIndex + 1
            currentLength = indexIntValue - startIndex + 1
            dict[char] = indexIntValue
        } else {
            dict[char] = indexIntValue
            currentLength += 1
        }
    }

    if currentLength > maxLength {
        maxLength = currentLength
    }

    return maxLength
}

/* 参考了题解的滑动窗口解法 */
func lengthOfLongestSubstring2(_ s: String) -> Int {
    var maxLength = 0
    var i = 0, j = 0
    var charSet = Set<Character>()
    while i < s.indices.count && j < s.indices.count {
        let suffix = s[s.index(s.startIndex, offsetBy: j)]

        if charSet.contains(suffix) == false {
            charSet.update(with: suffix)
            j += 1
            maxLength = max(maxLength, j - i)
        } else {
            let prefix = s[s.index(s.startIndex, offsetBy: i)]
            charSet.remove(prefix)
            i += 1
        }
    }

    return maxLength
}
