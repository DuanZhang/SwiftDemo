//: Playground - noun: a place where people can play

import UIKit

/*:
 ## 递归: 自己调用自己的函数
 ### 递归函数包括两部分1、基线条件（使函数不再调用自己），避免无限循环2、递归条件（使函数调用自己）
 ### 使用场景：倒计时、求n！、棋盘问题等超级多应用场景
 > 例如：
 写一个从1到n的求和函数，有以下方式
 1. 等差数列求和
 2. 循环
 3. 递归
从效率来说无疑第一个是最高的，此处主要演示递归的做法
 */

//递归
func sum(_ n: Int) -> Int {
    if n == 0 {
        return 0
    }
    return n + sum(n - 1)
}

sum(100)

/*:
sum(1000000000)
error: Execution was interrupted, reason: EXC_BAD_ACCESS (code=2, address=0x7ffeec495ff8).
为什么会报错呢？因为每次对sum的递归都要在调用栈上保存当前状态，否则不能计算到n + sum（n - 1）。当n很大，栈很深，栈溢出。如何解决这个问题，可以使用尾递归
那么什么是尾递归呢？为什么可以解决栈溢出的问题
尾递归就是让函数的最后一个动作是一个函数调用的形式，这个调用的返回值将直接被当前函数返回，从而避免在栈上保存状态，这样程序每次都是直接更新最后的栈帧，而不是新建，从而避免栈溢出。
 
更详细的自己去探索吧😊(脑补了罗杰的最后语录)
 */

func tailSum(_ n: Int, _ current: Int = 0) -> Int {
    if n == 0 {
        return current
    }
    return tailSum( n - 1, current + n )
}

tailSum(10)

func tailSum1(_ n: Int) -> Int {
    func sumInternal (_ n: Int, current: Int ) -> Int {
        if n == 0 {
            return 0
        }
        return sumInternal(n - 1 , current: current + n)
    }
    return sumInternal(n, current: 0)
}

tailSum1(10)
