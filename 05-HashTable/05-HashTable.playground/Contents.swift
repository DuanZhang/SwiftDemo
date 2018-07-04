//: Playground - noun: a place where people can play

import UIKit

/*:
 ### 散列函数
 ### 散列函数是这样的函数，无论你给他什么数据，它都还给你一个数字
 ### 满足条件:
 1. 它必须是一致的。
 2. 它将不同的输入映射到不同的数字
 > 使用场景
 例如要在一个本子中立马查到顾客要买东西的价格，二分查找时间O(log n)，简单查找时间O(n),散列函数为O(1),效率显而易见🌹
 ### 散列表
 ### 散列表是一种数据结构，结合数组和散列函数组建的数据结构，就如字典
 */


//创建电话薄
var phone_book = [String: Int]()
phone_book["jenny"] = 8675309
phone_book["emergency"] = 911
print(phone_book["jenny1"] ?? "Not exist")

//检票系统:有人投票，先检查是否在散列表中，如果在就提示请不要重复投票，如果不在就请他投票并且将名称添加到列表中
var voted = [String: Bool]()
func checkVote(_ name: String){
    if voted[name] != nil {
        print("Don't repeat voting")
    }else{
        voted[name] =  true
        print("Please vote")
    }
}

checkVote("tom")
checkVote("mike")
checkVote("mike")



