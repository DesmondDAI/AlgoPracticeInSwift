import UIKit

// Bubble Sort
func bubbleSort(_ array: inout [Int]) {
    let count = array.count
    if count <= 1 {
        return
    }

    // 外层决定循环次数
    for i in 0..<count {
        var hasSwitch = false

        // 内层进行冒泡运算
        for j in 0..<(count - i - 1) {
            if array[j] > array[j+1] {
                let temp = array[j+1]
                array[j+1] = array[j]
                array[j] = temp
                hasSwitch = true
            }
        }

        // 没有循环，顺序已排好
        if hasSwitch == false {
            break
        }
    }
    return
}

// Insertion Sort
func insertionSort(_ array: inout [Int]) {
    let count = array.count
    if count <= 1 {
        return
    }

    // 未排序区间
    for i in 1..<count {
        let value = array[i]
        var j = i - 1

        // 已排序区间内比较
        while j >= 0 {
            if value < array[j] {
                // 元素移动
                array[j+1] = array[j]
            } else {
                break
            }
            j -= 1
        }
        // 插入元素
        array[j+1] = value
    }
}

// Selection Sort
func selectionSort(_ array: inout [Int]) {
    let count = array.count
    guard count > 0 else {
        return
    }

    for i in 0..<count {
        var minIndex = i
        for j in i..<count {
            if array[j] < array[minIndex] {
                minIndex = j
            }
        }
        (array[i], array[minIndex]) = (array[minIndex], array[i])
    }
}

// Merge Sort
func mergeSort(_ array: [Int]) -> [Int] {
    let count = array.count
    guard count > 1 else {
        return array
    }

    let divide = count / 2
    return merge(mergeSort(Array(array[0..<divide])), mergeSort(Array(array[divide..<count])))
}

func merge(_ array1: [Int], _ array2: [Int]) -> [Int] {
    var mergedArray = [Int]()
    mergedArray.reserveCapacity(array1.count + array2.count)

    var index1 = 0
    var index2 = 0
    while index1 < array1.count, index2 < array2.count {
        if array1[index1] <= array2[index2] {
            mergedArray.append(array1[index1])
            index1 += 1
        } else {
            mergedArray.append(array2[index2])
            index2 += 1
        }
    }

    if index1 < array1.count {
        for i in index1..<array1.count {
            mergedArray.append(array1[i])
        }
    } else {
        for i in index2..<array2.count {
            mergedArray.append(array2[i])
        }
    }

    return mergedArray
}

// Quick Sort
func quickSort(_ array: inout [Int], start: Int, end: Int) {
    guard start < end else {
        return
    }

    let pivot = partition(&array, start: start, end: end)
    quickSort(&array, start: start, end: pivot - 1)
    quickSort(&array, start: pivot + 1, end: end)
}

func partition(_ array: inout [Int], start: Int, end: Int) -> Int {
    let pivot = array[end]
    var index = start

    for i in start..<end {
        if array[i] < pivot {
            (array[index], array[i]) = (array[i], array[index])
            index += 1
        }
    }

    (array[index], array[end]) = (array[end], array[index])

    return index
}

// 创建数组进行比较
var bubbleArray = [Int]()
var insertionArray = [Int]()
var mergeArray = [Int]()
var quickArray = [Int]()
var selectionArray = [Int]()
for _ in 0..<200 {
    let num = Int(arc4random() % 1000)
    bubbleArray.append(num)
    insertionArray.append(num)
    mergeArray.append(num)
    quickArray.append(num)
    selectionArray.append(num)
}
// 冒泡排序执行时间
let bubbleStart = Date().timeIntervalSince1970
bubbleSort(&bubbleArray)
let bubbleEnd = Date().timeIntervalSince1970
let bubbleDuration = (bubbleEnd - bubbleStart) * 1000

// 插入排序执行时间
let insertionStart = Date().timeIntervalSince1970
insertionSort(&insertionArray)
let insertionEnd = Date().timeIntervalSince1970
let insertionDuration = (insertionEnd - insertionStart) * 1000

// 选择排序执行时间
let selectionStart = Date().timeIntervalSince1970
selectionSort(&selectionArray)
let selectionEnd = Date().timeIntervalSince1970
let selectionDuration = (selectionEnd - selectionStart) * 1000

// 归并排序执行时间
let mergeStart = Date().timeIntervalSince1970
let mergedArray = mergeSort(mergeArray)
let mergeEnd = Date().timeIntervalSince1970
let mergeDuration = (mergeEnd - mergeStart) * 1000

// 快速排序执行时间
let quickStart = Date().timeIntervalSince1970
quickSort(&quickArray, start: 0, end: quickArray.count - 1)
let quickEnd = Date().timeIntervalSince1970
let quickDuration = (quickEnd - quickStart) * 1000
