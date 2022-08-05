//
//  MainSearchView.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/21.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class MainSearchView: BaseView {
    public var closeBlock: (() -> Void)?
    private var contentView = UIView()
    private var closeButn = UIButton()
    private var searchIconView = UIImageView(image: UIImage(named: "search")?.resize(to: CGFloat(LineX(12))))
    private var textField = UITextField()
    
    override func initConfig() {
        backgroundColor = Color_38adff
        
        addBlueShadowEffect()
    }
    
    override func createSubviews() {
        addSubview(contentView)
        addSubview(closeButn)
        contentView.addSubview(searchIconView)
        contentView.addSubview(textField)
    }
    
    override func addSubviewAttributes() {
        closeButn.setImage(UIImage(named: "cancel")?.resize(to: CGFloat(LineX(12))), for: UIControl.State.normal)
        closeButn.addTarget(self, action: #selector(closeButnClicked), for: UIControl.Event.touchUpInside)
        closeButn.snp.makeConstraints { (make) in
            make.size.equalTo(LineX(50))
            make.right.equalToSuperview()
            make.centerY.equalTo(contentView)
        }
        
        contentView.backgroundColor = UIColor.white
        contentView.layer.cornerRadius = 15
        contentView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(LineX(15))
            make.bottom.equalToSuperview().offset(-LineX(10))
            make.height.equalTo(30)
            make.right.equalTo(closeButn.snp.left)
        }
        
        searchIconView.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-LineX(10))
            make.centerY.equalToSuperview()
            make.size.equalTo(LineX(12))
        }
        
        textField.textColor = Color_2b2b2b
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.setAttributePlaceholder(content: .localized_input_room_number_placeholder, font: textField.font!, textColor: Color_aaaaaa)
        textField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(LineX(10))
            make.right.equalTo(searchIconView.snp.left).offset(-LineX(10))
            make.top.bottom.equalToSuperview()
        }
    }
    
    @objc private func closeButnClicked() {
        closeBlock?()
    }
}
