//
//  TodoWindowController.swift
//  todo
//
//  Created by 卓明 on 2017/11/28.
//  Copyright © 2017年 卓明. All rights reserved.
//

import Cocoa

class TodoWindowController: BaseNavigationWindow {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        self.contentViewController?.view.addSubview(Hud.share);
        Hud.share.snp.makeConstraints { (make) in
            make.width.left.bottom.equalToSuperview();
            make.height.equalTo(44);
        }
    }
    
    

}
