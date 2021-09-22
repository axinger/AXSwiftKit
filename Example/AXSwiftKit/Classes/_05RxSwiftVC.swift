//
//  _05RxSwiftVC.swift
//  AXSwiftKit_Example
//
//  Created by 小星星吃KFC on 2021/5/31.
//  Copyright © 2021 axinger. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
//import AXSwiftKit

class _05RxSwiftVC: _00BaseViewController {
    
    var address: String = "" {
        didSet {
            addressSubject.onNext(address)
        }
    }
    var addressSubject = PublishSubject<String>()
    
    
    @objc dynamic var message = "message"
    
    // 在RxSwift中，订阅者都会返回一个Disposable（默认是Disposables），以便使用者可以在后续的操作中，取消此次订阅。
    let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "rx基本用法"
        test_event()
        test_tf()
        test_kvo()
        self._lastBottomConstraints();
    }
    
    
    deinit {
        AXLog.debug("消失...")
    }
    
    //MARK: - 事件
    func test_event() {
        
        
        do {
            
            let btn = UIButton()
            containerView.addSubview(btn)
            btn.backgroundColor = UIColor.blue
            btn.setTitle("btn.rx.tap", for: .normal)
            
            btn.snp.makeConstraints { make in
                make.top.equalTo(self.lastBottom).offset(20)
                make.left.equalToSuperview().offset(10)
                make.right.equalToSuperview().offset(-10)
            }
            
            btn.rx.tap
                .subscribe(onNext: { [unowned self] x in
                    
                    print("按钮点击事件=\(title ?? "")")
                })
                .disposed(by: disposeBag)
            
            self.lastBottom = btn.snp.bottom
        }
    }
    
    //MARK: - UITextField 双向绑定
    func test_tf() {
        
        _ = _label(title: "UITextField.text 赋值也无效")
        let label:UILabel = self._label(title: "UITextField变化")
        let numLabel:UILabel = _label(title: "UITextField变化")
        
        let name:BehaviorRelay<String> = BehaviorRelay(value: "")
        
        let textFiled = UITextField()
        textFiled.placeholder = "请输入用户名"
        textFiled.backgroundColor = .orange
        
        containerView.addSubview(textFiled)
        textFiled.snp.makeConstraints { make in
            make.top.equalTo(self.lastBottom).offset(20)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        lastBottom = textFiled.snp.bottom
        
        
        textFiled.rx.text.orEmpty.changed.subscribe(onNext: { (text) in
            print("textFiled=\(text)")
        }).disposed(by: disposeBag)
        
        //在用户名输入框中按下 return 键
        textFiled.rx.controlEvent(.editingDidEndOnExit).subscribe(onNext: {
            
            textFiled.becomeFirstResponder()
        }).disposed(by: disposeBag)
        
        //在密码输入框中按下 return 键
        textFiled.rx.controlEvent(.editingDidEndOnExit).subscribe(onNext: {
            
            textFiled.resignFirstResponder()
        }).disposed(by: disposeBag)
        
        /**
         .orEmpty 可以将 String? 类型的 ControlProperty 转成 String，省得我们再去解包
         */
        _ = textFiled.rx.textInput <->  name
        _ = textFiled.rx.text.orEmpty <->  name
        
        name.bind(to: label.rx.text).disposed(by: disposeBag)
        
        //        name.asDriver().map{ "当前字数：\($0.count)" }
        //                    .drive(label.rx.text)
        //                    .disposed(by: disposeBag)
        
        name.map { (val) in
            return "字数:\(val.count)"
        }.bind(to: numLabel.rx.text).disposed(by: disposeBag)
        
        
        name.asObservable()
            .subscribe(onNext: { x in
                print("textFiled绑定=\(x)")
            }) .disposed(by: disposeBag)
        
        _ =  _p00Button(title: "textFiled赋值") {
            
            textFiled.text = "textFiled赋值\(Date())"
        }
        
        _=_p00Button(title: "label赋值") {
            label.text = "label赋值\(Date())"
        }
        
        _ = _p00Button(title: "name-get值") {
            
            print(name.value)
        }
        
        _ =  _p00Button(title: "name-set") {
            
            name.accept("name-set\(Date())")
        }
    }
    
    //MARK: - kvo
    func test_kvo(){
        
        self.addressSubject.asObservable().subscribe(onNext: { val in
            
            let str:String = val
            print("addressSubject=\(val),\(str)")
        }).disposed(by: disposeBag)
        
        self.addressSubject.subscribe(onNext: { val in
            
            let str:String = val
            print("addressSubject=\(val),\(str)")
        }).disposed(by: disposeBag)
        
        
        _ = _p00Button(title: "address赋值") {[unowned self] in
            address = "\(Date())"
        }
        
        
        self.rx.observeWeakly(String.self, "message")
            .subscribe(onNext: { (value) in
                print(value ?? "")
                
            }).disposed(by: disposeBag)
        
        _ = _p00Button(title: "message赋值,@objc修饰") {[unowned self] in
            message = "\(Date.init())"
        }
    }
}
