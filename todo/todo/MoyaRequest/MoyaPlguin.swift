//
//  MoyaPlguin.swift
//  todo
//
//  Created by 卓明 on 2017/12/1.
//  Copyright © 2017年 卓明. All rights reserved.
//

import AppKit
import Moya
import Result


/// 对结果处理插件 拦截统一处理网络错误
//  对于status 不是 200 的
final class MoyaResponsePlugin: PluginType
{
//    func willSend(_ request: RequestType, target: TargetType) {
//        print("request...\(request.request?.url)");
//    }
//    func process(_ result: Result<Response, MoyaError>, target: TargetType) -> Result<Response, MoyaError> {
//        
//        switch result {
//        case .success(let response):
//            response.statusCode = 300;
//            let statuCode = response.statusCode
//            if statuCode == 200{
//                print("request success");
//            }else{
//                return result;
//            }
//        case .failure(let error):
//            print("request fail \(error)")
//            return result;
//        }
//    }
}


