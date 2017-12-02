//
//  MoyaForUser.swift
//  todo
//
//  Created by 卓明 on 2017/12/1.
//  Copyright © 2017年 卓明. All rights reserved.
//

import Cocoa
import Moya

public enum UserApi{
    case login(email:String,password:String)
    case register(username:String,password:String,email:String)
}

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
