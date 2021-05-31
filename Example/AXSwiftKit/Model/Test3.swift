//
//  Test3.swift
//  AXSwiftKit_Example
//
//  Created by 小星星吃KFC on 2021/5/31.
//  Copyright © 2021 axinger. All rights reserved.
//

import Foundation

// 模仿 Dictionary 自定义一个泛型字典
struct GenericsDictionary<Key,Value> where Key : Hashable {
    
    private var data: [Key: Value]
    
    init(data:[Key: Value]) {
        self.data = data
    }
    
    
//    subscript(key: Key) -> Dictionary<Key, Value>.Element  {
//        return data[key]
//    }
    /**
     下标(subscript)语法
     
     subscript 的返回值类型决定了：

        get 方法的返回值类型；
        set 方法中 newValue 的类型；


     */
//    subscript(key: Key) -> T? {
//        return data[key] as? T
//    }
    
        subscript<T>(key: Key) -> T? {
            return data[key] as? T
        }
    
//    subscript(key: Key) -> Value? {
//        return data[key]
//    }
}

func Pop<T>() -> T?{
        var result:Any?
    
        return result as? T
   
}


func test3() {
    
    
//    let dict = ["name": "manoboo", "age": 24]<String, Any>
    
    do {
        let dict:[String:Any] = ["name": "manoboo", "age": 24]
        let name: String = dict["name"] as! String
        let age: Int = dict["age"] as! Int
        print(name)
        print(age)
    }
    
    do {
        let dict:[String:Any] = ["name": "manoboo", "age": 24]
        let name  = dict["name"] as? String
        let age: Int? = (dict["age"] as! Int)
    }
    
    
    let genericsDict = GenericsDictionary.init(data:["name": "manoboo", "age": 24])
    
    do {
        
        let name: String? = genericsDict["name"]
//        let age: Int? = genericsDict["age"] as? Int
        print(name)
    }
    do {
        
//        let name = genericsDict["name"]
//        let age = genericsDict["age"]
    }
    
//    do {
//        let name = genericsDict["name"]
//        let age = genericsDict["age"]
//        // 此时 age 的类型为 Any?
//    }
    
    
    
}
