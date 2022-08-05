//
//  MainRegistrationView.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/12.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

//首页登记信息部分
class MainRegistrationView: BaseView {
    public var registrationClickBlock: ((Int) -> Void)?
    
    private var iconView: UIImageView = UIImageView(image: UIImage(named: "main_pic"))
    private var lineView: UIView = UIView()
    private var checkInButn: UIButton = UIButton()
    private var checkOutButn: UIButton = UIButton()
    private var checkInView: MainRegistrationItemView = MainRegistrationItemView()
    private var checkOutView: MainRegistrationItemView = MainRegistrationItemView()
    private var spareRoomView: MainRegistrationItemView = MainRegistrationItemView()
    
    override func initConfig() {
        layer.cornerRadius = 10.0
        backgroundColor = UIColor.white
        
        addGrayShadowEffect()
    }
    
    override func createSubviews() {
        addSubview(iconView)
        
        addSubview(checkInButn)
        addSubview(checkOutButn)
        addSubview(lineView)
        
        addSubview(checkInView)
        addSubview(checkOutView)
        addSubview(spareRoomView)
    }
    
    override func addSubviewAttributes() {
        iconView.snp.makeConstraints { (make) in
            make.top.width.centerX.equalToSuperview()
            make.height.equalTo(LineX(155))
        }
        
        lineView.frame = CGRect(x: 0, y: 0, width: 1, height: LineX(47))
        lineView.drawDashLine(color: Color_2b2b2b, width: 1, lineType: DashLineType.vertical)
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(iconView.snp.bottom).offset(LineX(10))
            make.size.equalTo(CGSize(width: 1, height: LineX(45)))
            make.centerX.equalToSuperview()
        }
        
        checkInButn.setTitle(.localized_check_in_registration_title, for: .normal)
        checkInButn.setTitleColor(Color_2b2b2b, for: .normal)
        checkInButn.tag = 1
        checkInButn.addTarget(self, action: #selector(registrationButnClicked(sender:)), for: .touchUpInside)
        checkInButn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        checkInButn.snp.makeConstraints { (make) in
            make.top.height.equalTo(lineView)
            make.left.equalToSuperview()
            make.right.equalTo(lineView.snp.left)
        }
        
        checkOutButn.setTitle(.localized_check_out_registration_title, for: .normal)
        checkOutButn.setTitleColor(Color_2b2b2b, for: .normal)
        checkOutButn.tag = 2
        checkOutButn.addTarget(self, action: #selector(registrationButnClicked(sender:)), for: .touchUpInside)
        checkOutButn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        checkOutButn.snp.makeConstraints { (make) in
            make.size.centerY.equalTo(checkInButn)
            make.right.equalToSuperview()
        }
        
        checkInView.titleLabel.text = .localized_today_check_in_amount_title
        checkInView.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom)
            make.left.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(3)
        }
        
        checkOutView.titleLabel.text = .localized_today_check_out_amount_title
        checkOutView.snp.makeConstraints { (make) in
            make.left.equalTo(checkInView.snp.right)
            make.size.centerY.equalTo(checkInView)
        }
        
        spareRoomView.titleLabel.text = .localized_spare_room_amount_title
        spareRoomView.snp.makeConstraints { (make) in
            make.left.equalTo(checkOutView.snp.right)
            make.size.centerY.equalTo(checkInView)
        }
    }
    
    @objc private func registrationButnClicked(sender: UIButton) {
        registrationClickBlock?(sender.tag)
    }
    
    override func setDataModel(_ dataModel: Any) {
        let model = dataModel as! StatisticsModel
        
        checkInView.amountLabel.text = String(model.todayCheckin)
        checkOutView.amountLabel.text = String(model.todayCheckout)
        spareRoomView.amountLabel.text = String(model.spareRoom)
    }
    
    class MainRegistrationItemView: BaseView {
        var amountLabel = UILabel()
        var titleLabel = UILabel()
        
        override func createSubviews() {
            addSubview(amountLabel)
            addSubview(titleLabel)
        }
        
        override func addSubviewAttributes() {
            amountLabel.text = "-"
            amountLabel.textColor = Color_2b2b2b
            amountLabel.font = UIFont.systemFont(ofSize: 20)
            amountLabel.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(LineX(30))
                make.centerX.equalToSuperview()
            }
            
            titleLabel.textColor = Color_707070
            titleLabel.font = UIFont.systemFont(ofSize: 15)
            titleLabel.snp.makeConstraints { (make) in
                make.top.equalTo(amountLabel.snp.bottom).offset(LineX(15))
                make.centerX.equalToSuperview()
            }
        }
    }
}

