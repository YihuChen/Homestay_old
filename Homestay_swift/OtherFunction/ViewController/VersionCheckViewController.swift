//
//  VersionCheckViewController.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/19.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class VersionCheckViewController: BaseMsgViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //msgView.hideButn()
    }
    
    override func initConfig() {
        super.initConfig()
        
        self.navView.titleLabel.text = .localized_version_update_title
    }
    
    override func addSubviewAttributes() {
        super.addSubviewAttributes()
        
        msgView.setDataModel(RevealInfoModel(msgTitle: "V1.0.1", content: "可更新为V1.0.2", imageName: "update_pic", butnTitle: String.localized_update_title))
    }

}
