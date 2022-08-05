//
//  ModifyPasdViewController.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/19.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class ModifyPasdViewController: BaseViewController {
    var oldPasdField = PasdTextField(placeholder: .localized_enter_origin_pasd_placeholder)
    var newPasdField = PasdTextField(placeholder: .localized_enter_new_pasd_placeholder)
    var confirmPasdField = PasdTextField(placeholder: .localized_enter_confirm_pasd_placeholder)
    var tipLabel = UILabel()
    var confirmButn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initConfig() {
        super.initConfig()
        
        self.navView.titleLabel.text = .localized_change_pasd_title
    }
    
    override func createSubviews() {
        super.createSubviews()
        
        view.addSubview(oldPasdField)
        view.addSubview(newPasdField)
        view.addSubview(confirmPasdField)
        view.addSubview(tipLabel)
        view.addSubview(confirmButn)
    }
    
    override func addSubviewAttributes() {
        super.addSubviewAttributes()
        
        oldPasdField.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(navView.snp.bottom).offset(LineX(15))
            make.height.equalTo(LineX(50))
        }
        
        newPasdField.snp.makeConstraints { (make) in
            make.size.centerX.equalTo(oldPasdField)
            make.top.equalTo(oldPasdField.snp.bottom).offset(LineX(10))
        }
        
        confirmPasdField.snp.makeConstraints { (make) in
            make.size.centerX.equalTo(newPasdField)
            make.top.equalTo(newPasdField.snp.bottom).offset(LineX(1))
        }
        
        tipLabel.textColor = Color_ed2e3d
        tipLabel.font = UIFont.systemFont(ofSize: 16)
        tipLabel.text = .localized_wrong_orign_pasd_tip
        tipLabel.snp.makeConstraints { (make) in
            make.top.equalTo(confirmPasdField.snp.bottom).offset(LineX(15))
            make.right.equalToSuperview().offset(-LineX(15))
        }
        
        confirmButn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        confirmButn.layer.cornerRadius = CGFloat(LineX(25))
        confirmButn.backgroundColor = Color_2189f7
        confirmButn.addBlueShadowEffect()
        confirmButn.setTitle(.localized_confirm_title, for: UIControl.State.normal)
        confirmButn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        confirmButn.addTarget(self, action: #selector(confirmButnClicked), for: UIControl.Event.touchUpInside)
        confirmButn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(LineX(85))
            make.right.equalToSuperview().offset(-LineX(85))
            make.height.equalTo(LineX(50))
            make.top.equalTo(confirmPasdField.snp.bottom).offset(LineX(50))
        }
    }
    
    @objc private func confirmButnClicked() {
        
    }
    
    
    class PasdTextField: BaseView {
        var textField = UITextField()
        //data
        var _placeHolder: String?
        
        init(placeholder: String) {
            _placeHolder = placeholder
            
            super.init()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func initConfig() {
            backgroundColor = UIColor.white
        }
        
        override func createSubviews() {
            addSubview(textField)
        }
        
        override func addSubviewAttributes() {
            textField.isSecureTextEntry = true
            textField.textColor = Color_2b2b2b
            textField.font = UIFont.systemFont(ofSize: 16)
            textField.setAttributePlaceholder(content: _placeHolder!, font: UIFont.systemFont(ofSize: 16), textColor: Color_aaaaaa)
            textField.snp.makeConstraints { (make) in
                make.top.bottom.equalToSuperview()
                make.left.equalToSuperview().offset(LineX(40))
                make.right.equalToSuperview().offset(-LineX(40))
            }
        }
    }
}
