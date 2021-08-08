//
//  Person.swift
//  AXSwiftKit_Example
//
//  Created by 小星星吃KFC on 2020/11/25.
//  Copyright © 2020 axinger. All rights reserved.
//

import Foundation
/// 每个属性都需要可选类型(?)接收，否则，若没有该属性，解析失败;
/// 每个属性的类型都需要准确，否则解析失败;

struct Person2: Decodable {
    @Default<String.Unknown> var name: String
    @Default<String.Unnamed> var name2: String
    @Default<Int> var age: Int
}

struct Person: Codable {
    var name :String?
    var age :Int?
    var height :Int?
    var students: [Student]?
    var dog :Dog?
}

struct Dog: Codable {
    var name :String?
    var age :Int?
}

struct Student: Codable {
    var name :String?
    var age :Int?
    var height :Int?
    
    ///自定义键值名 String -> "nick_name" 所以用 String
        enum CodingKeys: String, CodingKey {
            case name = "nick_name"
            case age = "nick_age"
        }
//    enum CodingKeys: Int, CodingKey {
//        case height = "nick_age"
//    }
}
