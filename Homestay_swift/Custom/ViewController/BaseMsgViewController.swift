//
//  BaseMsgViewController.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/19.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class BaseMsgViewController: BaseViewController {
    var msgView = RevealTextView()
    
    override func createSubviews() {
         super.createSubviews()
         
         view.addSubview(msgView)
     }
     
     override func addSubviewAttributes() {
         super.addSubviewAttributes()
         
         msgView.snp.makeConstraints { (make) in
             make.left.equalToSuperview().offset(LineX(38))
             make.right.equalToSuperview().offset(-LineX(38))
             make.top.equalTo(navView.snp.bottom).offset(LineX(35))
         }
     }
}
