//
//  Test.swift
//  AXSwiftKit_Example
//
//  Created by 小星星吃KFC on 2021/6/2.
//  Copyright © 2021 axinger. All rights reserved.
//

import UIKit
//import AXSwiftKit
/**
 Swift中的访问级别有以下五种:
 
 open: 公开权限, 最高的权限, 可以被其他模块访问, 继承及复写。
 public: 公有访问权限，类或者类的公有属性或者公有方法可以从文件或者模块的任何地方进行访问。那么什么样才能成为一个模块呢？一个App就是一个模块，一个第三方API, 第三等方框架等都是一个完整的模块，这些模块如果要对外留有访问的属性或者方法，就应该使用public的访问权限。public的权限在Swift 3.0后无法在其他模块被复写方法/属性或被继承。
 fileprivate: 文件私有访问权限，被fileprivate修饰的类或者类的属性或方法可以在同一个物理文件中访问。如果超出该物理文件，那么有着fileprivate访问权限的类, 属性和方法就不能被访问。
 private: 私有访问权限，被private修饰的类或者类的属性或方法可以在同一个物理文件中的同一个类型(包含extension)访问。如果超出该物理文件或不属于同一类型，那么有着private访问权限的属性和方法就不能被访问。
 internal: 顾名思义，internal是内部的意思，即有着internal访问权限的属性和方法说明在模块内部可以访问，超出模块内部就不可被访问了。在Swift中默认就是internal的访问权限。
 
 作者：李现科
 链接：https://www.jianshu.com/p/6daa3e309235
 来源：简书
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */
protocol CusProtocol {}

extension  CusProtocol where Self:UIView {
    
    func sayHello(){
        print("Hello")
    }
}
extension UIView:CusProtocol {
    
    
    
}

class ReadOnly {
    // 私有可以set,外部只读
    private(set) var name: String
    
    init(_ name: String) {
        self.name = name
    }
}



func test() {
    
    let view:UIView = UIView()
    
    view.sayHello()
    print(ReadOnly("2").name)
    //    ReadOnly("2").name = "2"
    
    
    
    let str = "https://www.google.com/search?q=成都市".ax.encoding;
    //                UIButton().ax.encoding()
    //                AXPrint("打印=\(str)")
    AXLog.debug("encoding=\(str)")
    AXLog.debug("decoding=\(str.ax.decoding)")
    let dict = ["1":"1"]
    dict.ax.test();
    let arr :Array<Int> = [1,2]
    arr.ax.test();
    //                "encoding".encoding()
    //                AXSwiftKit."ee".encoding()
    //                AXSwiftKit.AXLog.debug("名称空间")
    
    var set:Set<Int> = Set()
    set.insert(1)
    set.ax.test()
    
}


//MARK: - 策略协议

// 策略协议
protocol DiscountStrategy {
    // 支付价格
    func payment(money: Double) -> Double
}


// 原价购买
class DiscountNormal: DiscountStrategy {
    func payment(money: Double) -> Double {
        return money
    }
}

// 打折
class DiscountRebate: DiscountStrategy {
    private let rebate: Double // 折扣
    
    init(rebate: Double) {
        self.rebate = rebate
    }
    func payment(money: Double) -> Double {
        return money * rebate/10.0
    }
}

// 返现
class DiscountReturn: DiscountStrategy {
    private let moneyCondition: Double // 满
    private let moneyReturn: Double // 返
    
    init(moneyCondition: Double, moneyReturn: Double) {
        self.moneyCondition = moneyCondition
        self.moneyReturn = moneyReturn
    }
    
    func payment(money: Double) -> Double {
        return money - (Double(Int(money/moneyCondition)) * moneyReturn)
    }
}

// 策略枚举
enum PayMentStyle {
    case normal
    case rebate(rebate: Double)
    case `return`(moneyCondition: Double, moneyReturn: Double)
}

protocol DiscountContextPro {
    // Swift中协议{ get }和{ get set }属性的区别
    // https://juejin.cn/post/6844903825057251335
    var discountStrategy: DiscountStrategy { get }
    func getResult(money: Double) -> Double
    
}


// 策略管理
class DiscountContext:DiscountContextPro {
    
    
    var discountStrategy: DiscountStrategy
    
    
    init(style: PayMentStyle) {
        switch style { // 对应的三种方式
        case .normal:
            discountStrategy = DiscountNormal()
            
        case .rebate(rebate: let money):
            discountStrategy = DiscountRebate(rebate: money)
            
        //        case .return:
        //            discountStrategy = DiscountReturn(moneyCondition: 1, moneyReturn: 2)
        
        case .return(moneyCondition: let condition, moneyReturn: let `return`):
            discountStrategy = DiscountReturn(moneyCondition: condition, moneyReturn: `return`)
            
        }
    }
    func getResult2(money: Double) -> Double {
        discountStrategy = DiscountNormal()
        
        return discountStrategy.payment(money: money)
    }
    func getResult(money: Double) -> Double {
        return discountStrategy.payment(money: money)
    }
}

func test_1()  {
    
    let money: Double = 800
    
    let normalPrice = DiscountContext(style: .normal).getResult(money: money)
    let rebatePrice = DiscountContext(style: .rebate(rebate: 8)).getResult(money: money)
    let returnPrice = DiscountContext(style: .return(moneyCondition: 100, moneyReturn: 20)).getResult(money: money)
    
    print("正常价格:\(normalPrice)") // 正常价格:800.0
    print("打八折:\(rebatePrice)") // 打八折:640.0
    print("满100返20:\(returnPrice)") // 满100返20:640.0
    
    
    
}
