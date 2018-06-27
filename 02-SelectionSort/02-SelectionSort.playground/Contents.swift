//: Playground - noun: a place where people can play

import UIKit

/*:
 ## 选择排序
 每一次从待排序的数据元素中选出最小（或最大）的一个元素，存放在序列的起始位置，直到全部待排序的数据元素排完。
 ## 例如一组数据[2,5,8,9,4,3,1]从小到达排序，两种思路
 1:写一个找出数组中最小元素的函数，然后排序，使用空数组接收每次的最小元素
 [1]
 [1,2]
 [1,2,3]
 [1,2,3,4]
 [1,2,3,4,5]
 [1,2,3,4,5,8]
 [1,2,3,4,5,8,9]
 2:每次交换位置，如下所示
 [1,5,8,9,4,3,2]
 [1,2,8,9,4,3,5]
 [1,2,3,9,4,8,5]
 [1,2,3,4,9,8,5]
 [1,2,3,4,5,8,9]
 
*/

//第一种
func findSmallest<T: Comparable>(_ array: [T]) -> Int {
    var smallest = array[0]
    var smallestIndex = 0
    if array.count == 1 {
        return 0
    }
    for (index, value) in array.enumerated() {
        if smallest > value {
            smallest = value
            smallestIndex = index
        }
    }
    return smallestIndex
}

func selectionSort<T: Comparable>(_ array: [T]) -> [T] {
    var newArray: [T] = []
    var muatbleArray = array
    for _ in 0...muatbleArray.count-1 {
        let smallestIndex = findSmallest(muatbleArray)
        newArray.append(muatbleArray[smallestIndex])
        muatbleArray.remove(at: smallestIndex)
    }
    return newArray
}

//第二种(可自行尝试)


let array = [2,5,8,9,4,3,1]
selectionSort(array)



