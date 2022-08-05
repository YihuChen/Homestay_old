//
//  AboutUsViewController.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/19.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class AboutUsViewController: BaseMsgViewController {
    
    override func initConfig() {
        super.initConfig()
        
        self.navView.titleLabel.text = .localized_about_us_title
    }
    
    override func addSubviewAttributes() {
        super.addSubviewAttributes()
        
        msgView.butnClickBlock = {() -> Void in
            self.navigationController?.popViewController(animated: true)
        }
        msgView.setDataModel(RevealInfoModel(msgTitle: .localized_about_us_title, content: String.localized_about_us_content, imageName: "about_pic", butnTitle: .localized_back_to_homepage_title))
    }
}
