//
//  Test1.swift
//  AXSwiftKit_Example
//
//  Created by 小星星吃KFC on 2021/5/29.
//  Copyright © 2021 axinger. All rights reserved.
//

import UIKit


//protocol
protocol aProtocol{}
extension aProtocol where Self:UIView{
    //只给遵守myProtocol协议的UIView添加了拓展
    //强大的协议拓展  可以给协议添加默认实现   面向协议编程的基础
    func getString() -> String{
        return "string"
    }
    
}
class MyView:UIView{}
extension MyView:aProtocol{}
let myView = MyView()
let aStr = myView.getString()

