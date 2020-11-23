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

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
    
    
    lazy var dataArray : [[String:Any]] = [
        
        [
            "index": 1,
            "title": "ContentViewController",
            "action": {(index : Int)->Void in
                let vc = _01ContentViewController.init()
                self.navigationController?.pushViewController(vc, animated: true)
            },
        ]
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        //        tableView.snp.makeConstraints { (make) in
        //            make.edges.equalTo(UIEdgeInsets.zero)
        //            make.top.equalToSuperview().offset(100)
        //        }
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let action = dataArray[indexPath.row]["action"] as! (Int) -> Void
        action(indexPath.row)
    }
}

