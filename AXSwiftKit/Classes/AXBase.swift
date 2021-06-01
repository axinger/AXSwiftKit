//
//  AXBase.swift
//  AXSwiftKit
//
//  Created by 小星星吃KFC on 2021/6/1.
//

import Foundation

public struct AXAnyBase<Element> {
    
    /// 泛型的实例对象
    public let el: Element
    public init(_ el: Element) {
        self.el = el
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
        //        return AXAnyBase<Self>(self)
        
        get { AXSwiftKit.AXAnyBase<Self>(self) }
    }
    
    public static var ax: AXAnyBase<Self>.Type {
        //        return AXAnyBase<Self>.self
        get { AXAnyBase<Self>.self }
    }
}

extension String: AXAnyBaseProtocol {}
extension Dictionary: AXAnyBaseProtocol {}
extension Array: AXAnyBaseProtocol {}


extension AnyIterator: AXAnyBaseProtocol {}
extension AnyCollection: AXAnyBaseProtocol {}
extension AnyHashable: AXAnyBaseProtocol {}
extension AnyIndex: AXAnyBaseProtocol {}
extension AnySequence: AXAnyBaseProtocol {}
extension AnyKeyPath: AXAnyBaseProtocol {}

extension NSObject: AXAnyBaseProtocol {}
