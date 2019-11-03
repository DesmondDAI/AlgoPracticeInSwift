import UIKit

// 题目：
// 购买一件m元商品，手上有values[]不同面值的硬币，各面值数量不限，问：最少能用多少个硬币完成支付
// 回溯法
func coinsPayMinCount_backTracking(_ values: [Int], money: Int, count: Int) -> Int
{
    // 无法兑换，返回 Int.max 表示不可取
    if money < 0 {
        return Int.max
    }

    // 兑换完毕，个数+1
    for value in values {
        if money == value {
            return count + 1
        }
    }

    var step: Int = Int.max
    for value in values {
        step = min(coinsPayMinCount_backTracking(values, money: (money - value), count: count), step)
    }
    return (step + 1)
}

// 动态规划
func coinsPayMinCount_dp(_ values: [Int], money: Int) -> Int
{
    if money <= 0 {
        return 0
    }

    var counts = [Int](repeating: 0, count: money+1)

    // 从小到大排序
    let sortedValues = values.sorted { (v1, v2) -> Bool in
        if v1 <= v2 {
            return true
        }
        return false
    }

    // 每循环到下一档币值，必定先尽量使用最大币值，余数再取用最少值即可
    for value in sortedValues {
        for i in 1...money {
            if i >= value {
                let quotient = i / value
                let remainder = i % value
                counts[i] = counts[remainder] + quotient
            }
        }
    }

    return counts[money]
}

// 测试
let count1 = coinsPayMinCount_backTracking([1,3,5], money: 9, count: 0)
let count2 = coinsPayMinCount_dp([1,3,5], money: 24)
