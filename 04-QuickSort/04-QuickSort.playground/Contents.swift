//: Playground - noun: a place where people can play

import UIKit

/*:
 ## 快速排序
 1. 选择基准值
 2. 将数组分成两个子数组：小与基准值的元素和大于基准值的元素。
 3. 对两个子数组进行快速排序
 > 例如[4,5,8,9,2,3,1]
 选4为基准值那么小与基准值的数组[2,3,1]大于基准值的数组[5,8,9]然后分别对两个数组排序，得出[1,2,3,4,5,8,9]

 */

func quickSort<T: Comparable>(_ array: [T]) -> [T] {
    if array.count <= 1 {
        return array
    }
    //基准条件
    let pivot = array[0]
    let less = array.filter { $0 < pivot }
    let equal = array.filter { $0 == pivot }
    let greater = array.filter { $0 > pivot }
    return quickSort(less) + equal + quickSort(greater)
}

let array = [4,5,8,9,2,3,1]
quickSort(array)

//二分查找中使用递归实现
func binarySearch<T: Comparable> (_ array:inout [T], item: T) -> Bool {
    let lowerBound = 0
    let upperBound = array.count - 1
    if lowerBound > upperBound {
        return false
    }
    let midIndex = (upperBound + lowerBound) / 2
    let guess = array[midIndex]
    if guess == item {
        return true
    }else if guess > item {
        array = lowerBound < midIndex ? Array(array[lowerBound...midIndex - 1]) : Array<T>()
        return binarySearch(&array, item: item)
    }else{
        array = upperBound > midIndex ? Array(array[midIndex + 1...upperBound]) : Array<T>()
        return binarySearch(&array, item: item)
    }
}

var array1 = [1,3,5,7,9,14,16]
binarySearch(&array1, item: 9)


