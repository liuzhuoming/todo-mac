//
//  User.swift
//  todo
//
//  Created by 卓明 on 2017/11/29.
//  Copyright © 2017年 卓明. All rights reserved.
//

import Foundation


class UserManager: NSObject {
    
    static let shareInstanse = UserManager();
    
    var userid = 0
    var name = "no name"
    var email = "no email"
    
    override init() {
        super.init();
        if let userInfo:NSDictionary = UserDefaults.standard.value(forKey: "userInfo") as? NSDictionary {
            self.userid = userInfo["id"] as! Int
            self.name = userInfo["name"] as! String
            self.email = userInfo["email"] as! String
        }
        
    }
    
    func updateUserInfo(userInfo:NSDictionary) -> Void {
        self.userid = userInfo["id"] as! Int
        self.name = userInfo["name"] as! String
        self.email = userInfo["email"] as! String
        UserDefaults.standard.setValue(userInfo, forKey: "userInfo")
    }
    
}
