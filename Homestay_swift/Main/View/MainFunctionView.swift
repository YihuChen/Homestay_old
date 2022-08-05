//
//  MainFunctionView.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/13.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

enum MainFunctionViewTag: Int {
    case checkRoom = 1
    case checkCustomer = 2
    case modifyPasd = 3
    case aboutUs = 4
    case versionUpdate = 5
    
    static func fromInt(intNumber: Int) -> MainFunctionViewTag? {
        if intNumber == 1 {
            return .checkRoom
        } else if intNumber == 2 {
            return .checkCustomer
        } else if intNumber == 3 {
            return .modifyPasd
        } else if intNumber == 4 {
            return .aboutUs
        } else if intNumber == 5 {
            return .versionUpdate
        } else {
            return nil
        }
    }
}

class MainFunctionView: BaseView {
    public var functionItemClickBlock: ((MainFunctionViewTag) -> Void)?
    
    private var itemViews = NSMutableArray()
    
    override func initConfig() {
        layer.cornerRadius = 10.0
        backgroundColor = UIColor.white
        
        addGrayShadowEffect()
    }
    
    override func createSubviews() {
        var index = 1
        while index <= 5 {
            index += 1
            let itemView = MainFunctionItemView()
            addSubview(itemView)
            itemViews.add(itemView)
        }
    }
    
    override func addSubviewAttributes() {
        let titles = [String.localized_check_room_title, String.localized_check_customer_title,
                        String.localized_change_pasd_title, String.localized_about_us_title, String.localized_version_update_title]
        let imageNames = ["room_icon", "man_icon", "change_icon", "about us_icon", "series_icon"]
        
        var lastView: UIView = self
        for item in itemViews {
            let index = itemViews.index(of: item)
        
            let tempView = item as! MainFunctionItemView
            tempView.tag = index + 1
            tempView.titleLabel.text = titles[index]
            tempView.iconView.image = UIImage(named: imageNames[index])
            tempView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(itemViewClicked(_:))))
            
            //make constraints
            let row = index / 3
            let remainder = tempView.tag % 3
            tempView.snp.makeConstraints { (make) in
                if row != 0 && remainder == 1 {
                    make.top.equalTo(lastView.snp.bottom)
                } else {
                    make.top.equalTo(lastView)
                }
                if remainder == 1 {
                    make.left.equalToSuperview()
                } else {
                    make.left.equalTo(lastView.snp.right)
                }
                make.height.equalToSuperview().dividedBy(2)
                make.width.equalToSuperview().dividedBy(3)
            }
            lastView = tempView
        }
    }
    
    @objc private func itemViewClicked(_ tap: UITapGestureRecognizer) {
        let itemViewTag = MainFunctionViewTag.init(rawValue: tap.view?.tag ?? -1)
        if itemViewTag != nil {
            functionItemClickBlock?(itemViewTag!)
            return
        }
        PrintDebug("fatal error: itemViewClicked unknown viewTag !!!")
    }
    
    class MainFunctionItemView: BaseView {
        var iconView = UIImageView()
        var titleLabel = UILabel()
        
        override func createSubviews() {
            addSubview(iconView)
            addSubview(titleLabel)
        }
        
        override func addSubviewAttributes() {
            iconView.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.top.equalToSuperview().offset(LineX(25))
                make.size.equalTo(LineX(22))
            }
            
            titleLabel.font = UIFont.systemFont(ofSize: 16)
            titleLabel.textColor = Color_707070
            titleLabel.snp.makeConstraints { (make) in
                make.top.equalTo(iconView.snp.bottom).offset(LineX(15))
                make.centerX.equalToSuperview()
            }
        }
    }
}

