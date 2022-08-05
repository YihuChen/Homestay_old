//
//  CheckInViewController.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/22.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class CheckInViewController: BaseViewController {
    private var checkInView = CheckInFormView()
    private var avatarView = UIImageView()
    private var blurView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func initConfig() {
        super.initConfig()
        
        navView.backgroundColor = UIColor.clear
        navView.layer.shadowOpacity = 0
    }
    
    override func createSubviews() {
        super.createSubviews()
        
        view.addSubview(checkInView)
        view.addSubview(avatarView)
    }
    
    override func addSubviewAttributes() {
        super.addSubviewAttributes()
        
        avatarView.backgroundColor = UIColor.gray
        avatarView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(LineX(50))
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: CGFloat(LineX(170)), height: CGFloat(LineX(250))))
        }
        
        checkInView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(LineX(15))
            make.right.equalToSuperview().offset(-LineX(15))
            make.top.equalTo(avatarView.snp.bottom)
        }
    }

}
