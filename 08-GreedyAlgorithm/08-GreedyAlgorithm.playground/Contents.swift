//: Playground - noun: a place where people can play

import UIKit

/*:
 ### 贪婪算法
 ### 核心思想：每步都采取最优的做法，也就是每步都选择局部最优解，最终得到全局最优解
 ###
 事例：集合覆盖问题
 某广播节目，要让5个州都听见，你需要决定在哪些广播台播出，每个广播广播台都需要支付一定的费用，你需要尽可能少的广播台播出
 - 首先选出一个广播台，它覆盖了最多的未覆盖州。即便这个广播台覆盖了一些已覆盖的州，也没有关系。
 - 重复第一步，直到覆盖了所有的州。
 
 */

//主要利用集合的互异性
var statesNeeded: Set = ["mt","wa","or","id","nv","ut","ca","az"]

var stations = [String : Set<String>]()
stations["kone"] = ["id", "nv", "ut"]
stations["ktwo"] = ["wa", "id", "mt"]
stations["kthree"] = ["or", "nv", "ca"]
stations["kfour"] = ["nv", "ut"]
stations["kfive"] = ["ca", "az"]

var finalStations: Set<String> = []


while !statesNeeded.isEmpty {
    var bestStation = String()//用来存储选出来最多的电台
    var statesCovered: Set<String> = []

    //首先遍历所有电台，选择出覆盖最多的电台
    for station in stations {
        //求覆盖最多的即要求与总集合的交集最大，此处需要了解关于集合的代数运算
        let covered = statesNeeded.intersection(station.value)
        if covered.count > statesCovered.count {
            bestStation = station.key
            statesCovered = covered
        }
        //将covered中的元素从statesNeeded中移除，使用差集
        statesNeeded = statesNeeded.subtracting(statesCovered)
        //将选出的station添加到finalStation中
        if !bestStation.isEmpty {
            finalStations.insert(bestStation)
        }
    }
}
print(finalStations)

