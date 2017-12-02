//
//  Todo.swift
//  todo
//
//  Created by 卓明 on 2017/11/28.
//  Copyright © 2017年 卓明. All rights reserved.
//

import Foundation
import Alamofire

/// 同步类型
///
/// - NetFrist: 网络覆盖本地
/// - LocalFrist: 本地覆盖网络
/// - JustWarm: 警告不覆盖
enum SynType {
    case NetFrist
    case LocalFrist
    case JustWarm
}

/// todo模型类
class Todo {
    let id: Int
    var content:String
    var done:Bool
    
    init(id:Int,content:String,done:Bool) {
        self.id = id
        self.content = content
        self.done = done
    }
}



/// todo管理类
class TodoManager: NSObject {
    static let shareInstanse = TodoManager();
    var todoArr = [Todo]()
    
    override init() {
        super.init()
        // 读取本地
        self.readFromLocal();
        // 读取网络
        self.readFromeNet();
        
        
        
    }
    
    func addNewTodo(content:String) -> Void {
        
        todoArr.append(Todo(id: UserManager.shareInstanse.userid, content: content, done: false));
    }
    func deleteTodo(todo:Todo) -> Void {
        // 删除
        todoArr = todoArr.filter() { $0 !== todo }
    }
    
    func saveAtLocal() -> Void {
        var todoDictArr = [NSDictionary]();
        self.todoArr.forEach { (todoModel) in
            todoDictArr.append(["id":todoModel.id,"content":todoModel.content,"done":todoModel.done]);
        }
        if todoDictArr.count>0 {
            //  写入本地
            UserDefaults.standard.set(todoDictArr, forKey: "todos")
        }
        
    }
    
    func readFromLocal() -> Void {
        
        if let todoDictArr:[NSDictionary] = UserDefaults.standard.value(forKey: "todos") as? [NSDictionary] {
            self.todoArr.removeAll();
            todoDictArr.forEach({ (dict) in
                let todoM = Todo.init(id: dict["id"] as! Int, content: dict["content"] as! String, done: dict["done"] as! Bool);
                self.todoArr.append(todoM);
            })
        }
    }
    
    /// 上传到网络
    ///
    /// - Parameter type: 合并类型
    func synWithNet(type:SynType) -> Void {
        
        var local = [NSDictionary]();
        self.todoArr.forEach { (todoModel) in
            if todoModel.id<1{
                local.append(["id":todoModel.id,"content":todoModel.content,"done":todoModel.done]);
            }
        }
      
    }
    
    func readFromeNet() -> Void {
        
    }
    
    
}
