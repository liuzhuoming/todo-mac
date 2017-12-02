//
//  BaseViewController.swift
//  todo
//
//  Created by 卓明 on 2017/11/28.
//  Copyright © 2017年 卓明. All rights reserved.
//

import Cocoa

class BaseViewController: NSViewController {

    var delegate : ViewControProtocol!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
        print("init \(self.className)");
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    deinit {
        
        print("deinit: \(self.className)")
    }
    
}
