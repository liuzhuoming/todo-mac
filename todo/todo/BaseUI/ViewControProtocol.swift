//
//  ViewControProtocol.swift
//  todo
//
//  Created by 卓明 on 2017/11/24.
//  Copyright © 2017年 卓明. All rights reserved.
//

import Foundation
import Cocoa

protocol ViewControProtocol {
    
    /// 返回上一级
    ///
    /// - Parameter viewController: 需要被弹出的视图
    /// - Parameter animation: 是否有动画
    /// - Returns: 无返回值
    func pop(viewController:BaseViewController,animation:Bool) -> Void
    
    /// 加入一个新的视图
    ///
    /// - Parameter viewController: 需要被加入的新视图
    /// - Parameter animation: 是否有动画
    /// - Returns: 无返回值
    func push(viewController:BaseViewController,animation:Bool) -> Void
}
