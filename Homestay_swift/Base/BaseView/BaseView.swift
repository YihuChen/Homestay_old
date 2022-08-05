//
//  BaseView.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/12.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class BaseView: UIView, BaseLayoutProtocol {
    init() {
        super.init(frame: CGRect.zero)
        
        initConfig()
        createSubviews()
        addSubviewAttributes()
    }
    
    func initConfig() { }
    func createSubviews() { }
    func addSubviewAttributes() { }
    
    //填充数据
    func setDataModel(_ dataModel: Any) {}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
