//
//  RoomCollectionViewCell.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/17.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class RoomNormalCollectionViewCell: BaseCollectionViewCell {
    private var modifyButn = UIButton()
    private var avatarIconView = UIImageView()
    private var titleLabel = UILabel()
    private var bottomView = UIView()   //辅助布局
    
    override func initConfig() {
        contentView.backgroundColor = UIColor.white
        contentView.layer.cornerRadius = 10.0
    }
    
    override func createSubviews() {
        contentView.addSubview(modifyButn)
        contentView.addSubview(avatarIconView)
        contentView.addSubview(bottomView)
        contentView.addSubview(titleLabel)
    }
    
    override func addSubviewAttributes() {
        modifyButn.setImage(UIImage(named: "more"), for: UIControl.State.normal)
        modifyButn.snp.makeConstraints { (make) in
            make.top.right.equalToSuperview()
            make.size.equalTo(CGSize(width: LineX(35), height: LineX(25)))
        }
        
        avatarIconView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(LineX(30))
            make.centerX.equalToSuperview()
            make.size.equalTo(LineX(45))
        }
        
        bottomView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(avatarIconView.snp.bottom)
        }
        
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = Color_2b2b2b
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(bottomView)
            make.left.equalToSuperview().offset(LineX(20))
            make.right.equalToSuperview().offset(-LineX(20))
        }
    }
    
    override func setDataModel(_ dataModel: Any) {
        let cellModel = dataModel as! RoomModel
        
        titleLabel.text = cellModel.name
        avatarIconView.image = UIImage(named: cellModel.isAvailable ? "man_out" : "man_in")
    }
}
