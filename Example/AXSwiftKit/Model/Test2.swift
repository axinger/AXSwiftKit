//
//  Test2.swift
//  AXSwiftKit_Example
//
//  Created by 小星星吃KFC on 2021/5/28.
//  Copyright © 2021 axinger. All rights reserved.
//

import UIKit

struct MyNameSpace<Base> {
    private let base: Base
    init(base: Base) {
        self.base = base
    }
    
}

protocol NameSpaceWrappable {
    associatedtype T
    var rx: T { get }
    static var rx: T.Type { get }
    
    associatedtype type
    var ac: type { get }
    
}

extension NameSpaceWrappable {
    var rx: MyNameSpace<Self> {
        return MyNameSpace<Self>(base: self)
    }

    static var rx: MyNameSpace<Self>.Type {
        return MyNameSpace<Self>.self
    }
    
    public var ac: MyNameSpace<Self> {
        get {
            return MyNameSpace(base:self)
        }
    }
    
}


extension UIButton: NameSpaceWrappable {}
extension UILabel: NameSpaceWrappable {}


extension MyNameSpace where Base: UIButton {
    
    func hello() {
        print("Hi \(base.titleLabel?.text ?? "")")
    }
}

extension MyNameSpace where Base: UILabel {
    
    func hello() {
        
        print("Hi \(base.text ?? "")")
        
    }
    
    
    
}
extension MyNameSpace where Base: UIView {
    
    func hello2() {
        
        print("Hi \(String(describing: base.backgroundColor))")
        
    }
    func ab()->Base {
        
       return base
        
    }
    
     var ad: Base {
        get {
            return base
        }
    }
    
}


func test3() {
    let btn = UIButton()
    btn.titleLabel?.text = "ni hao"
    btn.rx.hello()
    
    let label = UILabel()
    label.rx.hello()
    label.rx.hello2()
    
    label.ac.hello2()
    label.ac.ad.backgroundColor
    
}








