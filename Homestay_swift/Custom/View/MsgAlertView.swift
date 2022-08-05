//
//  MsgAlertView.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/24.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class MsgAlertView: BaseView {
    private var whiteView = UIView()
    private var titleLabel = UILabel()
    private var lineView = UIView()
    private var contentView = UIView()
    private var confirmButn = UIButton()
    
    private var closeButn = UIButton()
    private var _withCloseButn = false
    
    init(withCloseButn: Bool = false) {
        _withCloseButn = withCloseButn
        
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func createSubviews() {
        addSubview(whiteView)
        addSubview(titleLabel)
        addSubview(lineView)
        addSubview(contentView)
        addSubview(confirmButn)
        
        if _withCloseButn {
            addSubview(closeButn)
        }
    }
    
    override func addSubviewAttributes() {
        if _withCloseButn {
            
        }
        
        whiteView.backgroundColor = .white
        whiteView.layer.cornerRadius = 10.0
        whiteView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(contentView).offset(LineX(50))
        }
        
        titleLabel.font = .systemFont(ofSize: 20)
        titleLabel.textColor = Color_2b2b2b
        titleLabel.text = .localized_tip_title
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(whiteView).offset(LineX(25))
            make.top.equalTo(whiteView).offset(LineX(20))
        }
        
        lineView.backgroundColor = Color_38adff
        lineView.snp.makeConstraints { (make) in
            make.left.equalTo(whiteView).offset(LineX(20))
            make.right.equalTo(whiteView).offset(-LineX(20))
            make.top.equalTo(titleLabel.snp.bottom).offset(LineX(10))
        }
        
        contentView.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom).offset(LineX(25))
            make.left.right.equalToSuperview()
        }
        
        confirmButn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        confirmButn.layer.cornerRadius = CGFloat(LineX(25))
        confirmButn.backgroundColor = Color_2189f7
        confirmButn.addBlueShadowEffect()
        confirmButn.setTitleColor(UIColor.white, for: .normal)
        confirmButn.addTarget(self, action: #selector(confirmClick), for: .touchUpInside)
        confirmButn.setTitle(.localized_confirm_title, for: .normal)
        confirmButn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(LineX(70))
            make.right.equalToSuperview().offset(-LineX(70))
            make.height.equalTo(LineX(50))
            make.bottom.equalTo(whiteView).offset(-LineX(25))
        }
    }
    
    func addCustomView(_ customView: UIView) {
        contentView.addSubview(customView)
        
        contentView.snp.makeConstraints { (make) in
            make.bottom.equalTo(customView)
        }
    }
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
 
    @objc private func confirmClick() {
        
    }
    
    @objc private func concelClick() {
        
    }
}
