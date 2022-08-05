//
//  RegistrationResultView.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/20.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

struct RegistrationResultModel {
    var registrationType = 0    //  0 checkin | 1 checkout
    var roomName = ""
    var customerName = ""
    var time = ""
}

class RevealRegistrationResultView: RevealInfoView {
    private var roomItemView = RegistrationItemView()
    private var nameItemView = RegistrationItemView()
    private var timeItemView = RegistrationItemView()
    
    override func addSubviewAttributes() {
        super.addSubviewAttributes()
        
        let containerView = UIView()
        containerView.addSubview(roomItemView)
        containerView.addSubview(nameItemView)
        containerView.addSubview(timeItemView)
        
        roomItemView.titleLabel.text = .localized_room_number_title
        roomItemView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(LineX(22))
            make.right.equalToSuperview().offset(-LineX(22))
            make.top.equalToSuperview().offset(LineX(25))
        }
        
        nameItemView.titleLabel.text = .localized_name_title
        nameItemView.snp.makeConstraints { (make) in
            make.left.right.equalTo(roomItemView)
            make.top.equalTo(roomItemView.snp.bottom).offset(LineX(20))
        }
        
        timeItemView.snp.makeConstraints { (make) in
            make.left.right.equalTo(roomItemView)
            make.top.equalTo(nameItemView.snp.bottom).offset(LineX(20))
        }
        
        addCustomView(containerView)
        containerView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(timeItemView)
        }
    }
    
    override func setDataModel(_ dataModel: Any) {
        super.setDataModel(dataModel)
        
        let msgModel: RevealInfoModel = dataModel as! RevealInfoModel
        let registrationModel: RegistrationResultModel = msgModel.content as! RegistrationResultModel
        roomItemView.contentLabel.text = registrationModel.roomName
        nameItemView.contentLabel.text = registrationModel.customerName
        timeItemView.titleLabel.text = registrationModel.registrationType == 0 ? .localized_check_in_time_title : .localized_check_out_time_title
        timeItemView.contentLabel.text = registrationModel.time
    }
    
    class RegistrationItemView: BaseView {
        var titleLabel = UILabel()
        var contentLabel = UILabel()
        
        override func createSubviews() {
            addSubview(titleLabel)
            addSubview(contentLabel)
        }
        
        override func addSubviewAttributes() {
            titleLabel.font = UIFont.systemFont(ofSize: 16)
            titleLabel.textColor = Color_2b2b2b
            titleLabel.snp.makeConstraints { (make) in
                make.top.left.equalToSuperview()
            }
            
            contentLabel.numberOfLines = 0
            contentLabel.textAlignment = NSTextAlignment.right
            contentLabel.font = UIFont.systemFont(ofSize: 16)
            contentLabel.textColor = Color_707070
            contentLabel.snp.makeConstraints { (make) in
                make.top.right.equalToSuperview()
            }
            
            self.snp.makeConstraints { (make) in
                make.bottom.equalTo(contentLabel)
            }
        }
    }
}
