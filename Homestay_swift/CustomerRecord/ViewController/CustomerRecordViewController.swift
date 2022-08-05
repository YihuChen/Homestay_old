//
//  CustomerRecordViewController.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/19.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class CustomerRecordViewController: BaseCustomerTableViewController {
    var segmentView = SegmentButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        loadFakeData()
    }
    
    override func initConfig() {
        super.initConfig()
        
        navView.titleLabel.text = .localized_customer_record_title
    }

    override func createSubviews() {
        super.createSubviews()
        
        view.addSubview(segmentView)
    }
    
    override func addSubviewAttributes() {
        super.addSubviewAttributes()
        navView.layer.shadowOpacity = 0
        
        view.bringSubviewToFront(segmentView)
        segmentView.backgroundColor = UIColor.white
        segmentView.addGrayShadowEffect()
        segmentView.loadSegmentButns(withTitles: [String.localized_all_title, String.localized_not_check_out_yet_title, String.localized_time_search_title])
        segmentView.segButnClickBlock = {(index: Int) -> Bool in
            let isAnimationExecutable = index < 2
            if isAnimationExecutable {
                //TODO 刷新tableView
            } else {
                self.addViewController(TimeSearchViewController())
            }
            return isAnimationExecutable
        }
        segmentView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(navView.snp.bottom)
            make.height.equalTo(LineX(45))
        }
        
        tableView?.snp.remakeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(segmentView.snp.bottom)
        }
    }
}
