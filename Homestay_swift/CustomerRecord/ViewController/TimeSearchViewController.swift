//
//  TimeSearchViewController.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/21.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class TimeSearchViewController: BaseCustomerTableViewController {
    private var segmentView = SegmentButtonView()
    private var timeSearchView = TimeSearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadFakeData()
    }
    
    override func createSubviews() {
        super.createSubviews()
        
        navView.titleLabel.removeFromSuperview()
        navView.addSubview(segmentView)
        
        view.addSubview(timeSearchView)
    }
    
    override func addSubviewAttributes() {
        super.addSubviewAttributes()
        
        segmentView.loadSegmentButns(withTitles: [String.localized_operation_check_in_title, String.localized_operation_check_out_title])
        segmentView.snp.makeConstraints { (make) in
            make.left.equalTo(navView.leftButn.snp.right)
            make.right.equalToSuperview().offset(-NavBarHeight)
            make.bottom.equalToSuperview()
            make.height.equalTo(NavBarHeight)
        }
        
        view.bringSubviewToFront(timeSearchView)
        timeSearchView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(navView.snp.bottom)
            make.height.equalTo(LineX(45))
        }
        
        tableView?.snp.remakeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(timeSearchView.snp.bottom)
        }
    }
}
