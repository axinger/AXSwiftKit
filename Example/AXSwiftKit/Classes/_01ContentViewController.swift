//
//  _01ContentViewController.swift
//  AXSwiftKit_Example
//
//  Created by 小星星吃KFC on 2020/11/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

// import ReactiveCocoa
import SnapKit
import UIKit
import SwiftyJSON
class _01ContentViewController: UIViewController {
    lazy var containerView = UIView()
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.orange
        return scrollView
    }()
    
    lazy var lastBottom: SnapKit.ConstraintItem = {
        if #available(iOS 11.0, *) {
            return self.view.safeAreaLayoutGuide.snp.top
        } else {
            return self.view.snp.top
        }
    }()
    
    var hand: ((_ make: Int) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "01Content2"
        view.backgroundColor = UIColor.white
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets.zero)
        }
        
        containerView.snp.makeConstraints { make in
            make.width.height.equalTo(scrollView)
        }
        /// _ 参数
        lastBottom = _test01(lastBottom)
        /// 没有 _ 参数,需要形参
        lastBottom = _test02(lastBottom:lastBottom)
        lastBottom = _test03(lastBottom)
        lastBottom = _test04(lastBottom)
        
        containerView.snp.makeConstraints { make in
            make.bottom.equalTo(lastBottom)
        }
    }
    
    func _p00ButtonTopView(_ lastBottom: SnapKit.ConstraintItem, title: String?, handler: (() -> Void)?) -> SnapKit.ConstraintItem {
        var title = title
        if (title?.count ?? 0) == 0 {
            title = "title"
        }
        let btn = UIButton()
        containerView.addSubview(btn)
        btn.backgroundColor = UIColor.blue
        btn.setTitle(title, for: .normal)
        
        btn.snp.makeConstraints { make in
            make.top.equalTo(lastBottom).offset(20)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        /// 按钮事件
        btn.reactive.controlEvents(UIControl.Event.touchUpInside).observeResult { (_: Result<UIButton, Never>) in
            //            let btn = try? obj.get()
            //            print(btn ?? "按钮事件错误")
            handler?()
        }
        return btn.snp.bottom
    }
    
    func _test01(_ lastBottom: SnapKit.ConstraintItem) -> SnapKit.ConstraintItem {
        return _p00ButtonTopView(lastBottom, title: "按钮1") {
            
            let map :[String : Any] = ["name":"jim","age":10]
            
            guard let data1 = try? JSONSerialization.data(withJSONObject: map as Any, options: .prettyPrinted) else {
                
                return
            }
            let user :UserInfo = try! JSONDecoder().decode(UserInfo.self, from: data1);
            //            UserInfo.shared = user
            print(user.name ?? "null")
            print(UserInfo.shared.name ?? "null")
            
        }
    }
    
    func _test02(lastBottom: SnapKit.ConstraintItem) -> SnapKit.ConstraintItem {
        var lastBottom = lastBottom
        
        lastBottom = _p00ButtonTopView(lastBottom, title: "按钮2") {
            print("按钮=====")
        }
        
        lastBottom = _p00ButtonTopView(lastBottom, title: "按钮3", handler: nil)
        
        return lastBottom
    }
    
    func _test03(_ lastBottom: SnapKit.ConstraintItem) -> SnapKit.ConstraintItem {
        var lastBottom = lastBottom
        
        lastBottom = _p00ButtonTopView(lastBottom, title: "枚举") {
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
            }
            let suit = Number.one
            
            print(suit, suit.rawValue)
            
            /// 必须实现 CaseIterable 才有allCases
            let allCases = Number.allCases
            for i in allCases {
                print("allCases = ", i)
            }
            
        }
        
        return lastBottom
    }
    
    func _test04(_ lastBottom: SnapKit.ConstraintItem) -> SnapKit.ConstraintItem {
        return _p00ButtonTopView(lastBottom, title: "json解析") {
            
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
}
