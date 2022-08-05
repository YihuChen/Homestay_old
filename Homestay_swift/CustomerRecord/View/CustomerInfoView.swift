//
//  CustomerInfoView.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/21.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class CustomerInfoView: BaseView {
    private var nameLabel = UILabel()
    private var lineView = UIView()
    private var eyeButn = UIButton()
    private var idItemView = CustomerInfoItemView()
    private var roomItemView = CustomerInfoItemView()
    private var checkInItemView = CustomerInfoItemView()
    private var checkOutItemView = CustomerInfoItemView()
    
    private var idNum = ""
    
    override func initConfig() {
        backgroundColor = UIColor.white
        layer.cornerRadius = 10.0
        addGrayShadowEffect()
    }
    
    override func createSubviews() {
        addSubview(nameLabel)
        addSubview(lineView)
        addSubview(eyeButn)
        addSubview(idItemView)
        addSubview(roomItemView)
        addSubview(checkInItemView)
        addSubview(checkOutItemView)
    }
    
    override func addSubviewAttributes() {
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        nameLabel.textColor = Color_2b2b2b
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(LineX(40))
            make.top.equalToSuperview().offset(LineX(16))
        }
        
        lineView.backgroundColor = Color_38adff
        lineView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(LineX(25))
            make.right.equalToSuperview().offset(-LineX(25))
            make.top.equalTo(nameLabel.snp.bottom).offset(LineX(10))
            make.height.equalTo(LineX(1))
        }
        
        idItemView.titleLabel.text = .localized_id_card_title
        idItemView.snp.makeConstraints { (make) in
            make.left.equalTo(lineView)
            make.right.equalTo(eyeButn.snp.left).offset(-LineX(5))
            make.top.equalTo(lineView.snp.bottom).offset(LineX(20))
        }
        
        eyeButn.setImage(UIImage(named: "unvisitable")?.resize(to: CGFloat(LineX(20))), for: UIControl.State.normal)
        eyeButn.setImage(UIImage(named: "visitable")?.resize(to: CGFloat(LineX(20))), for: UIControl.State.selected)
        eyeButn.addTarget(self, action: #selector(eyeButnClicked), for: UIControl.Event.touchUpInside)
        eyeButn.snp.makeConstraints { (make) in
            make.right.equalTo(lineView)
            make.size.equalTo(LineX(25))
            make.centerY.equalTo(idItemView)
        }
        
        roomItemView.titleLabel.text = .localized_room_number_title
        roomItemView.snp.makeConstraints { (make) in
            make.left.right.equalTo(lineView)
            make.top.equalTo(idItemView.snp.bottom).offset(LineX(20))
        }
        
        checkInItemView.titleLabel.text = .localized_check_in_time_title
        checkInItemView.snp.makeConstraints { (make) in
            make.left.right.equalTo(lineView)
            make.top.equalTo(roomItemView.snp.bottom).offset(LineX(20))
        }
        
        checkOutItemView.titleLabel.text = .localized_check_out_time_title
        checkOutItemView.snp.makeConstraints { (make) in
            make.left.right.equalTo(lineView)
            make.top.equalTo(checkInItemView.snp.bottom).offset(LineX(20))
        }
        
        self.snp.makeConstraints { (make) in
            make.bottom.equalTo(checkOutItemView).offset(LineX(25))
        }
    }
    
    @objc private func eyeButnClicked() {
        eyeButn.isSelected = !eyeButn.isSelected
        adjustIdNumberContent(fullContent: eyeButn.isSelected)
    }
    
    private func adjustIdNumberContent(fullContent: Bool) {
        if fullContent {     //显示完整的身份证号
            let attributeString = NSMutableAttributedString(string: idNum)
            let wholeRang = NSRange(location: 0, length: attributeString.length)
            let middleRange = NSRange(location: 6, length: 8)
            attributeString.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: wholeRang)
            attributeString.addAttribute(.foregroundColor, value: Color_707070, range: wholeRang)
            attributeString.addAttribute(.foregroundColor, value: Color_2b2b2b, range: middleRange)
            attributeString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue , range: middleRange)
            attributeString.addAttribute(.underlineColor, value: Color_2b2b2b, range: middleRange)
            idItemView.contentLabel.attributedText = attributeString
        } else {
            let resultString = idNum.substring(to: 6) + "********" + idNum.substring(from: 14)
            idItemView.contentLabel.text = resultString
        }
    }
    
    override func setDataModel(_ dataModel: Any) {
        let model = dataModel as! CustomerRecordModel
        
        idNum = model.idNumber
        adjustIdNumberContent(fullContent: false)
        
        nameLabel.text = model.customerName
        roomItemView.contentLabel.text = model.roomNumber
        checkInItemView.contentLabel.text = model.checkInTime
        checkOutItemView.contentLabel.text = model.checkOutTime
    }
    
    class CustomerInfoItemView: BaseView {
        var titleLabel = UILabel()
        var contentLabel = UILabel()
        
        override func createSubviews() {
            addSubview(titleLabel)
            addSubview(contentLabel)
        }
        
        override func addSubviewAttributes() {
            titleLabel.font = UIFont.systemFont(ofSize: 16)
            titleLabel.textColor = Color_707070
            titleLabel.snp.makeConstraints { (make) in
                make.left.equalToSuperview()
                make.centerY.equalToSuperview()
            }
            
            contentLabel.font = UIFont.systemFont(ofSize: 16)
            contentLabel.textColor = Color_707070
            contentLabel.snp.makeConstraints { (make) in
                make.right.equalToSuperview()
                make.centerY.equalToSuperview()
            }
            
            self.snp.makeConstraints { (make) in
                make.bottom.equalTo(titleLabel)
            }
        }
    }
}
