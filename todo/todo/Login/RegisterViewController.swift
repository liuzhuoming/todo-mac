//
//  RegisterViewController.swift
//  todo
//
//  Created by 卓明 on 2017/11/24.
//  Copyright © 2017年 卓明. All rights reserved.
//

import Cocoa

class RegisterViewController: BaseViewController {

    @IBOutlet weak var tfpsw: NSSecureTextField!
    @IBOutlet weak var tfname: NSTextField!
    @IBOutlet weak var tfemail: NSTextField!
    @IBOutlet weak var btnRemember: NSButton!
    @IBOutlet weak var lbNoti: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func initUI() -> Void {
    
        
        
    }
    @IBAction func loginAction(_ sender: Any) {
        self.delegate .pop(viewController: self, animation: true);
    }
 
    @IBAction func registerAction(_ sender: Any) {
    }
    
}
