//
//  AXString.swift
//  AXSwiftKit
//
//  Created by 小星星吃KFC on 2021/6/1.
//

import Foundation

/// AnyOne:是 UIImageView类型
/// where Base 表示这个泛型是不同情况
//extension AXAnyBase where Base == String {
//    /// url 含有中文编码
//    /// - Returns: String
//    public func encoding() -> String {
//        
//        return self.base
//            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)! // iOS 9之后。
//    }
//    
//    
//    /// url 含有中文解码
//    /// - Returns: String
//    public func decoding() -> String {
//        return self.base
//            .removingPercentEncoding! // iOS 9之后。
//    }
//    
//}

/**
 并指明了这个扩展只能应用于实现了 ExpressibleByStringLiteral 协议的类型。
 所有能够用字符串字面量进行赋值的类型都遵守了ExpressibleByStringLiteral协议，
 比如 String、NSString。因此这个扩展可同时用于 String 和 NSString\NSMutableString。
 ————————————————
 版权声明：本文为CSDN博主「颐和园」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
 原文链接：https://blog.csdn.net/kmyhy/article/details/107671945
 */
/// AnyOne:是 UIImageView类型
/// where Base 表示这个泛型是不同情况 ExpressibleByStringLiteral
/// ExpressibleByStringLiteral,ExpressibleByStringInterpolation,DefaultStringInterpolation
extension AXAnyBase where Base:  ExpressibleByStringLiteral {
    
    
    /// url 含有中文编码
    public var encoding: String {
//        get {
            switch self.base {
            case is String:
                return (self.base as!String).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            default:
                return ""
            }
//        }
    }
    
    
    /// url 含有中文解码
    public var decoding: String {
//        get {
            if self.base is String {
                return (self.base as!String)
                    .removingPercentEncoding! // iOS 9之后。
            }
            return "" // iOS 9之后。
        }
//    }
    
    
}

extension AXAnyBase where Base==String {
    
    
    /// url 含有中文编码
    public var encoding: String {
//        get {
            switch self.base {
            case is String:
                return (self.base as!String).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            default:
                return ""
            }
//        }
    }
    
    
    /// url 含有中文解码
    public var decoding: String {
//        get {
            if self.base is String {
                return (self.base as!String)
                    .removingPercentEncoding! // iOS 9之后。
            }
            return "" // iOS 9之后。
        }
//    }
    
    
}
