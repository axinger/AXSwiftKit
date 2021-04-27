//
//  _03DBViewController.swift
//  AXSwiftKit_Example
//
//  Created by 小星星吃KFC on 2021/4/27.
//  Copyright © 2021 axinger. All rights reserved.
//

import UIKit

class _03DBViewController: _00BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "grdb"
        
        _p00Button(title: "创建表") {
            let st = DBStudent.init(name: "jim", nick_name: "jim2", age: 10, gender: true)
            DBStudent.insert(DBStudent: st)
        }
        
        self._lastBottomConstraints();
        
    }
    

    
    

}
