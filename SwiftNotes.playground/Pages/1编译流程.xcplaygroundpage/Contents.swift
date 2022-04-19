//: [Previous](@previous)

import Foundation

// 编译流程

// 什么是swiftc
/*
 使用swiftc指令查看中间代码
 */

print("test")

print("test")

import UIKit
import PlaygroundSupport

let view = UIView()
view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
view.backgroundColor = .red
// liveView可以传入view或者viewcontroller
PlaygroundPage.current.liveView = view

/*:
 # 大标题
 ## 中标题
 ### 小标题
 
 > 笔记
 ---
 
 **粗体** *Italic*
[下一页](@next)
 */

/*
 swift中的数据类型分为值类型和引用类型
 值类型分为枚举(enum)和结构体(struct)
 引用类型为类(class)
 
 定义Float需要写明Float，Double类型不用
 字符Charactor要写明，String也是""
 
 */

//元组
let httpError = (404, "can't approach")
print(httpError.0)

let (code, description) = httpError
print(code)

