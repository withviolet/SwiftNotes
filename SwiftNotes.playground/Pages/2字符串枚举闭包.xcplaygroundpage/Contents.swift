import UIKit

//: [上一页](@previous)

/*:
 ### 判断语句
 if while后跟bool值
 
 ### Range区间类型
 ... 闭区间   ClosedRange<Int>
 <.. 开闭区间 Range<Int>
 ... 无穷区间 PartialRangeThrough<Int>
 */

//函数重载
/*
 参数
 数量不同
 类型不同
 标签不同
 可以构成重载
 
 返回值不同，不能构成重载
 
 默认参数和函数重载一起使用时编译器不会报错
 */

func sum(v1: Int, v2: Int) -> Int {
    print("调用sum1")
    return v1 + v2
}

func sum(v1: Int, v2: Int, v3: Int = 0) -> Int {
    print("调用sum2")
    return v1 + v2 + v3
}
//sum(v1: 1, v2: 2)
//会调用第一个

//可变参数，省略标签参数，会导致编译器错误
func sum(_ v1: Int, _ v2: Int) -> Int {
    print("调用sum3")
    return v1 + v2
}

func sum(_ numbers: Int...) -> Int {
    print("调用sum4")
    var result = 0
    for num in numbers {
        result += num
    }
    return result
}

//sum(1,2)
// sum1不注释就有错，sum1注释了就不报错，sum1 + sum3 + sum4 报错

//内联函数
// 哪些函数不会在优化时转为内联函数？
/*
    函数体较长的函数
    内含递归的函数
    动态派发的函数
*/
/*
 高阶函数: 返回值是函数类型的函数
*/
func previous(_ value: Int) -> Int {
    return value - 1
}

func next(_ value: Int) -> Int {
    return value + 1
}

func forward(_ isForward: Bool) -> (Int) -> (Int) {
    isForward ? previous : next
}

forward(true)(3)
forward(false)(3)
/*
 forward就是一个高阶函数，在不希望别人访问到previous，next的操作细节的时候
 这样写，别人只能用forward来操作
*/

// 函数类型作为参数
func caculator(_ math: (Int, Int)-> Int, v1: Int, v2: Int) -> Int {
    return math(v1, v2)
}

func add(num1: Int, num2: Int) -> Int {
    num1 + num2
}

func subtract(num1: Int, num2: Int) -> Int {
    num1 - num2
}

caculator(add, v1: 1, v2: 2)
caculator(subtract, v1: 1, v2: 3)

// 嵌套函数:内部定义函数的函数
func forward(with isForward: Bool) -> (Int) -> Int {
    func previous(_ value: Int) -> Int {
        value - 1
    }
    func next(_ value: Int) -> Int {
        value + 1
    }
    
    return isForward ? previous : next
}

forward(true)(3)

typealias myBlock = (Int) -> Int
func test(with v1: Int) -> Int {
    return v1
}
var hanshu: myBlock = test
// 赋值后调用不用写标签
hanshu(1)
