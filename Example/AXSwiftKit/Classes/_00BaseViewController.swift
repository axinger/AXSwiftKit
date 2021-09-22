//
//  _00BaseViewController.swift
//  AXSwiftKit_Example
//
//  Created by 小星星吃KFC on 2020/12/16.
//  Copyright © 2020 axinger. All rights reserved.
//

import UIKit
//import SnapKit
//import SwiftyJSON
import ReactiveSwift
import ReactiveCocoa
class _00BaseViewController: UIViewController {
    
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
    
    
    func _lastBottomConstraints() {
        containerView.snp.makeConstraints { make in
            make.bottom.equalTo(lastBottom)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "00Base"
        view.backgroundColor = UIColor.white
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets.zero)
        }
        
        containerView.snp.makeConstraints { make in
            make.width.height.equalTo(scrollView)
        }
    }
    
    
    func _p00Button(title: String?, handler: (() -> Void)?) -> UIButton {
        var title = title
        if (title?.count ?? 0) == 0 {
            title = "title"
        }
        let btn = UIButton()
        containerView.addSubview(btn)
        btn.backgroundColor = UIColor.blue
        btn.setTitle(title, for: .normal)
        
        btn.snp.makeConstraints { make in
            make.top.equalTo(self.lastBottom).offset(20)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        /// 按钮事件
        btn.reactive.controlEvents(UIControl.Event.touchUpInside).observeResult { (_: Result<UIButton, Never>) in
            //            let btn = try? obj.get()
            //            print(btn ?? "按钮事件错误")
            handler?()
        }
        self.lastBottom = btn.snp.bottom
        
        return btn;
    }
    
    func _label(title: String?) -> UILabel {
        var title = title
        if (title?.count ?? 0) == 0 {
            title = "title"
        }
        let label = UILabel()
        containerView.addSubview(label)
        label.backgroundColor = UIColor.blue
        label.text = title
        
        label.snp.makeConstraints { make in
            make.top.equalTo(self.lastBottom).offset(20)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        self.lastBottom = label.snp.bottom
        
        return label;
    }
    
}
