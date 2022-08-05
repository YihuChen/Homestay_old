//
//  MainViewController.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/11.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

//那天谁问的UITest需要重置环境？
//let app = XCUIApplication()
//app.launch() // Launches the app (or reboots it/launches it again)
//app.terminate() // Terminates the app (which does not stops the test!)
//app.actviate() // Puts the app in the foreground, if it was backgrounded

class MainViewController: BaseViewController {
    private var registrationView = MainRegistrationView()
    private var functionView = MainFunctionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadRegistrationInfoData()
    }
    
    override func initConfig() {
        super.initConfig()
        
        navView.titleLabel.text = UserDefaults.standard.string(forKey: HOMESTAY_NAME)
        //navView.titleLabel.text = "一米阳光民宿"
    }

    override func createSubviews() {
        super.createSubviews()
        
        view.addSubview(registrationView)
        view.addSubview(functionView)
    }
    
    override func addSubviewAttributes() {
        super.addSubviewAttributes()
        
        registrationView.registrationClickBlock = {
            self.registrationButnClicked(withTag: $0)
        }
        registrationView.snp.makeConstraints { (make) in
            make.top.equalTo(navView.snp.bottom).offset(LineX(15))
            make.left.equalToSuperview().offset(LineX(15))
            make.right.equalToSuperview().offset(-LineX(15))
            make.height.equalTo(LineX(327))
        }
        
        functionView.functionItemClickBlock = {
            self.functionItemClicked(withTag: $0)
        }
        functionView.snp.makeConstraints { (make) in
            make.top.equalTo(registrationView.snp.bottom).offset(LineX(15))
            make.left.right.equalTo(registrationView)
            make.height.equalTo(LineX(200))
        }
    }
    
    private func loadRegistrationInfoData() {
        let homestayID = UserDefaults.standard.string(forKey: HOMESTAY_ID)!
        HsNetworkUtil.instance.manageSearchStatics(homestayID: homestayID, success: { (model) in
            self.registrationView.setDataModel(model)
        })  { (error) in
        }
    }
    
    private func registrationButnClicked(withTag tag: Int) {
        if tag == 1 {
            //TODO check in
        } else {
            addViewController(CheckOutViewController())
        }
    }
    
    private func functionItemClicked(withTag tag: MainFunctionViewTag) {
        var tempController: BaseViewController = BaseViewController()
        switch tag {
            case .checkRoom:
                tempController = RoomManageViewController()
            case .checkCustomer:
                tempController = CustomerRecordViewController()
            case .modifyPasd:
                tempController = ModifyPasdViewController()
            case .aboutUs:
                tempController = AboutUsViewController()
            case .versionUpdate:
                tempController = VersionCheckViewController()
        }
        addViewController(tempController)
    }
}
