//
//  ViewController.swift
//  todo
//
//  Created by 卓明 on 2017/11/22.
//  Copyright © 2017年 卓明. All rights reserved.
//

import Cocoa
import Alamofire
import Moya

class ViewController: BaseViewController {

    
    
    let UserProvider = MoyaProvider<UserApi>()
    @IBOutlet weak var tfPsw: NSTextField!
    @IBOutlet weak var tfEmail: NSTextField!
    @IBOutlet weak var btnGo: NSButton!
    @IBOutlet weak var lbNoti: NSTextField!
    @IBOutlet weak var btnRemember: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view : \(self)");
        
        self.initUI()
        // Do any additional setup after loading the view.
    }
    
    

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func initUI() -> Void {
        let email = UserDefaults.standard.string(forKey: "email") ?? "";
        let password = UserDefaults.standard.string(forKey: "password") ?? "";
        self.tfEmail.stringValue = email;
        self.tfPsw.stringValue = password;
    }

    @IBAction func goAction(_ sender: NSButton) {
        if (self.tfEmail.stringValue.count>0 && self.tfPsw.stringValue.count>0) {
            
            // 如果勾上了
            if self.btnRemember.state == .on {
                UserDefaults.standard.setValue( self.tfEmail.stringValue , forKey: "email")
                UserDefaults.standard.setValue(self.tfPsw.stringValue , forKey: "password")
            }
            
        UserProvider.request(.login(email:self.tfEmail.stringValue , password: self.tfPsw.stringValue), completion: { (result) in
            switch result {
            case .success(let response):
                print(response);
                let statusCode = response.statusCode
                do {
                    let value:[String:AnyObject] = try response.mapJSON() as! [String : AnyObject];
                    print(value);
                    let statu = value["statu"] as! Int;
                    if statu == 200
                    {
                        let result = value["res"] as! NSDictionary;
                        UserManager.shareInstanse.updateUserInfo(userInfo: result);
                        // 跳转至todo页面
                        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
                        guard let todoWC = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "TodoWindowController")) as? TodoWindowController else {
                            fatalError("Error getting TodoWindowController ")
                        }
                        todoWC.showWindow(self);
                        self.view.window?.isReleasedWhenClosed = true;
                        self.view.window?.close();
                        
                    }else{
                        let msg = value["message"];
                        self.lbNoti.stringValue = msg as! String;
                    }
                    
                }catch{
                    
                }
            case .failure(let error):
                print(error);
            
            }
        })
 
        }else{
            self.lbNoti.stringValue = "账号和密码不可缺";
        }

        
        
        
        
    }
    
    @IBAction func registerAction(_ sender: NSButton) {
        let registerVC:BaseViewController = NSStoryboard.init(name: NSStoryboard.Name(rawValue: "Main"), bundle: Bundle.main).instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "RegisterViewController")) as! BaseViewController;
        
        self.delegate?.push(viewController: registerVC , animation: true)
        
        
    }
    
}

