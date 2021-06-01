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

class _05RxSwiftVC: _00BaseViewController {
    
    lazy var phoneLabel:UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.orange
        return label
    }()
    
    lazy var textFiled:UITextField = {
        let tf = UITextField()
        tf.placeholder = "请输入用户名"
        tf.backgroundColor = UIColor.purple
        return tf
    }()
    
//    var name:String? = ""
//    var name:String? = ""
//    var name : BehaviorRelay<String?>
//    let name = PublishSubject<String>()
    
    let name = BehaviorSubject(value: "")
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.rx.observeWeakly(String.self, "name").subscribe(onNext: { (change) in
//            print(change ?? "helloword")
//        }).disposed(by: disposeBag)
        
        self.rx.observe(String.self, "name").map { (val) in
            print(val!)
        }
        
        containerView.addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { make in
            make.top.equalTo(self.lastBottom).offset(20)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(50)
        }
        
        lastBottom = phoneLabel.snp.bottom
        
        containerView.addSubview(textFiled)
        textFiled.snp.makeConstraints { make in
            make.top.equalTo(self.lastBottom).offset(20)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        lastBottom = textFiled.snp.bottom
        
        self.textFiled.rx.text.orEmpty.changed.subscribe(onNext: { (text) in
            print("监听到了 - \(text)")
        }).disposed(by: disposeBag)
        
        // 实现 view -绑定-> model
                
        self.textFiled.rx.text.orEmpty.bind(to: self.name).disposed(by: self.disposeBag)
        
        
//        textFiled.rx.text.bind(to: self.name).disposed(by: disposeBag)
//        (textFiled.rx.text <-> self.name).disposed(by: disposeBag)
        
//        phoneLabel.rx.text.bind(to: self.name).disposed(by: disposeBag)
        
        
//        textFiled.rx.text.orEmpty.bind(to:self.name).disposed(by: disposeBag)
        
//        textFiled.rx.text.orEmpty.bind(to: self.name).disposed(by: disposeBag)
        
//        textFiled.rx.text.bind(to: self.name).disposed(by: disposeBag)
        
        _p00Button(title: "name值") { [self] in
           
            print( try!self.name.value())
        }
        
        _p00Button(title: "name赋值") { [self] in
            
            
        }
        
        _p00Button(title: "phoneLabel赋值") { [self] in
            phoneLabel.text = "我是phoneLabel赋值"
        }
        
        
        _p00Button(title: "phoneTF赋值") { [self] in
            textFiled.text = "我是textFiled赋值"
        }
        
        
        //将用户名与textField做双向绑定
        //               _ =  self.phoneTF.rx.textInput <->  self.phoneText
        
        //将用户信息绑定到label上
        //        phoneText.userinfo.bind(to: phoneLabel.rx.text).disposed(by: disposeBag)
        
        self._lastBottomConstraints();
        
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
