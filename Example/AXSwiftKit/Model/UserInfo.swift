//
//  UserInfo.swift
//  AXSwiftKit_Example
//
//  Created by 小星星吃KFC on 2020/11/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
/// Codable 属性用? 避免json中无字段,而奔溃
final class UserInfo: Codable {
    
    ///支持懒加载, 线程安全
    //    static let shared = UserInfo(name:"空", age: 0, sex: .other)
    static let shared: UserInfo = UserInfo()
    private init() {
    }
    
    enum Sex: Int, Codable {
        case male = 1
        case female = 2
        case other
    }
    
    var name:String?
    var age :Int?
    /// 区分关键字
    var `switch`: Bool? = false
    var sex : Sex = .other
    
    
    
    //    private init(name: String,age: Int, sex: Sex) {
    //        self.name = name;
    //        self.age = age;
    //        self.sex = sex;
    //    }
    
    static func destroy() {
        
        
    }
    class func destroy2() {
        
        
    }
    deinit{
        print("Person\(String(describing: name)) deinit...")
    }
}


struct UserInfoStruct:Codable {
    ///支持懒加载, 线程安全
    static let shared = UserInfoStruct()
    
    var name:String?
    var age :Int?
    
    
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
