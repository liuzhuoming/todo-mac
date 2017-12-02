//
//  BaseNavigationWindow.swift
//  todo
//
//  Created by 卓明 on 2017/11/28.
//  Copyright © 2017年 卓明. All rights reserved.
//

import Cocoa

class BaseNavigationWindow: NSWindowController,ViewControProtocol {

   
    
    var viewControllers : [BaseViewController]?
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        if let rootvc:BaseViewController = self.contentViewController as? BaseViewController {
            rootvc.delegate = self;
            self.viewControllers = [rootvc];
        }else{
            print("BaseNavigationWindow 请配合 BaseViewController 使用");
        }
        // 初始化
        print("init \(self.className)");
    }
    deinit {
        print("deinit: \(self.className)")
    }
    
    
    
    func push(viewController: BaseViewController, animation: Bool) {
        //如果已经存在了
        var baseRect:CGRect = viewController.view.frame;
        baseRect.origin.x = (self.contentViewController?.view.frame.size.width)!;
        viewController.view.frame = baseRect;
        
        if (!(self.viewControllers?.contains(viewController))!) {
            self.contentViewController?.addChildViewController(viewController)
            viewController.delegate = self;
            self.viewControllers?.append(viewController);
        }
        
        self.contentViewController?.view .addSubview(viewController.view);
        
        NSAnimationContext.runAnimationGroup({ (context:NSAnimationContext) in
            context.duration = 0.38;
            baseRect.origin.x = 0;
            viewController.view.animator().frame = baseRect;
        }, completionHandler: {
            print("push finish");
        });
    }
    
    func pop(viewController: BaseViewController, animation: Bool) {
        if (self.viewControllers?.contains(viewController))! {
            var baseRect:CGRect = viewController.view.frame;
            baseRect.origin.x = (self.contentViewController?.view.frame.size.width)!;
            NSAnimationContext.runAnimationGroup({ (context:NSAnimationContext) in
                context.duration = 0.38;
                viewController.view.animator().frame = baseRect;
            }, completionHandler: {
                print("pop finish");
                viewController.view.removeFromSuperview();
                viewController.removeFromParentViewController();
                self.viewControllers = self.viewControllers!.filter({ (vc:BaseViewController) -> Bool in
                    return vc != viewController
                })
            });
            
            
        }
    }

}
