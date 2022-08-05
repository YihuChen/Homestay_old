//
//  MainSearchViewController.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/21.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class MainSearchViewController: BaseCustomerTableViewController {
    var searchView = MainSearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadFakeData()
        // Do any additional setup after loading the view.
    }
    
    override func createSubviews() {
        super.createSubviews()
        
        view.addSubview(searchView)
    }
    
    override func addSubviewAttributes() {
        super.addSubviewAttributes()
        
        searchButn.isHidden = true
        navView.isHidden = true
        
        searchView.closeBlock = { () -> Void in
            self.navigationController?.popViewController(animated: true)
        }
        searchView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(NavBarHeight + StatusBarHeight)
        }
    }

}
