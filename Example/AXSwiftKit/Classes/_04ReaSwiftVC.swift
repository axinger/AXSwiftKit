//
//  _04RxSwiftVC.swift
//  AXSwiftKit_Example
//
//  Created by 小星星吃KFC on 2021/5/31.
//  Copyright © 2021 axinger. All rights reserved.
//


import UIKit
//import RxSwift
//import RxCocoa
import ReactiveSwift

class _04ReaSwiftVC: _00BaseViewController {
    
    //    var userName:String = ""
    var userName: MutableProperty<String> = MutableProperty<String>("")
    
    lazy var phoneLabel:UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.orange
        return label
    }()
    
    lazy var phoneTF:UITextField = {
        let tf = UITextField()
        tf.placeholder = "请输入用户名"
        tf.backgroundColor = UIColor.purple
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "RxSwift"
        
        
//        self.reactive.producer(forKeyPath: "name").start { [weak self](val) in
//            print("name变化val=\(val)")
//            print("name变化=\(String(describing: self?.name))")
//        }
        
        containerView.addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { make in
            make.top.equalTo(self.lastBottom).offset(20)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(50)
        }
        
        lastBottom = phoneLabel.snp.bottom
        
        containerView.addSubview(phoneTF)
        phoneTF.snp.makeConstraints { make in
            make.top.equalTo(self.lastBottom).offset(20)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        lastBottom = phoneTF.snp.bottom
        
//        userName <~ phoneTF.reactive.textValues
        userName <~ phoneTF.reactive.continuousTextValues
        
        phoneLabel.reactive.text <~ phoneTF.reactive.continuousTextValues
        phoneLabel.reactive.text <~ phoneTF.reactive.textValues
        
        phoneTF.reactive.continuousTextValues.observeValues { [self](val) in
            print("电话文本=\(val)")
        }
        
        phoneTF.reactive.producer(forKeyPath:"text").start { [self](text) in
            print("phoneTF赋值=\(text),类型=\(type(of: text))")
        }
        
        _p00Button(title: "phoneLabel赋值") { [self] in
            phoneLabel.text = "我是phoneLabel赋值"
        }
        
        
        _p00Button(title: "phoneTF赋值") { [self] in
            phoneTF.text = "我是赋值"
        }
        
        
        _p00Button(title: "userName值") { [self] in
            print("userName=\(String(describing: userName.value)),\(type(of: userName.value))")
        }
        
        
        _p00Button(title: "创建表") {
            print("userName.value=\(String(describing: self.userName.producer))")
        }
        
        self._lastBottomConstraints();
        
    }
    
    
}
