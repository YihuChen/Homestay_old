//
//  BaseTableViewCell.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/18.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell, BaseLayoutProtocol {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initConfig()
        createSubviews()
        addSubviewAttributes()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initConfig() {
        selectionStyle = .none
    }
    
    func createSubviews() {
        //
    }
    
    func addSubviewAttributes() {
        //
    }
    
    func setDataModel(_ dataModel: Any) {
        //
    }
}
