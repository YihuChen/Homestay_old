//
//  BaseCustomerTableViewController.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/21.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class BaseCustomerTableViewController: BaseTableViewController {
    var searchButn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func createSubviews() {
        super.createSubviews()
        
        view.addSubview(searchButn)
    }
    
    override func addSubviewAttributes() {
        super.addSubviewAttributes()
        
        view.bringSubviewToFront(searchButn)
        searchButn.addBlueShadowEffect()
        searchButn.layer.shadowOffset = CGSize(width: 3, height: 3)
        searchButn.layer.shadowOpacity = 0.5
        searchButn.addTarget(self, action: #selector(searchButnClick), for: UIControl.Event.touchUpInside)
        searchButn.setImage(UIImage(named: "quick_search")?.resize(to: CGFloat(LineX(50))), for: UIControl.State.normal)
        searchButn.snp.makeConstraints { (make) in
            make.size.equalTo(LineX(50))
            make.right.equalToSuperview().offset(-LineX(15))
            make.bottom.equalToSuperview().offset(-LineX(40))
        }
    }
    
    override func createTableView() -> BaseTableView {
        let tempTableView = CustomerTableView()
        tempTableView.tableViewCellClickBlock = { indexPath in
            self.addViewController(CustomerDetailViewController())
        }
        
        return tempTableView
    }
    
    @objc private func searchButnClick() {
        addViewController(MainSearchViewController())
    }
    
    func loadFakeData() {
        //fake data
        var dataModel = CustomerRecordModel()
        let dataArray = NSMutableArray()
        dataArray.add(dataModel)
        
        dataModel.status = 1
        dataArray.add(dataModel)
        
        dataModel.customerName = "test name"
        dataArray.add(dataModel)
        
        dataArray.add(dataModel)
        dataArray.add(dataModel)
        
        tableView?.rowDataArray = dataArray
        tableView?.reloadData()
    }
}
