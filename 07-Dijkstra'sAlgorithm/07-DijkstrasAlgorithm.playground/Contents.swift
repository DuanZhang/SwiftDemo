//: Playground - noun: a place where people can play

import UIKit

/*:
 ### 狄克斯特拉算法：
 #### 与广度优先搜索区别
举个最简单的例子，从起点到终点，有三条路，分别是 起点->a->终点 起点->b->终点 起点->b->a->终点
 1. 广度优先搜索针对的是非加权图的最短路径，即在三条路中起点->a->终点，起点->b->终点这两条都符合要求
 2. 对于狄克斯特拉算法则针对的是加权图，比如从起点->a 需要6分钟，从a->终点 需要1分钟，从起点->b 需要2分钟，从b->a 需要3分钟，从b->终点 需要5分钟，那么三条路 起点->a->终点 共7分钟；起点->b->终点 共7分钟；起点->b->a->终点 共6分钟，那么按照狄克斯特拉算法最短路径为 起点->b->a->终点 ，与广度优先搜索出来的结果完全不同。
 如上，直观上我们的判断应该是这样，但是狄克斯特拉算法其实有严格的步骤，如下
 ### 狄克斯特拉算法包含的步骤
 - 找出"最便宜"的节点，即可在最短时间内到达的节点
 - 对于该点的邻居，检查是否有前往他们的更短路径，如果有，就更新该节点的邻居开销（比如起点到a直达6分钟，但是从起点先到b点2分钟，然后从b到a3分钟，那么从起点->a->b共5分钟，更新起点到a的开销）
 - 重复上面过程，直到对途中的每个节点都执行这样的操作
 - 计算最终的路径
 ### 狄克斯特拉算法只适用于有向无环图
 ### 不能将狄克斯特拉算法用于包含负权边的图（可使用贝尔曼-福德算法）
 
 此处需了解加权图、权重、有向图、无向图、环等概念
 */

//下面使用狄克斯特拉算法实现查找起点到终点的最短路径

//使用散列表表示所有节点以及权值
var graph = [String: [String: Double]]()
graph["start"] = [String: Double]()
graph["start"]?["a"] = 6
graph["start"]?["b"] = 2

graph["a"] = [String: Double]()
graph["a"]?["fin"] = 1

graph["b"] = [String: Double]()
graph["b"]?["a"] = 3
graph["b"]?["fin"] = 5

graph["fin"] = [String: Double]()

//开销的表
var costs = [String: Double]()
let infinity = Double.infinity
costs["a"] = 6
costs["b"] = 2
costs["fin"] = infinity

//存储父节点
var parents = [String: String]()
parents["a"] = "start"
parents["b"] = "start"
parents["fin"] = nil

//用来存储已经处理过的节点
var processed = [String]()

//找出最便宜的节点(遍历所有的节点，如果当前的节点的开销更低，且未处理，则将其视为开销最低的节点)
func findLowestCostNode(_ costs: [String: Double]) -> [String: Double] {
    //定义开销为∞
    var lowestCost = infinity
    var lowestCostNode = [String: Double]()
    for node in costs {
      let cost = node.value
        if (cost < lowestCost) && !processed.contains(node.key) {
            lowestCost = cost
            lowestCostNode = [node.key : node.value]
        }
    }
    print(lowestCostNode)
    return lowestCostNode
}

//在未处理过的点重找出开销最小的点此处为b
var node = findLowestCostNode(costs)

while !node.isEmpty {
    let temp = node.first?.key
    let cost = costs[temp!]
    var neighbors = graph[temp!]
    for n in (neighbors?.keys)! {
        let newCost = cost! + (neighbors?[n])!
        //如果经过当前节点前往该邻居更近
        if costs[n]! > newCost {
            costs[n] = newCost
            parents[n] = temp
        }
    }
    processed.append(temp!)
    node = findLowestCostNode(costs)
}

print(costs)

//思考：如果不使用散列表又该怎么表示
