//
//  AXBase.swift
//  AXSwiftKit
//
//  Created by 小星星吃KFC on 2021/6/1.
//

import Foundation

public struct AXAnyBase<Base> {
    
    /// 泛型的实例对象
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}


public protocol AXAnyBaseProtocol {
    
    // protocol中 需要用 associatedtype 来预设一个类型
    associatedtype T
    
    var ax: T { get }
    
    static var ax: T.Type { get }
    
}

extension AXAnyBaseProtocol {
    
    public var ax: AXAnyBase<Self> {
        get { AXSwiftKit.AXAnyBase<Self>(self) }
    }
    
    public static var ax: AXAnyBase<Self>.Type {
        get { AXAnyBase<Self>.self }
    }
}

extension String: AXAnyBaseProtocol {}

extension Dictionary: AXAnyBaseProtocol {}
extension Array: AXAnyBaseProtocol {}
extension Set: AXAnyBaseProtocol {}



extension AnyIterator: AXAnyBaseProtocol {}
extension AnyCollection: AXAnyBaseProtocol {}
extension AnyHashable: AXAnyBaseProtocol {}
extension AnyIndex: AXAnyBaseProtocol {}
extension AnySequence: AXAnyBaseProtocol {}
extension AnyKeyPath: AXAnyBaseProtocol {}

extension NSObject: AXAnyBaseProtocol {}
