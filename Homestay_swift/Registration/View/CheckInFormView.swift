//
//  CheckInFormView.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/22.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class CheckInFormView: BaseView {
    private var whiteView = UIView()
    private var nameItemView = CheckInFormNormalItemView()
    private var idNumberItemView = CheckInFormNormalItemView()
    private var roomNumberItemView = CheckInFormNormalItemView()
    private var timeItemView = CheckInFormTimeItemView()
    private var confirmButn = UIButton()
    
    override func createSubviews() {
        addSubview(whiteView)
        addSubview(confirmButn)
        addSubview(nameItemView)
        addSubview(idNumberItemView)
        addSubview(roomNumberItemView)
        addSubview(timeItemView)
    }
    
    override func addSubviewAttributes() {
        whiteView.backgroundColor = UIColor.white
        whiteView.layer.cornerRadius = 10.0
        whiteView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(timeItemView).offset(LineX(50))
        }
        
        confirmButn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        confirmButn.layer.cornerRadius = CGFloat(LineX(25))
        confirmButn.backgroundColor = Color_2189f7
        confirmButn.addBlueShadowEffect()
        confirmButn.setTitle(.localized_confirm_check_in_title, for: .normal)
        confirmButn.setTitleColor(UIColor.white, for: .normal)
        confirmButn.addTarget(self, action: #selector(confirmButnClick), for: .touchUpInside)
        confirmButn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(LineX(50))
            make.right.equalToSuperview().offset(-LineX(50))
            make.height.equalTo(LineX(50))
            make.bottom.equalTo(whiteView).offset(LineX(25))
        }
        
        let font = UIFont.systemFont(ofSize: 16)
        nameItemView.textField.setAttributePlaceholder(content: .localized_name_title, font: font, textColor: Color_aaaaaa)
        nameItemView.snp.makeConstraints { (make) in
            make.left.equalTo(whiteView).offset(LineX(20))
            make.right.equalTo(whiteView).offset(-LineX(20))
            make.top.equalTo(whiteView).offset(LineX(25))
            make.height.equalTo(LineX(45))
        }
        
        idNumberItemView.textField.setAttributePlaceholder(content: .localized_id_card_title, font: font, textColor: Color_aaaaaa)
        idNumberItemView.snp.makeConstraints { (make) in
            make.size.centerX.equalTo(nameItemView)
            make.top.equalTo(nameItemView.snp.bottom).offset(LineX(15))
        }
        
        roomNumberItemView.textField.setAttributePlaceholder(content: .localized_room_number_title, font: font, textColor: Color_aaaaaa)
        roomNumberItemView.snp.makeConstraints { (make) in
            make.size.centerX.equalTo(nameItemView)
            make.top.equalTo(idNumberItemView.snp.bottom).offset(LineX(15))
        }
        
        timeItemView.snp.makeConstraints { (make) in
            make.size.centerX.equalTo(nameItemView)
            make.top.equalTo(roomNumberItemView.snp.bottom).offset(LineX(15))
        }
        
        self.snp.makeConstraints { (make) in
            make.bottom.equalTo(confirmButn)
        }
    }
    
    @objc private func confirmButnClick() {
        
    }
    
    class CheckInFormNormalItemView: BaseView {
        var textField = UITextField()
        
        override func initConfig() {
            backgroundColor = Color_f4f4f4
            layer.cornerRadius = 10
        }
        
        override func createSubviews() {
            addSubview(textField)
        }
        
        override func addSubviewAttributes() {
            textField.font = UIFont.systemFont(ofSize: 16)
            textField.textColor = Color_2b2b2b
            textField.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(LineX(20))
                make.right.equalToSuperview().offset(-LineX(20))
                make.top.bottom.equalToSuperview()
            }
        }
    }
    
    class CheckInFormTimeItemView: BaseView {
        var dateLabel = UILabel()
        var timeLabel = UILabel()
        var lineView = UIView()
        
        override func initConfig() {
            backgroundColor = Color_f4f4f4
            layer.cornerRadius = 5.0
        }
        
        override func createSubviews() {
            addSubview(dateLabel)
            addSubview(timeLabel)
            addSubview(lineView)
        }
        
        override func addSubviewAttributes() {
            dateLabel.font = UIFont.systemFont(ofSize: 16)
            dateLabel.textColor = Color_2b2b2b
            dateLabel.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(LineX(20))
                make.centerY.equalToSuperview()
            }
            
            timeLabel.font = UIFont.systemFont(ofSize: 16)
            timeLabel.textColor = Color_2b2b2b
            timeLabel.snp.makeConstraints { (make) in
                make.right.equalToSuperview().offset(-LineX(20))
                make.centerY.equalToSuperview()
            }
            
            lineView.frame = CGRect(x: 0, y: 0, width: 1, height: CGFloat(LineX(20)))
            lineView.drawDashLine(color: Color_2b2b2b, width: 1, lineType: .vertical)
            lineView.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
                make.size.equalTo(CGSize(width: 1, height: CGFloat(LineX(20))))
            }
        }
    }
}
