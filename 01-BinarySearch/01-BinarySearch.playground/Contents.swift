//: Playground - noun: a place where people can play

import UIKit

/*:
 ## 二分查找
 ### 满足条件1、有序元素列表；2、元素不重复
 ### 结果：如果查找的元素包含在列表中，二分查找返回其位置，否则返回null
 ## 原理
 > 例如:
 [1,3,5,6,7,9,20]
 查找是否包含9
 普通查找：先用1和9对比不同，再用3对比也不同，依次对比直到找到停止循环
 二分查找：首先从中间开始6与9对比小了那么数组只剩[7,9,20],再用9去对比相等，两次就可以找到，是不是非常高效😊（提供两种解题思路：1、通过改变下标；2、通过改变数组长度）
 */

//普通查找
func search<T: Comparable> (_ array: [T], item: T) -> Int? {
    for (index, value) in array.enumerated() {
        if value == item {
            return index
        }
    }
    return nil
}

//二分查找(此处不实际改变数组的长度，而是用数组的下标控制)
func binarySearch<T: Comparable> (_ array: [T], item: T) -> Int? {
    var lowerBound = 0
    var upperBound = array.count - 1
    while lowerBound <= upperBound {
        let midIndex = (upperBound + lowerBound) / 2
        let guess = array[midIndex]
        if guess == item {
            return midIndex
        }else if guess > item {
            upperBound = midIndex - 1
        }else{
            lowerBound = midIndex + 1
        }
    }
    return nil
}

//二分查找(直接通过更改数组的长度,使用递归实现，具体代码请查看04)

var array = [1,3,5,7,9,14,16]
search(array,item:9)
binarySearch(array, item: 9)

