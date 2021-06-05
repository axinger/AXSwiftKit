//
//  _01ContentViewController.swift
//  AXSwiftKit_Example
//
//  Created by 小星星吃KFC on 2020/11/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

// import ReactiveCocoa

import UIKit
import SwiftyJSON
import os
import AVKit
import AXSwiftKit
class PersonClass: Equatable {
    static func == (lhs: PersonClass, rhs: PersonClass) -> Bool {
        return lhs.name1 == rhs.name1 && lhs.name2 == rhs.name2
    }
    
    var name1  = "";
    /// 防⽌止重写 final,可以  final class 禁止继承
    final var name2  = "";
    
    func testLog() {
        
    }
}

class StudentClass: PersonClass {
    
    override  var name1:String {
        didSet {
            
        }
    }
    //    override  var name2:String {
    //        didSet {
    //
    //        }
    //    }
    
}

/// struct分配在栈中，class分配在堆中。
/// Struct 不能被序列化成 NSData 对象。
struct PersonStruct: Equatable {
    var name1  = "";
    var name2  = "";
    /// struct 的 function 要去改变 property 的值的时候要加上 mutating，而 class 不用。
    mutating func testLog() {
        name1 = "testLog2"
    }
    //    init(name1: String) {
    //        name2 = "testLog2"
    //    }
    //    init(from kelvin: Double) {
    //        name2 = "testLog2"
    //    }
}
/// struct 不能被继承
//struct StudentStruct: PersonStruct {
//
//
//}



enum CompassPoint {
    case north
    case south
    case east
    case west
}

class _01ContentViewController: _00BaseViewController {
    
