//
//  AXFoundationAssistant.swift
//  AXSwiftKit
//
//  Created by 小星星吃KFC on 2020/9/28.
//

import Foundation

/// 调试方法打印输出
public func AXPrint<T>(_ message: T, filePath: String = #file, function:String = #function, rowCount: Int = #line) {
    
    #if DEBUG
    let fileName = (filePath as NSString).lastPathComponent.replacingOccurrences(of: ".swift", with: "")
    print(fileName + " " + function + " [ 第\(rowCount)行 ] " + "\(message)")
    #endif
    //    #else
    //
    //    #endif
    
}

