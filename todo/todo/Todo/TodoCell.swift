//
//  TodoCell.swift
//  todo
//
//  Created by 卓明 on 2017/11/28.
//  Copyright © 2017年 卓明. All rights reserved.
//

import Cocoa

class TodoCell: NSTableCellView {

    @IBOutlet weak var lbContent: NSTextField!
    @IBOutlet weak var btnCheck: NSButton!
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
