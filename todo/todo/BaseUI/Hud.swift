//
//  Hud.swift
//  todo
//
//  Created by 刘卓明 on 2017/12/2.
//  Copyright © 2017年 卓明. All rights reserved.
//

import AppKit

class Hud: NSView {
    static let share = Hud.init(frame: NSRect(x: 0, y: 0, width: 300, height: 44));
    var lbInfo:NSTextField!
    
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        lbInfo = NSTextField(labelWithString: "A Label")
        lbInfo.textColor = NSColor.white
        lbInfo.layer?.cornerRadius = 4
        lbInfo.layer?.masksToBounds = true
        lbInfo.drawsBackground = true
        self.addSubview(lbInfo)
        lbInfo.snp.makeConstraints { (make) in
            make.center.equalTo(self);
        }
        
    }
    
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func showInfo(info:String) -> Void {
        self.share.lbInfo.stringValue = "  \(info)  "
        
        self.share.lbInfo.backgroundColor = NSColor(deviceRed: 0.1, green: 0.1, blue: 0.1, alpha: 0.7);
        self.share.showTime(time: 3)
    }
    
    /// 显示
    ///
    /// - Parameter time: 显示时间
    func showTime(time:Int) -> Void {
        self.isHidden = false;
        let superView = self.superview
        if superView?.subviews.last !== self {
            self.removeFromSuperview();
            superView?.addSubview(self);
        }
        if time>0 {
            DispatchQueue.main.asyncAfter(deadline: 9, execute: {
                self.isHidden = true;
            })
        }
    }
    
}
