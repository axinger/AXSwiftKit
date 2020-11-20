//
//  ViewController.swift
//  AXSwiftKit
//
//  Created by axinger on 11/19/2020.
//  Copyright (c) 2020 axinger. All rights reserved.
//

import UIKit
import AXSwiftKit
class ViewController: UIViewController {
    lazy var box = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.addSubview(box)
        box.backgroundColor = .green
        box.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(50)
            make.center.equalTo(self.view.snp.center)
        }
        AXPrint("11111")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

