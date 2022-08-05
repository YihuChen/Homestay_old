//
//  HomestayInfoConfirmViewController.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/24.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class HomestayInfoConfirmViewController: BaseViewController {
    private var bgView = UIImageView(image: UIImage(named: "sure_pic"))
    private var titleLabel = UILabel()
    private var typeView = HomestayInfoItemView()
    private var homestayNameView = HomestayInfoItemView()
    private var ownerNameView = HomestayInfoItemView()
    private var contactView = HomestayInfoItemView()
    private var addressView = HomestayInfoItemView()
    private var confirmButn = UIButton()
    private var wrongInfoLabel = UILabel()
    
    private var loginModel = LoginModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        loadInfoData()
        // Do any additional setup after loading the view.
    }
    
    override func initConfig() {
        super.initConfig()
        
        navView.isHidden = true
    }
    
    override func createSubviews() {
        super.createSubviews()
        
        view.addSubview(bgView)
        view.addSubview(titleLabel)
        view.addSubview(typeView)
        view.addSubview(homestayNameView)
        view.addSubview(ownerNameView)
        view.addSubview(contactView)
        view.addSubview(addressView)
        view.addSubview(confirmButn)
        view.addSubview(wrongInfoLabel)
    }
    
    override func addSubviewAttributes() {
        super.addSubviewAttributes()
        
        bgView.snp.makeConstraints { (make) in
            make.center.size.equalToSuperview()
        }
        
        titleLabel.font = .systemFont(ofSize: 18)
        titleLabel.textColor = Color_2b2b2b
        titleLabel.text = .localized_homestay_info_title
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(navView.snp.bottom).offset(LineX(170))
        }
        
        typeView.titleLabel.text = .localized_homestay_type_title
        typeView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(LineX(55))
            make.right.equalToSuperview().offset(-LineX(55))
            make.top.equalTo(titleLabel.snp.bottom).offset(LineX(50))
        }
        
        homestayNameView.titleLabel.text = .localized_homestay_name_title
        homestayNameView.snp.makeConstraints { (make) in
            make.left.right.equalTo(typeView)
            make.top.equalTo(typeView.snp.bottom).offset(LineX(20))
        }
        
        ownerNameView.titleLabel.text = .localized_owner_name_title
        ownerNameView.snp.makeConstraints { (make) in
            make.left.right.equalTo(typeView)
            make.top.equalTo(homestayNameView.snp.bottom).offset(LineX(20))
        }
        
        contactView.titleLabel.text = .localized_contact_title
        contactView.snp.makeConstraints { (make) in
            make.left.right.equalTo(typeView)
            make.top.equalTo(ownerNameView.snp.bottom).offset(LineX(20))
        }
        
        addressView.titleLabel.text = .localized_homestay_address_title
        addressView.snp.makeConstraints { (make) in
            make.left.right.equalTo(typeView)
            make.top.equalTo(contactView.snp.bottom).offset(LineX(20))
        }
        
        confirmButn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        confirmButn.layer.cornerRadius = CGFloat(LineX(25))
        confirmButn.backgroundColor = Color_2189f7
        confirmButn.addBlueShadowEffect()
        confirmButn.setTitleColor(UIColor.white, for: .normal)
        confirmButn.addTarget(self, action: #selector(activate), for: .touchUpInside)
        confirmButn.setTitle(.localized_confirm_activate_title, for: .normal)
        confirmButn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(LineX(35))
            make.right.equalToSuperview().offset(-LineX(35))
            make.height.equalTo(LineX(50))
            make.bottom.equalTo(wrongInfoLabel.snp.top).offset(-LineX(25))
        }
        
        let wrongInfoString = String.localized_wrong_info_title
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
                              NSAttributedString.Key.foregroundColor: Color_707070,
                              NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
                              NSAttributedString.Key.underlineColor: Color_707070] as [NSAttributedString.Key : Any]
        let attributeString = NSAttributedString(string: wrongInfoString, attributes: attributes)
        wrongInfoLabel.attributedText = attributeString
        wrongInfoLabel.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(wrongInfo)))
        wrongInfoLabel.isUserInteractionEnabled = true
        wrongInfoLabel.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-LineX(30))
            } else {
                make.bottom.equalTo(bottomLayoutGuide.snp.top).offset(-LineX(30))
            }
            make.centerX.equalToSuperview()
        }
    }
    
    @objc private func activate() {
        UserDefaults.standard.set(loginModel.placeId, forKey: HOMESTAY_ID)
        UserDefaults.standard.set(loginModel.placeName, forKey: HOMESTAY_NAME)
        UserDefaults.standard.set(true, forKey: LOGIN_FLAG)
        UserDefaults.standard.synchronize()
        
        NotificationCenter.default.post(name: Notification.Name(FADE_INTO_MAINVIEW), object: nil)
    }
    
    @objc private func wrongInfo() {
        //提示联系相关人员？  大概
    }
    
    private func fakeData() {
        typeView.contentLabel.text = "民宿"
        homestayNameView.contentLabel.text = "一米阳光民宿"
        ownerNameView.contentLabel.text = "陈德柱"
        contactView.contentLabel.text = "15067795758"
        addressView.contentLabel.text = "温州市瓯海区茶山街道大罗山下210号"
    }
    
    private func loadInfoData() {
        loginModel = intentData["infoModel"] as! LoginModel
        
        typeView.contentLabel.text = loginModel.placeType
        homestayNameView.contentLabel.text = loginModel.placeName
        ownerNameView.contentLabel.text = loginModel.owner
        contactView.contentLabel.text = loginModel.phone
        addressView.contentLabel.text = loginModel.address
    }
    
    class HomestayInfoItemView: BaseView {
        var titleLabel = UILabel()
        var contentLabel = UILabel()
        
        override func createSubviews() {
            addSubview(titleLabel)
            addSubview(contentLabel)
        }
        
        override func addSubviewAttributes() {
            titleLabel.font = .systemFont(ofSize: 16)
            titleLabel.textColor = Color_707070
            titleLabel.snp.makeConstraints { (make) in
                make.left.centerY.equalToSuperview()
            }
            
            contentLabel.font = .systemFont(ofSize: 16)
            contentLabel.textColor = Color_707070
            contentLabel.numberOfLines = 0
            contentLabel.textAlignment = .right
            contentLabel.text = "-"
            contentLabel.snp.makeConstraints { (make) in
                make.right.equalToSuperview()
                make.top.equalTo(titleLabel)
                make.width.equalTo(LineX(150))
            }
            
            self.snp.makeConstraints { (make) in
                make.bottom.equalTo(contentLabel)
            }
        }
    }
}
