//
//  RoomEditView.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/18.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class RoomEditView: BaseView {
    private var editButn = UIButton()
    private var deleteButn = UIButton()
    
    override func initConfig() {
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        layer.cornerRadius = 10.0
    }
    
    override func createSubviews() {
        addSubview(editButn)
        addSubview(deleteButn)
    }
    
    override func addSubviewAttributes() {
        editButn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        editButn.layer.cornerRadius = 25.0
        editButn.backgroundColor = Color_38adff
        editButn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        editButn.setTitle(.localized_room_modify_title, for: UIControl.State.normal)
        editButn.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(LineX(13))
            make.size.equalTo(LineX(50))
        }
        
        deleteButn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        deleteButn.layer.cornerRadius = 25.0
        deleteButn.backgroundColor = Color_ed2e3d
        deleteButn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        deleteButn.setTitle(.localized_room_delete_title, for: UIControl.State.normal)
        deleteButn.snp.makeConstraints { (make) in
            make.centerX.size.equalTo(editButn)
            make.top.equalTo(editButn.snp.bottom).offset(LineX(13))
        }
    }
    
}
