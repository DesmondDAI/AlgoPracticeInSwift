import UIKit

func majorityElement(_ nums: [Int]) -> Int {
    if nums.count == 1 {
        return nums.first!
    }

    var dict = [Int:Int]()
    var maxCount = 0
    var maxKey = 0

    for num in nums {
        if let count = dict[num] {
            dict[num]! += 1
            if count > maxCount {
                maxCount = count
                maxKey = num
            }

            if maxCount > (nums.count / 2) {
                return maxKey
            }
        } else {
            dict[num] = 1
        }
    }

    return maxKey
}

majorityElement([2,2,1,1,1,2,2])
