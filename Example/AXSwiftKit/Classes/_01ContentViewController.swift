//
//  _01ContentViewController.swift
//  AXSwiftKit_Example
//
//  Created by 小星星吃KFC on 2020/11/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
//import ReactiveCocoa
import SnapKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "01Content"
        view.backgroundColor = UIColor.white
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.zero)
        }
        
        containerView.snp.makeConstraints { (make) in
            make.width.height.equalTo(scrollView)
        }
        
        lastBottom = _test01(lastBottom)
        lastBottom = _test02(lastBottom)
        
        containerView.snp.makeConstraints { (make) in
            make.bottom.equalTo(lastBottom)
        }
    }
    
    
    func _p00ButtonTopView(_ lastBottom: SnapKit.ConstraintItem, title: String?, handler: @escaping () -> Void) -> SnapKit.ConstraintItem? {
        
        var title = title
        if (title?.count ?? 0) == 0 {
            title = "title"
        }
        let btn = UIButton()
        containerView.addSubview(btn)
        btn.backgroundColor = UIColor.blue
        btn.setTitle(title, for: .normal)
        
        btn.snp.makeConstraints { (make) in
            make.top.equalTo(lastBottom).offset(20)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            
        }
        /// 按钮事件
        btn.reactive.controlEvents(UIControl.Event.touchUpInside).observeResult { (obj : Result<UIButton, Never>) in
            let btn = try? obj.get()
            print(btn ?? "按钮事件错误")
        }
        return btn.snp.bottom
    }
    
    func _test01(_ lastBottom: SnapKit.ConstraintItem) -> SnapKit.ConstraintItem {
        return _p00ButtonTopView(lastBottom, title: "按钮1") {
            
        } ?? self.view.snp.top
    }
    
    func _test02(_ lastBottom: SnapKit.ConstraintItem) -> SnapKit.ConstraintItem {
        var lastBottom = lastBottom
        
        lastBottom =  _p00ButtonTopView(lastBottom, title: "按钮2") {
            
        } ?? self.view.snp.top
        
        lastBottom =  _p00ButtonTopView(lastBottom, title: "按钮3") {
            
        } ?? self.view.snp.top
        
        return lastBottom
    }
}
