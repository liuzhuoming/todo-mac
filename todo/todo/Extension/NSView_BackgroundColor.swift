//
//  NSView_BackgroundColor.swift
//  todo
//
//  Created by 刘卓明 on 2017/12/3.
//  Copyright © 2017年 卓明. All rights reserved.
//

import AppKit
extension NSView {
    var KbackgroundColor: NSColor? {
        get {
            guard let color = layer?.backgroundColor else { return nil }
            return NSColor(cgColor: color)
        }
        set {
            wantsLayer = true
            layer?.backgroundColor = newValue?.cgColor
        }
    }
}
