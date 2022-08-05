//
//  BaseTableViewController.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/20.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class BaseTableViewController: BaseViewController {
    var tableView: BaseTableView?
    
    override func createSubviews() {
        super.createSubviews()
        
        self.tableView = createTableView()
        view.addSubview(tableView!)
    }
    
    override func addSubviewAttributes() {
        super.addSubviewAttributes()
        view.bringSubviewToFront(navView)   //防止导航栏的一些页面效果被挡住 比如阴影之类的
        
        tableView?.snp.makeConstraints({ (make) in
            make.top.equalTo(navView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        })
    }
    
    func createTableView() -> BaseTableView {
        //MUST OVERRIDE BY SUBCLASS !!!
        //MUST OVERRIDE BY SUBCLASS !!!
        //MUST OVERRIDE BY SUBCLASS !!!
        return BaseTableView(cellInfos: ["defaultCellReuseId": BaseTableViewCell.self])
    }
}
