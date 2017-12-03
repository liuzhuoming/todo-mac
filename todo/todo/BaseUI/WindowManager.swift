//
//  WindowManager.swift
//  todo
//
//  Created by 刘卓明 on 2017/12/2.
//  Copyright © 2017年 卓明. All rights reserved.
//

import Foundation
import AppKit

class WindowManager:NSObject  {
    static let shareManager = WindowManager();
    
    override init(){
        super.init();
        
        
    }
    
    func showFirstWindow() -> Void {
        if UserManager.shareInstanse.userid>0 {
            let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
            guard let todoWC = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "TodoWindowController")) as? TodoWindowController else {
                fatalError("Error getting TodoWindowController ")
            }
            todoWC.showWindow(self);
        }else{
            //跳转至todo页面
            let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
            guard let todoWC = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "LoginWindow")) as? LoginWindow else {
                fatalError("Error getting LoginWindow ")
            }
            todoWC.showWindow(self);
            
        }
    }
    
}
