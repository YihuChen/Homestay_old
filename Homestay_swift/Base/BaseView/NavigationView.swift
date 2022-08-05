//
//  NavigationView.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/11.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class NavigationView: BaseView {
    var leftButn: UIButton = UIButton()
    var titleLabel: UILabel = UILabel()
    
    override func initConfig() {
        backgroundColor = UIColor.white
        
        addGrayShadowEffect()
    }
     
    override func createSubviews() {
        addSubview(leftButn)
        addSubview(titleLabel)
    }
    
    override func addSubviewAttributes() {
        leftButn.tag = 1
        leftButn.setImage(UIImage.init(imageLiteralResourceName: "back").resize(to: CGFloat(LineX(15))), for: UIControl.State.normal)
        leftButn.snp.makeConstraints{ (make) in
            make.left.bottom.equalToSuperview()
            make.size.equalTo(NavBarHeight)
        }
        
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textColor = Color_2b2b2b
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(leftButn)
        }
    }
    
    func addRightButn(content: String, font: UIFont, color: UIColor, target: Any?, selector: Selector) {
        let rightButn = UIButton()
        addSubview(rightButn)
        rightButn.tag = 2
        rightButn.titleLabel?.font = font
        rightButn.setTitle(content, for: UIControl.State.normal)
        rightButn.setTitleColor(color, for: UIControl.State.normal)
        rightButn.addTarget(target, action: selector, for: UIControl.Event.touchUpInside)
        rightButn.snp.makeConstraints { (make) in
            make.centerY.height.equalTo(leftButn)
            make.right.equalToSuperview()
            make.width.equalTo(content.width(forFont: font) + 30.0)
        }
    }
}
