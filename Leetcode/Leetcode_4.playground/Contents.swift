import UIKit

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var totalNums = [Int]()
    var midValue: Double = 0.0
    var i = 0, j = 0

    // 先合并，再取中位数
    while i < nums1.count && j < nums2.count {
        if nums1[i] <= nums2[j] {
            totalNums.append(nums1[i])
            i += 1
        } else {
            totalNums.append(nums2[j])
            j += 1
        }
    }

    if i == nums1.count {
        totalNums.append(contentsOf: nums2.suffix(from: j))
    }

    if j == nums2.count {
        totalNums.append(contentsOf: nums1.suffix(from: i))
    }

    let isEven: Bool = (totalNums.count % 2 == 0) ? true : false
    let midIndex = totalNums.count / 2
    if isEven {
        midValue = Double(totalNums[midIndex-1] + totalNums[midIndex]) / 2.0
    } else {
        midValue = Double(totalNums[midIndex])
    }

    return midValue
}

findMedianSortedArrays([1], [4,5,6])
