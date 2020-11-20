//
//  UserInfo.swift
//  AXSwiftKit_Example
//
//  Created by 小星星吃KFC on 2020/11/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class UserInfo: NSObject {
    
    static let share = UserInfo()
    
    var name = ""
    var age = 0
    
    
    private override init() {
        
    }
    
    override func copy() -> Any {
        return self // SingletonClass.shared
    }
    
    override func mutableCopy() -> Any {
        return self // SingletonClass.shared
    }
    
    // Optional
    func reset() {
        // Reset all properties to default value
    }
}
