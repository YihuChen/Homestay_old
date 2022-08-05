//
//  CheckOutViewController.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/20.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class CheckOutViewController: BaseCustomerTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        loadFakeData()
    }
    
    override func initConfig() {
        super.initConfig()
        
        navView.titleLabel.text = .localized_check_out_registration_title
    }
    
}
