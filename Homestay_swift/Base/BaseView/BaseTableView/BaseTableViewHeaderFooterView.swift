//
//  BaseTableViewHeaderFooterView.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/19.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class BaseTableViewHeaderFooterView: UITableViewHeaderFooterView, BaseLayoutProtocol {
    var bgColorView = UIView()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        initConfig()
        createSubviews()
        addSubviewAttributes()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initConfig() {
        //
    }
    
    func createSubviews() {
        contentView.addSubview(bgColorView)
    }
    
    func addSubviewAttributes() {
        bgColorView.snp.makeConstraints { (make) in
            make.center.size.equalToSuperview()
        }
    }
    
    func setDataModel(_ dataModel: Any) {
        //
    }

}