    @objc func injected() {
        print("I've been injected: (self)")
        //调试的代码
    }
    
    
    var hand: ((_ make: Int) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "01Content2"
        
        /// _ 参数
        _test01()
        /// 没有 _ 参数,需要形参
        _test02()
        _test03()
        _test03_1()
        _test04()
        
        _ = _p00Button(title: "语音") {
            
            let synthsizer = AVSpeechSynthesizer.init()
            let utterance = AVSpeechUtterance.init(string: "支付宝到账1000元")
            //                   utterance.voice = AVSpeechSynthesisVoice.init(language: "zh-CN")
            utterance.rate = 0.52
            synthsizer.speak(utterance)
        }
        
        _ = _p00Button(title: "转义字符") {
            print("\0 (空字符)")
            print("\\ (反斜线)")
            print("\t (⽔水平制表符)")
            print("\n (换⾏行行符)")
            print("\r (回⻋车符)")
            print("\" (双引号)")
            print("\' (单引号)")
            
            print("Unicode 标量量\u{24}")
            print("Unicode 标量量\u{2665}")
            print("Unicode 标量量\u{1F496}")
            
            print(#"Line 1 \nLine 2"#)
            print("Line 1 \\nLine 2")
            
        }
        _ = _p00Button(title: "String") {
            let str = ""
            print("str.isEmpty \(str.isEmpty)")
            
            let greeting = "Guten,Tag!"
            print(greeting.startIndex)
            print( greeting[greeting.startIndex])
            // G
            let index = greeting.index(greeting.startIndex, offsetBy: 7)
            print( greeting[index])
            // a
            print(greeting.indices)
            print(greeting.compare(","))
            
            
            var word = "cafe"
            print("the number of characters in \(word) is \(word.count)") // 打印输出“the number of characters in cafe is 4”
            word += "\u{301}" // 拼接⼀一个重⾳音，U+0301
            print("the number of characters in \(word) is \(word.count)")
            // 打印输出“the number of characters in café is 4”
            
        }
        _ = _p00Button(title: "String值传递") {
            var str1 : String = "str1"
            
            
            print("打印String 地址str1 = \(String(format: "%p",str1))")
            
            let str2 = str1
            str1 = "str0"
            print("str1 = \(str1)")
            print("str2 = \(str2)")
            
            
        }
        _ = _p00Button(title: "class struct") {
            print("==================自定义 class 值传递比较==============")
            let p11 = PersonClass()
            p11.name1 = "n1"
            let p12 = p11
            print("比较class =\(p11 == p12 )")
            p11.name1 = "n1-c"
            print("p12 = \(p12.name1)")
            print(p11)
            print(p12)
            
            print("==================自定义 struct 值传递比较==============")
            /// struct可直接在构造函数中初始化property
            /// class不可直接在构造函数中初始化property
            var p21 = PersonStruct(name1: "jim")
            
            let p211 = PersonStruct(name1: "jim",name2: "tom")
            print(p211)
            
            let p212 = PersonStruct(name2: "tom")
            print(p212)
            
            p21.name1 = "n21"
            
            let p22 = p21
            print("比较struct =\(p21 == p22 )")
            p21.name1 = "n21-c"
            print("p22 = \(p22.name1)")
            print(p21)
            print(p22)
            print("打印地址,只能打印自定义class对象,struct直接打印 = \(Unmanaged.passUnretained(p11).toOpaque())")
            print("打印地址self = \(Unmanaged.passUnretained(self).toOpaque())")
            
        }
        _ = _p00Button(title: "集合") {
            //            var arr = Array<Int>()
            var arr = [Int]()
            arr.append(1)
            
            var arr1 = arr;
            arr1.append(1)
            
            print("arr = \(arr)")
            print("arr1 = \(arr1)")
            
            let threeDoubles = Array(repeating: 0.0, count: 3)
            print("threeDoubles \(threeDoubles)")
            // threeDoubles 是⼀一种 [Double] 数组，等价于 [0.0, 0.0, 0.0]
            
        }
        
        _ = _p00Button(title: "集合") {
            
            struct TimesTable {
                var age: Int = 0
                
                subscript(index: Int) -> Int {
                    get {
                        // 返回⼀一个适当的 Int 类型的值
                        print("get = \(index) ")
                        return age*2
                    }
                    set(newValue) {
                        print("set = \(newValue) ")
                        age = newValue;
                    }
                    
                }
            }
            
            let threeTimesTable = TimesTable()
            
            print("six times three is \(threeTimesTable[3])") // 打印“six times three is 18”
            
        }
        
        _ = _p00Button(title: "log") {
            
            // 2. 创建Logger实例
            if #available(iOS 14.0, *) {
                let logger = Logger()
                
                // 3. 使用log函数
                logger.log(level: .debug, "test")
                logger.log(level: .info, "test")
                logger.log(level: .default, "test")
                logger.log(level: .error, "test")
                logger.log(level: .fault, "test")
            } 
            
            
        }
        
        
        
        
        containerView.snp.makeConstraints { make in
            make.bottom.equalTo(lastBottom)
        }
    }
    
    func _test01() -> Void{
        _ = _p00Button(title: "单例解析") {
            
            //            let map :[String : Any] = ["name":"jim","age":10,"sex":1]
            //
            //            guard let data = try? JSONSerialization.data(withJSONObject: map as Any, options: .prettyPrinted) else {
            //                return
            //            }
            let jsonData = """
             {"name":"jim","age":10,"sex":1}
            """
            let data = jsonData.data(using:.utf8)!;
            
            
            let user :UserInfo = try! JSONDecoder().decode(UserInfo.self, from: data);
            print("单例对象 user = \(user.name ?? "name null")")
            print("单例对象 switch = \(String(describing: user.switch))")
            print("单例对象 UserInfo.shared = \(UserInfo.shared.name ?? "name null")")
            
            let jsonE =  JSONEncoder();
            jsonE.outputFormatting = .prettyPrinted
            let data2 = try! jsonE.encode(user)
            let json = String(data: data2, encoding: .utf8)
            print("单例对象 json = \(json ?? "json 空")")
            
        }
    }
    
    func _test02() -> Void{
        _ =  _p00Button( title: "按钮2") {
            print("按钮=====")
        }
        _ =  _p00Button(title: "按钮3", handler: nil)
        
    }
    
