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
        
//        if UserManager.shareInstanse.userid>0 {
//            let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
//            guard let todoWC = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "TodoWindowController")) as? TodoWindowController else {
//                fatalError("Error getting TodoWindowController ")
//            }
//            todoWC.showWindow(self);
//        }else{
            // 跳转至todo页面
            let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
            guard let todoWC = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "LoginWindow")) as? LoginWindow else {
                fatalError("Error getting LoginWindow ")
            }
            todoWC.showWindow(self);
            
//        }
        
        
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    
    

}

