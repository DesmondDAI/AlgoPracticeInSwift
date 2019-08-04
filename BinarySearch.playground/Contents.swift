import UIKit

// Calculate square root
func sqrtCal(_ value: Double, precision: Double) -> Double {
    if value <= 0 || precision <= 0 {
        return value
    }

    var low: Double = 0
    var high: Double = value
    if value < 1 {
        high = 1
    }
    var mid: Double = (low + high) / 2.0
    var diff = (mid * mid) - value
    while abs(diff) > precision {
        if diff < 0 {
            low = mid
        } else {
            high = mid
        }
        mid = (low + high) / 2.0
        diff = (mid * mid) - value
    }

    return mid
}

let num1: Double = 5
let num2: Double = 212
let num3 = 1.5439
let num4 = 0.91781
let num5 = 39475.23974
let num6: Double = 9
print("\(num1): \(sqrtCal(num1, precision: 0.000001))")
print("\(num2): \(sqrtCal(num2, precision: 0.000001))")
print("\(num3): \(sqrtCal(num3, precision: 0.000001))")
print("\(num4): \(sqrtCal(num4, precision: 0.000001))")
print("\(num5): \(sqrtCal(num5, precision: 0.000001))")
print("\(num6): \(sqrtCal(num6, precision: 0.000001))")
