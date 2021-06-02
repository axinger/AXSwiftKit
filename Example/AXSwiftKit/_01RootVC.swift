//
//  ViewController.swift
//  AXSwiftKit
//
//  Created by axinger on 11/19/2020.
//  Copyright (c) 2020 axinger. All rights reserved.
//

import UIKit
import AXSwiftKit


//typealias ActionHandler = (_ index:Int) -> Void

class _01RootVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //    var actionHandler : ActionHandler?
    
    var actionHandler: ((_ index: Int) -> Void)?
    
    lazy var tableView: UITableView = {
        
        let tempTableView = UITableView (frame: CGRect.zero, style:.plain)
        tempTableView.delegate = self
        tempTableView.dataSource = self
        tempTableView.backgroundColor = UIColor.groupTableViewBackground
        tempTableView.separatorStyle = .singleLine
        tempTableView.tableFooterView = UIView()
        tempTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        return tempTableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        AXLog.debug("自定义打印type=\(type(of: self))")
        AXLog.debug("自定义打印=\(self)")
        //Swift类型自动被模块名设置了名称空间，
        //所以你不需要加一个类的前缀。如果两个来自不同模块的命名冲突了，你可以附加一个模块名到类型命名的前面来消除冲突。
        AXSwiftKit.AXLog.debug("名称空间")
        
        //获取导航栏背景视图
//       let barImageView = self.navigationController?.navigationBar.subviews.first
//        barImageView?.backgroundColor = .orange
        
        self.navigationController?.navigationBar.barTintColor = .orange
        
        title = "Home"
        view.addSubview(tableView)
        tableView.snp.remakeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        
        //        cell.textLabel?.text =  String(format: dataArray[indexPath.row]["title"] as! CVarArg)
        
        cell.textLabel?.text =  String(format: "%d %@",dataArray[indexPath.row]["index"] as! Int , dataArray[indexPath.row]["title"] as! String)
        
        return cell;
    }
    
    // FIXME: 需要修改bug的相关说明
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let action = dataArray[indexPath.row]["action"] as! (Int) -> Void
        action(indexPath.row)
    }
    
    
    // TODO: - AAAA
    func test() -> Void {
        
    }

    // MARK: - 说明文字,带分割线
    lazy var dataArray : [[String:Any]] = [
        
        [
            "index": 01,
            "title": "_01ContentViewController",
            "action": {(index : Int)->Void in
                let vc = _01ContentViewController.init()
                self.navigationController?.pushViewController(vc, animated: true)
            },
        ],
        
        
        [
            "index": 03,
            "title": "_03DBViewController",
            "action": {(index : Int)->Void in
                let vc = _03DBViewController.init()
                self.navigationController?.pushViewController(vc, animated: true)
            },
        ],
        
        [
            "index": 04,
            "title": "_04ReaSwiftVC",
            "action": {(index : Int)->Void in
                let vc = _04ReaSwiftVC.init()
                self.navigationController?.pushViewController(vc, animated: true)
            },
        ],
        [
            "index": 04,
            "title": "rx基础用法",
            "action": {(index : Int)->Void in
                let vc = _05RxSwiftVC.init()
                self.navigationController?.pushViewController(vc, animated: true)
            },
        ],
        [
            "index": 04,
            "title": "_05RxSwiftVC2",
            "action": {(index : Int)->Void in
                let vc = _05RxSwiftVC2.init()
                self.navigationController?.pushViewController(vc, animated: true)
            },
        ],
        [
            "index": 04,
            "title": "_05RxSwiftVC3",
            "action": {(index : Int)->Void in
                let vc = _05RxSwiftVC3.init()
                self.navigationController?.pushViewController(vc, animated: true)
            },
        ],
        
        
    ]
}

