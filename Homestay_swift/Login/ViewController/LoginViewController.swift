//
//  LoginViewController.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/22.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    private var bgView = UIImageView(image: UIImage(named: "login_pic"))
    private var logoIconView = UIImageView(image: UIImage(named: "logo_icon"))
    private var nameIconView = UIImageView(image: UIImage(named: "logo_icon_word"))
    private var arrowIconView = UIImageView(image: UIImage(named: "logo_nar")?.resize(to: CGFloat(17)))
    private var accountItemView = LoginItemView()
    private var pasdItemView = LoginItemView()
    private var confirmButn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func initConfig() {
        super.initConfig()
        
        navView.isHidden = true
    }
    
    override func addNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(goToMainViewController), name: NSNotification.Name(FADE_INTO_MAINVIEW), object: nil)
    }
    
    override func createSubviews() {
        super.createSubviews()
        
        view.addSubview(bgView)
        view.addSubview(logoIconView)
        view.addSubview(nameIconView)
        view.addSubview(arrowIconView)
        view.addSubview(accountItemView)
        view.addSubview(pasdItemView)
        view.addSubview(confirmButn)
    }
    
    override func addSubviewAttributes() {
        super.addSubviewAttributes()
        
        bgView.snp.makeConstraints { (make) in
            make.center.size.equalToSuperview()
        }
        
        logoIconView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(navView.snp.bottom).offset(LineX(60))
            make.size.equalTo(LineX(75))
        }
        
        if let usedAccount = UserDefaults.standard.string(forKey: USER_ACCOUNT) {
            accountItemView.textField.text = usedAccount
        }
        accountItemView.iconView.image = UIImage(named: "name_icon")?.resize(to: CGFloat(LineX(10)))
        accountItemView.textField.setAttributePlaceholder(content: .localized_input_account_placeholder, font: .systemFont(ofSize: 16), textColor: Color_aaaaaa)
        accountItemView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(LineX(35))
            make.right.equalToSuperview().offset(-LineX(35))
            make.top.equalTo(logoIconView.snp.bottom).offset(LineX(110))
            make.height.equalTo(LineX(35))
        }
        
        pasdItemView.iconView.image = UIImage(named: "key_icon")?.resize(to: CGFloat(LineX(10)))
        pasdItemView.textField.setAttributePlaceholder(content: .localized_input_pasd_placeholder, font: .systemFont(ofSize: 16), textColor: Color_aaaaaa)
        pasdItemView.snp.makeConstraints { (make) in
            make.size.centerX.equalTo(accountItemView)
            make.top.equalTo(accountItemView.snp.bottom).offset(LineX(30))
        }
        
        confirmButn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        confirmButn.layer.cornerRadius = CGFloat(LineX(25))
        confirmButn.backgroundColor = Color_2189f7
        confirmButn.addBlueShadowEffect()
        confirmButn.setTitleColor(UIColor.white, for: .normal)
        confirmButn.addTarget(self, action: #selector(login), for: .touchUpInside)
        confirmButn.setTitle(.localized_login_title, for: .normal)
        confirmButn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(LineX(35))
            make.right.equalToSuperview().offset(-LineX(35))
            make.height.equalTo(LineX(50))
            make.bottom.equalTo(arrowIconView.snp.top).offset(-LineX(40))
        }
        
        nameIconView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            if #available(iOS 11.0, *) {
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-LineX(30))
            } else {
                make.bottom.equalTo(bottomLayoutGuide.snp.top).offset(-LineX(30))
            }
            make.size.equalTo(CGSize(width: CGFloat(LineX(85)), height: CGFloat(LineX(20))))
        }
        
        arrowIconView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(nameIconView.snp.top).offset(-LineX(10))
        }
    }
    
    @objc private func login() {
        confirmButn.isEnabled = false
        
        let account = accountItemView.textField.text
        let pasd = pasdItemView.textField.text
        if DzStringUtil.isEmptyStringOrNil(account) {
            PrintDebug("请先填写账号")
            confirmButn.isEnabled = true
            return
        }
        if DzStringUtil.isEmptyStringOrNil(pasd) {
            PrintDebug("请先填写密码")
            confirmButn.isEnabled = true
            return
        }
        
        HsNetworkUtil.instance.login(account: account!, pasd: pasd!, success: { (model) in
            let isLoginBefore = UserDefaults.standard.string(forKey: USER_ACCOUNT) != nil

            UserDefaults.standard.set(account, forKey: USER_ACCOUNT)
            UserDefaults.standard.set(pasd?.md5(), forKey: USER_PASSWORD)
            UserDefaults.standard.synchronize()
            if isLoginBefore {
                //存在账户名说明之前登录过 直接去首页
                self.goToMainViewController()
            } else {
                self.addViewController(HomestayInfoConfirmViewController(), data: ["infoModel": model])
            }
            
        }) { (error) in
            //请求失败
            self.confirmButn.isEnabled = true
        }
    }
    
    @objc private func goToMainViewController() {
        let rootViewContrller = BaseNavigationController.init(rootViewController: MainViewController())
        HsViewControllerUtil.fadedIntoViewController(rootViewContrller)
    }
    
    class LoginItemView: BaseView {
        var iconView = UIImageView()
        var textField = UITextField()
        var lineView = UIView()
        
        override func createSubviews() {
            addSubview(iconView)
            addSubview(textField)
            addSubview(lineView)
        }
        
        override func addSubviewAttributes() {
            iconView.snp.makeConstraints { (make) in
                make.left.equalToSuperview()
                make.centerY.equalToSuperview()
                make.size.equalTo(LineX(20))
            }
            
            lineView.backgroundColor = UIColor.white
            lineView.snp.makeConstraints { (make) in
                make.left.right.bottom.equalToSuperview()
                make.height.equalTo(LineX(1))
            }
            
            textField.textColor = .white
            textField.textAlignment = .center
            textField.font = .systemFont(ofSize: 16)
            textField.snp.makeConstraints { (make) in
                make.left.equalTo(iconView.snp.right).offset(LineX(10))
                make.right.equalToSuperview().offset(-LineX(30))
                make.top.bottom.equalToSuperview()
            }
        }
    }
}
