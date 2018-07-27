//: Playground - noun: a place where people can play

import UIKit

/*:
 ### 广度优先搜索（广度优先遍历）
 ### 主要解决两类问题：1、从节点A出发，有前往节点B的路径吗？2、从节点A出发，前往节点B的路径哪个最短？
 
 > 例如:你经营着一个芒果农场，需要寻找芒果经销商，将芒果买给他，首先，你需要建一个朋友的名单，然后检查每个人，看看他们是否是芒果销售商，假设你没有朋友是芒果销售商，那么你就必须在朋友的朋友中查找，检查名单中的每个人，你都将其朋友加入名单，这样一来，你不仅在朋友中查找，还在朋友的朋友中查找，别忘了你的目标是在你的人际关系网中找到一位芒果经销商，因此，如果Alice不是芒果销售商，就将其朋友也加入到名单中。这意味着你将在她的朋友、朋友的朋友等中查找。使用这种算法将搜遍你的整个人际关系网，直到找到芒果销售商。这就是广度优先搜索算法
 
 1. 首先创建一个队列，把你的朋友都加入到这个队列中。
 2. 只要队列不为空，就取出其中的第一个人，检查是否是芒果经销商，如果是，返回true结束
 3. 如果不是芒果经销商就将朋友加入搜索对列
 注意:每个人只检查一次
 摘录来自: [美] Aditya Bhargava. “算法图解。” iBooks.
 
 
 swift中没有队列，所以我们要先实现队列
 - 队列是什么，就像饭堂排队买饭，先来排队的人先买到饭，队列是先进先出的结构。
 - 关于队列只有这几个操作:enqueue, dequeue, isEmpty, peek, count。
因为队列主要用来存储数据的，主要操作就是入队和出队，不涉及继承等，最好使用结构体
 */


struct Queue<T> {
    var array = [T]()
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    func peek() -> T? {
        return array.first
    }
    
}

    //判断一个人是不是芒果经销商
func persionIsSeller(name: String) -> Bool {
        return name.first == "m"
  
}

var graph = [String: [String]]()
graph["you"] = ["alice", "bob", "claire"]
graph["alice"] = ["peggy"]
graph["bob"] = ["anuj", "peggy"]
graph["claire"] = ["thom", "jonny"]
graph["peggy"] = []
graph["anuj"] = []
graph["thom"] = []
graph["jonny"] = ["mengo"]
graph["mengo"] = []

//要搜索芒果商，首先需要将你的第一级关系添加到队列，然后去判断是否是芒果供销商，如果不是则出队列，然后将二级关系添加进入队列，依次操作
func search(name: String) -> Bool {
    var searchQueue = Queue<String>()
    for string in graph[name]! {
        searchQueue.enqueue(string)
    }
    
    while !searchQueue.isEmpty {
        let person = searchQueue.dequeue()
        if persionIsSeller(name: person!) {
            print(person! + "is a mango seller!")
            return true
        } else {
            for friends in graph[person!]! {
                searchQueue.enqueue(friends)
            }
        }
    }
   return false
}

if search(name: "you") == false {
    print("Mango seller Not Found!")
}

//以上就完成了查找芒果经销商的搜索，然而，会出现一个问题，比如说你和alice都有共同的好友bob那么bob就会被检查两次，如何防止这种情况出现，最简单的就是将所有检测过人放在数组里，更改以后如下所示

func search1(name: String) -> Bool {
    var searchQueue = Queue<String>()
    for string in graph[name]! {
        searchQueue.enqueue(string)
    }
    var searched = [String]()
    while !searchQueue.isEmpty {
        let person = searchQueue.dequeue()
        if !searched.contains(person!) {
            if persionIsSeller(name: person!) {
                print(person! + "is a mango seller!")
                return true
            } else {
                for friends in graph[person!]! {
                    searchQueue.enqueue(friends)
                }
                searched.append(person!)
            }
        }
    }
    return false
}

