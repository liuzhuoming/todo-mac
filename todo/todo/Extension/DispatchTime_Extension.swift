//
//  DispatchTime_Extension.swift
//  todo
//
//  Created by 刘卓明 on 2017/12/3.
//  Copyright © 2017年 卓明. All rights reserved.
//

import Foundation
extension DispatchTime: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = DispatchTime.now() + .seconds(value)
    }
}
extension DispatchTime: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self = DispatchTime.now() + .milliseconds(Int(value * 1000))
    }
}

