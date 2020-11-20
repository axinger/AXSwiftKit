//
//  _01ContentViewController.swift
//  AXSwiftKit_Example
//
//  Created by 小星星吃KFC on 2020/11/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class _01ContentViewController: UIViewController {

    lazy var topView = UIView()
    lazy var containerView = UIView()
    lazy var scrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.orange
        
        return scrollView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "01Content"
        view.backgroundColor = UIColor.white
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
//
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.zero)
        }

        containerView.snp.makeConstraints { (make) in
            make.width.height.equalTo(scrollView)
        }
        topView = self.view
        topView = _test01(topView: topView)

        containerView.snp.makeConstraints { (make) in
            make.bottom.equalTo(topView.snp.bottom)
        }
    }
    
    func _test01(topView :UIView) -> UIView {
        var topView = topView
        
        let btn = UIButton()
        containerView.addSubview(btn)
        
        btn.setTitle("按钮", for: .normal)
        btn.backgroundColor = UIColor.blue
        btn.snp.makeConstraints { (make) in
            
            if #available(iOS 11.0, *) {
                make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            } else {
                make.top.equalTo(topView.snp.top).offset(20)
            }
            
            make.left.equalTo(10)
            make.right.equalTo(-10)
        }
        
        topView = btn
        return topView
        
    }
}
