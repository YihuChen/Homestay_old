//
//  RevealRegistrationResultViewController.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/20.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class RegistrationResultViewController: BaseViewController {
    private var resultView = RevealRegistrationResultView()
    private var registrationType = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    override func initConfig() {
        super.initConfig()
        
        registrationType = intentData["type"] as! Int
        self.navView.titleLabel.text = registrationType == 0 ? .localized_check_in_registration_title : .localized_check_out_registration_title
    }
    
    override func createSubviews() {
        super.createSubviews()
        
        view.addSubview(resultView)
    }
    
    override func addSubviewAttributes() {
        super.addSubviewAttributes()
        
        let registrationModel = RegistrationResultModel(registrationType: registrationType, roomName: "001号", customerName: "阿花", time: "2020-07-12\n13:26:32 ")
        let revealModel = RevealInfoModel(msgTitle: registrationType == 0 ? .localized_check_in_success_tip : .localized_check_out_success_tip,
                                          content: registrationModel,
                                          imageName: registrationType == 0 ? "pic_one" : "back_pic",
                                          butnTitle: .localized_back_to_homepage_title)
        
        resultView.setDataModel(revealModel)
        resultView.butnClickBlock = {() -> Void in
            self.navigationController?.popViewController(animated: true)
        }
        resultView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(LineX(38))
            make.right.equalToSuperview().offset(-LineX(38))
            make.top.equalTo(navView.snp.bottom).offset(LineX(35))
        }
    }
}
