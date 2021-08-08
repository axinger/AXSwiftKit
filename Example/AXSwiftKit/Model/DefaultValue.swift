//
//  DefaultValue.swift
//  AXSwiftKit_Example
//
//  Created by 小星星吃KFC on 2021/8/8.
//  Copyright © 2021 axinger. All rights reserved.
//
/// 属性包装器,

protocol DefaultValue {
    associatedtype Value: Decodable
    static var defaultValue: Value { get }
}

@propertyWrapper
struct Default<T: DefaultValue> {
    var wrappedValue: T.Value
}

extension Default: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = (try? container.decode(T.Value.self)) ?? T.defaultValue
    }
}

extension KeyedDecodingContainer {
    func decode<T>(_ type: Default<T>.Type, forKey key: Key) throws -> Default<T> where T: DefaultValue {
        //判断 key 缺失的情况，提供默认值
        (try decodeIfPresent(type, forKey: key)) ?? Default(wrappedValue: T.defaultValue)
    }
}


extension Int: DefaultValue {
    static var defaultValue = 0
}

extension String {
    struct Unknown: DefaultValue {
        static var defaultValue = "unknown"
    }
    struct Unnamed: DefaultValue {
        static var defaultValue = "unnamed"
    }
}
