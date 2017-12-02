//
//  TodoViewController.swift
//  todo
//
//  Created by 卓明 on 2017/11/28.
//  Copyright © 2017年 卓明. All rights reserved.
//

import Cocoa
import SnapKit

class TodoViewController: BaseViewController,NSTableViewDelegate,NSTableViewDataSource,NSTextFieldDelegate {

    @IBOutlet weak var tfNewTodo: NSTextField!
    var tableView : NSTableView?
    var tableContainerView : NSScrollView?
    weak var todoManager = TodoManager.shareInstanse;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.initUI();
    }
    
    func initUI() -> Void {
        //
        self.view.window?.contentMaxSize = CGSize(width: 450, height: 300);
        // 添加一个可供滚动的容器
        tableContainerView = NSScrollView.init();
        tableContainerView?.hasVerticalScroller = true;
        self.view.addSubview(tableContainerView!);
        tableContainerView?.snp.makeConstraints({ (make) in
            make.bottom.right.equalTo(self.view).offset(-20);
            make.left.equalTo(self.view).offset(20);
            make.top.equalTo(self.tfNewTodo.snp.bottom).offset(20);
            make.height.greaterThanOrEqualTo(44*3);
            make.height.lessThanOrEqualTo(44*5);
        });
        tableContainerView?.autohidesScrollers = true;
        
        // 表格
        tableView = NSTableView.init();
        tableView?.delegate = self;
        tableView?.dataSource = self;
        tableView?.usesStaticContents = true;
        let column = NSTableColumn.init(identifier: NSUserInterfaceItemIdentifier(rawValue: "TodoColumn"));
        tableView?.addTableColumn(column);
        tableView?.register(NSNib(nibNamed: NSNib.Name(rawValue: "TodoCell"), bundle: nil)!, forIdentifier: NSUserInterfaceItemIdentifier(rawValue: "TodoCell"))
        tableContainerView!.addSubview(tableView!);
        tableContainerView?.documentView = tableView;
        tableView?.snp.makeConstraints({ (make) in
            make.edges.equalTo(tableContainerView!);
        })
        
        
        
    }
    
    // tableView delegate
    
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return todoManager?.todoArr.count ?? 0;
    }
   
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var cell:TodoCell?
        
        if let spareView = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier.init("TodoCell"), owner: self) as? TodoCell {
            cell = spareView
        }else{
            cell = self.loadViewFromNib(nibName: "TodoCell") as? TodoCell
        }
        cell?.lbContent.stringValue = (todoManager?.todoArr[row].content)!
        cell?.btnCheck.state = todoManager?.todoArr[row].done == true ? .on:.off
        return cell
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 44;
    }
    
    // textfeil
    override func controlTextDidEndEditing(_ obj: Notification) {
        print(tfNewTodo.stringValue)
        if tfNewTodo.stringValue.count>0 {
            todoManager?.addNewTodo(content: tfNewTodo.stringValue)
        }
        tfNewTodo.stringValue = ""
        tableView?.reloadData()
    }
    
    
    
    
    func loadViewFromNib(nibName:String) -> NSView {
        var topLevelObjects : NSArray?
        Bundle.main.loadNibNamed(NSNib.Name(rawValue: nibName), owner: self, topLevelObjects: &topLevelObjects)
        return (topLevelObjects!.first(where: { $0 is NSView }) as? NSView)!
        
    }

}