    func _test03() -> Void{
        
        _ = _p00Button(title: "枚举") {
            enum Direction {
                case north
                case south
                case east, west
            }
            let obj :Direction = .north
            print(obj)
            var dir = Direction.west
            print(dir)
            dir = Direction.east
            print(dir)
            dir = Direction.north
            print(dir)
            
            enum Number: NSString, CaseIterable {
                case one = "一"
                case two = "二"
                case three = "三"
                case four = "四"
                init?(val: String) {
                    
                    switch val {
                    
                    case "1":
                        self = .one
                    default:
                        return nil
                    }
                }
            }
            let suit = Number.one
            print(suit, suit.rawValue)
            let suit2 =  Number(val:"1")
            print("suit2======")
            print(suit2 ?? "aaa")
            
            
            /// 必须实现 CaseIterable 才有allCases
            let allCases = Number.allCases
            print("allCases = \(Number.allCases)")
            for i in allCases {
                print("allCases i = ", i)
            }
            
            
            enum Barcode {
                case upc(Int, Int)
                case qrCode(String)
            }
            
            var productBarcode = Barcode.upc(8, 85909)
            print("productBarcode = \(productBarcode)")
            
            
            productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
            print("productBarcode = \(productBarcode)")
            
            
            switch productBarcode {
            case .upc(let numberSystem, let manufacturer):
                print("UPC: \(numberSystem), \(manufacturer).")
            case .qrCode(let productCode):
                print("QR code: \(productCode).")
            }
            // 打印“QR code: ABCDEFGHIJKLMNOP.”
        }
    }
    
    func _test03_1() -> Void{
        
        _ = _p00Button(title: "枚举-关联值") {
            
            enum Score {
                case points(Int)
                case grade(Character)
            }
            
            var score = Score.points(96)
            score = .grade("A")
            
            switch score {
            case let .points(i):
                print(i, "Points")
            case let .grade(i):
                print(i, "grade")
            }
            
            
            //            guard let number = Int("123A") else {
            //                print("字符串转换整数失败")
            ////                return;
            //            }
            //            print("字符串转换整数成功: \(number)")
            
            
            let number2 = Int("123A");
            
            print("字符串转换整数成功: \(number2 ?? 0)")
        }
    }
    
    func _test04() -> Void{
        _ = _p00Button(title: "json解析") {
            
            let path = Bundle.main.path(forResource: "test", ofType: "json");
            if ( path?.count ?? 0 == 0){
                print("path 不存在")
                return
            }
            let url = URL(fileURLWithPath: path!)
            do {
                
                let data = try Data(contentsOf: url)
                
                let jsonData = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                
                let jsonArr = jsonData as! NSArray
                
                for dict in jsonArr {
                    print("dict = ",dict)
                    
                }
                
                let json = try JSON(data: data)
                print("json = ",json[0]["name"])
                
                guard let data1 = try? JSONSerialization.data(withJSONObject: jsonData as Any, options: .prettyPrinted) else {
                    
                    return
                }
                let aray :[Person] = try! JSONDecoder().decode([Person].self, from: data1);
                print("aray = \(aray)")
                //                print("aray2 = \(  try JSONEncoder().encode(aray))")
                
                
                // 编码
                let encoder = JSONEncoder()
                encoder.outputFormatting = .prettyPrinted
                guard let encodedData = try? encoder.encode(aray),
                      let jsonText = String(data: encodedData, encoding: .utf8) else {
                    fatalError("`JSON Encode Failed`")
                }
                print("解码 = ",jsonText)
                
                
            }catch let error  {
                print("读取本地数据出现错误!",error)
            }
            
        }
    }
    
    func test_same(_ name : String, _ age : Int) -> Void {
        
    }
    func test_same(_ name : String) -> Void {
        
    }
    func test_same(_ age : Int) -> Void {
        
    }
    
    deinit {
        // 执⾏行行析构过程
        print("被释放了.....")
    }
    
}
