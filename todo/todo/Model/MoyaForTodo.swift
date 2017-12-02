//
//  MoyaForTodo.swift
//  todo
//
//  Created by 卓明 on 2017/12/1.
//  Copyright © 2017年 卓明. All rights reserved.
//

import Foundation
import Cocoa
import Moya
/*
public enum TodoApi{
    case newsomeTodo(todos:[Todo])
    case New(username:String,password:String,email:String)
}

extension TodoApi : TargetType{
    public var path: String {
        switch self {
        case .newsomeTodo(_):
            return "login"
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
        case .login(let username,let password):
            return .requestParameters(parameters: ["username" : username,"password":password], encoding: URLEncoding.default)
        case .register(let username,let password,let email):
            return .requestParameters(parameters: ["username" : username,"password":password,"email":email], encoding: URLEncoding.default)
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
*/
