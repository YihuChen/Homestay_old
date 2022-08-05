//
//  OperationRecordTableSectionHeaderView.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/19.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class OperationRecordTableSectionHeaderView: BaseTableViewHeaderFooterView { //height 45
    private var topLineView = UIView()
    private var bottomLineView = UIView()
    private var iconView = UIImageView(image: UIImage(named: "time_icon"))
    private var timeLabel = UILabel()
    
    override func createSubviews() {
        super.createSubviews()
        
        addSubview(topLineView)
        addSubview(bottomLineView)
        addSubview(iconView)
        addSubview(timeLabel)
    }
    
    override func addSubviewAttributes() {
        super.addSubviewAttributes()
        
        bgColorView.backgroundColor = Color_f4f4f4
        
        topLineView.backgroundColor = Color_38adff
        topLineView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(LineX(27))
            make.top.equalToSuperview()
            make.bottom.equalTo(iconView)
            make.width.equalTo(1)
        }
        
        bottomLineView.backgroundColor = Color_38adff
        bottomLineView.snp.makeConstraints { (make) in
            make.left.width.equalTo(topLineView)
            make.top.equalTo(iconView).offset(LineX(5))
            make.bottom.equalToSuperview()
        }
        
        iconView.backgroundColor = Color_f4f4f4 //图片是透明的 底下的线会显示出来 所以要设置一下颜色
        iconView.snp.makeConstraints { (make) in
            make.centerX.equalTo(topLineView)
            make.top.equalToSuperview().offset(LineX(7.5))
            make.size.equalTo(LineX(20))
        }
        
        timeLabel.font = UIFont.systemFont(ofSize: 16)
        timeLabel.textColor = Color_707070
        timeLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(iconView)
            make.left.equalTo(iconView.snp.right).offset(LineX(7.5))
        }
    }
    
    override func setDataModel(_ dataModel: Any) {
        let sectionModel: OperationRecordSectionModel = dataModel as! OperationRecordSectionModel
        
        topLineView.isHidden = sectionModel.needHideTopline
        timeLabel.text = sectionModel.time
    }
}
