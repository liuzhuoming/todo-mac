//
//  AppDelegate.swift
//  todo
//
//  Created by 卓明 on 2017/11/22.
//  Copyright © 2017年 卓明. All rights reserved.
//

import Cocoa


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        // 显示第一个窗口
        WindowManager.shareManager.showFirstWindow();
        
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    
    

}

