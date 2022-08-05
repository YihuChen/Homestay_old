//
//  CustomerDetailViewController.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/22.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class CustomerDetailViewController: BaseViewController {
    var avatarView = UIImageView()
    var blurView = UIImageView()    //height 435
    var infoView = CustomerInfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func initConfig() {
        super.initConfig()
        
        navView.titleLabel.text = .localized_customer_detail_info_title
    }
    
    override func createSubviews() {
        super.createSubviews()
        
        view.addSubview(avatarView)
        view.addSubview(blurView)
        view.addSubview(infoView)
    }
    
    override func addSubviewAttributes() {
        super.addSubviewAttributes()
        
        avatarView.backgroundColor = UIColor.gray
        avatarView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: CGFloat(LineX(225)), height: CGFloat(LineX(340))))
            make.top.equalTo(navView.snp.bottom).offset(LineX(17.5))
        }
        
        infoView.setDataModel(CustomerRecordModel())
        infoView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(LineX(17.5))
            make.right.equalToSuperview().offset(-LineX(17.5))
            make.top.equalTo(avatarView.snp.bottom)
        }
    }
}
