//
//  AXString.swift
//  AXSwiftKit
//
//  Created by 小星星吃KFC on 2021/6/1.
//

import Foundation

/// AnyOne:是 UIImageView类型
/// where Base 表示这个泛型是不同情况
extension AXAnyBase where Element == String {
    /// url 含有中文编码
    /// - Returns: String
    public func encoding() -> String {
        
        return self.el
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)! // iOS 9之后。
    }
    
    
    /// url 含有中文解码
    /// - Returns: String
    public func decoding() -> String {
        return self.el
            .removingPercentEncoding! // iOS 9之后。
    }
    
}


