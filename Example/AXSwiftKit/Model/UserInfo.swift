//
//  UserInfo.swift
//  AXSwiftKit_Example
//
//  Created by 小星星吃KFC on 2020/11/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit


class UserInfo:Codable {
    ///支持懒加载, 线程安全
    static let shared = UserInfo()

    var name:String?
    var age :Int?
    private init() {}

//    override func copy() -> Any {
//        return self // UserInfoClass.shared
//    }
//
//    override func mutableCopy() -> Any {
//        return self // UserInfoClass.shared
//    }
//
//    // Optional
//    func reset() {
//        // Reset all properties to default value
//    }
    ///第二种嵌套结构体变量格式
//    class var shared: UserInfo {
//                return Inner.instance
//        }
//
//        struct Inner {
//            static let instance: UserInfo = UserInfo()
//        }


//    override var description: String {
//
//           return "Person类对象的名字是:\(self.name),年龄是:\(self.age)"
//
//        }
}
