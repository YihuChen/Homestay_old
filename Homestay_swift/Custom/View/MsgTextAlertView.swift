//
//  MsgTextAlertView.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/24.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class MsgTextAlertView: MsgAlertView {
    private var tipLabel = UILabel()

    override func addSubviewAttributes() {
        super.addSubviewAttributes()
        
        addCustomView(tipLabel)
        tipLabel.font = .systemFont(ofSize: 16)
        tipLabel.textColor = Color_9f9f9f
        tipLabel.snp.makeConstraints { (make) in
            make.top.centerX.equalToSuperview()
        }
    }
    
    func setContent(_ content: String, title: String? = nil) {
        tipLabel.text = content
        if title != nil {
            setTitle(title!)
        }
    }
}
