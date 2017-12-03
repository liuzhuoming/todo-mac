//
//  MoyaForUser.swift
//  todo
//
//  Created by 卓明 on 2017/12/1.
//  Copyright © 2017年 卓明. All rights reserved.
//

import Cocoa
import Moya

// 请求方法名定义
public enum UserApi{
    case login(email:String,password:String)
    case register(username:String,password:String,email:String)
}
// moya 协议规范
extension UserApi : TargetType{
    public var path: String {
        switch self {
        case .login(_,_):
            return "login"
        case .register(_, _, _):
            return "regitster"
        default:
            return ""
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .login(_,_):
            return .post
        case .register(_, _, _):
            return .post
        default:
            return .get
        }
    }
    
    public var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    public var task: Moya.Task {
        switch self {
        case .login(let email,let password):
            return .requestParameters(parameters: ["email" : email,"password":password], encoding: URLEncoding.queryString)
        case .register(let username,let password,let email):
            return .requestParameters(parameters: ["username" : username,"password":password,"email":email], encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }
    
    //请求头
    public var headers: [String: String]? {
        return nil
    }
    
    public var baseURL: URL {
        return URL(string:todoBaseUrl)!
    }
}


struct UserRequest {
    static let provider = MoyaProvider<UserApi>()
    
    static func request(
        _ target: UserApi,
        success successCallback: @escaping (_ resultObj:Any) -> Void,
        error errorCallback: @escaping (Int) -> Void,
        failure failureCallback: @escaping (MoyaError) -> Void
        ) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    //如果数据返回成功则直接将结果转为JSON
                    try response.filterSuccessfulStatusCodes()
                    let json = try response.mapJSON()
                    successCallback(json)
                }
                catch let error {
                    //如果数据获取失败，则返回错误状态码
                    errorCallback((error as! MoyaError).response!.statusCode)
                }
            case let .failure(error):
                //如果连接异常，则返沪错误信息（必要时还可以将尝试重新发起请求）
                //if target.shouldRetry {
                //    retryWhenReachable(target, successCallback, errorCallback,
                //      failureCallback)
                //}
                //else {
                failureCallback(error)
                //}
            }
        }
    }
}










