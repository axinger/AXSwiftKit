//
//  _05RxSwiftVC3.swift
//  AXSwiftKit_Example
//
//  Created by 小星星吃KFC on 2021/6/2.
//  Copyright © 2021 axinger. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class _05RxSwiftVC3: UIViewController {
    
    var tableView:UITableView!
    
    ////导航栏背景视图
    var barImageView:UIView?
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //导航栏背景色为橙色
//        self.navigationController?.navigationBar.barTintColor = .orange
        
        //获取导航栏背景视图
        self.barImageView = self.navigationController?.navigationBar.subviews.first
        
        //创建表格视图
        self.tableView = UITableView(frame: self.view.frame, style:.plain)
        //创建一个重用的单元格
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(self.tableView!)
        
        //初始化数据
        let items = Observable.just(Array(0...100).map{ "这个是条目\($0)"})
        
        //设置单元格数据（其实就是对 cellForRowAt 的封装）
        items.bind(to: tableView.rx.items) { (tableView, row, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
            cell.textLabel?.text = "\(element)"
            return cell
        }
        .disposed(by: disposeBag)
        
        //使用kvo来监听视图偏移量变化
        self.tableView.rx.observe(CGPoint.self, "contentOffset")
            .subscribe(onNext: {[weak self] offset in
                var delta = offset!.y / CGFloat(64) + 1
                delta = CGFloat.maximum(delta, 0)
                self?.barImageView?.alpha = CGFloat.minimum(delta, 1)
            }).disposed(by: disposeBag)
    }
}
