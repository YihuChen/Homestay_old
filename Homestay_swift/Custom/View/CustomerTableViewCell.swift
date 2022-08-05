//
//  CustomerTableViewCell.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/18.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class CustomerTableViewCell: BaseTableViewCell {
    private var containerView = UIView()
    private var avatarView = UIImageView()
    private var nameLabel = UILabel()
    private var roomNumLabel = UILabel()
    private var checkInTimeLabel = UILabel()
    private var checkOutTimeLabel = UILabel()
    
    override func initConfig() {
        super.initConfig()
        contentView.backgroundColor = Color_f4f4f4
    }
    
    override func createSubviews() {
        contentView.addSubview(containerView)
        contentView.addSubview(avatarView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(roomNumLabel)
        contentView.addSubview(checkInTimeLabel)
        contentView.addSubview(checkOutTimeLabel)
    }
    
    override func addSubviewAttributes() {
        //注意 在添加部分圆角之前一定要设置frame 圆角是根据frame进行绘制的
        containerView.frame = CGRect(x: 0, y: 0, width: CGFloat(Screen_Width - LineX(40)), height: CGFloat(LineX(100)))
        containerView.addCorner([.topLeft, .bottomLeft], radii: CGFloat(LineX(10)), backgroundColor: UIColor.white)
        containerView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(LineX(40))
            make.right.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(LineX(12))
        }
        
        avatarView.layer.masksToBounds = true
        avatarView.layer.cornerRadius = CGFloat(LineX(25))
        avatarView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(LineX(15))
            make.centerY.equalTo(containerView)
            make.size.equalTo(LineX(50))
        }
        
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.textColor = Color_2b2b2b
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(containerView).offset(LineX(30))
            make.top.equalTo(containerView).offset(LineX(15))
        }
        
        roomNumLabel.font = UIFont.systemFont(ofSize: 14)
        roomNumLabel.textColor = Color_707070
        roomNumLabel.snp.makeConstraints { (make) in
            make.right.equalTo(containerView).offset(-LineX(15))
            make.top.equalTo(nameLabel)
        }
        
        checkInTimeLabel.font = UIFont.systemFont(ofSize: 14)
        checkInTimeLabel.textColor = Color_9f9f9f
        checkInTimeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(LineX(10))
        }
        
        checkOutTimeLabel.font = UIFont.systemFont(ofSize: 14)
        checkOutTimeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel)
            make.top.equalTo(checkInTimeLabel.snp.bottom).offset(LineX(10))
        }
    }
    
    override func setDataModel(_ dataModel: Any) {
        let cellModel = dataModel as! CustomerRecordModel
        
        avatarView.image = UIImage(named: cellModel.avatar)
        nameLabel.text = cellModel.customerName
        roomNumLabel.text = cellModel.roomNumber
        checkInTimeLabel.text = cellModel.checkInTime
        if cellModel.status == 0 {
            checkOutTimeLabel.textColor = Color_38adff
            checkOutTimeLabel.text = .localized_not_check_out_yet_title
        } else {
            checkOutTimeLabel.textColor = Color_9f9f9f
            checkOutTimeLabel.text = cellModel.checkOutTime
        }
    }
}
