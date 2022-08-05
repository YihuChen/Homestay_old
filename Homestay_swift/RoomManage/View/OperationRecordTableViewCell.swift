//
//  OperationRecordTableViewCell.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/18.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class OperationRecordTableViewCell: BaseTableViewCell {
    private var lineView = UIView()
    private var roundView = UIView()    //半圆
    private var whiteView = UIView()    //把圆遮住一半
    private var grayView = UIView()     //最后一行 遮一下线
    
    //主要的内容显示
    var containerView = UIView()
    var iconView = UIImageView()
    var nameLabel = UILabel()
    var timeLabel = UILabel()
    var contentLabel = UILabel()
    
    override func initConfig() {
        super.initConfig()
        contentView.backgroundColor = Color_f4f4f4
    }
    
    override func createSubviews() {
        contentView.addSubview(lineView)
        contentView.addSubview(containerView)
        contentView.addSubview(roundView)
        contentView.addSubview(whiteView)
        contentView.addSubview(grayView)
        
        contentView.addSubview(iconView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(contentLabel)
    }
    
    override func addSubviewAttributes() {
        lineView.backgroundColor = Color_38adff
        lineView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(LineX(27))
            make.top.bottom.equalToSuperview()
            make.width.equalTo(1)
        }
        
        containerView.addGrayShadowEffect()
        containerView.layer.cornerRadius = 10.0
        containerView.backgroundColor = UIColor.white
        containerView.snp.makeConstraints { (make) in
            make.left.equalTo(lineView.snp.right).offset(LineX(40))
            make.top.equalToSuperview()
            make.right.equalToSuperview().offset(-LineX(15))
            make.height.equalTo(LineX(90))
        }
        
        roundView.addGrayShadowEffect()
        roundView.layer.cornerRadius = CGFloat(LineX(25))
        roundView.backgroundColor = UIColor.white
        roundView.snp.makeConstraints { (make) in
            make.centerY.equalTo(containerView)
            make.left.equalTo(lineView.snp.right).offset(LineX(15))
            make.size.equalTo(LineX(50))
        }
        
        whiteView.backgroundColor = UIColor.white
        whiteView.snp.makeConstraints { (make) in
            make.top.equalTo(roundView)
            make.bottom.equalTo(roundView).offset(LineX(10))
            make.left.equalTo(containerView)
            make.width.equalTo(LineX(30))
        }
        
        grayView.backgroundColor = Color_f4f4f4
        grayView.snp.makeConstraints { (make) in
            make.left.bottom.equalToSuperview()
            make.right.equalTo(roundView.snp.left)
            make.top.equalTo(containerView.snp.bottom).offset(LineX(3))
        }
        
        iconView.snp.makeConstraints { (make) in
            make.center.equalTo(roundView)
            make.size.equalTo(LineX(20))
        }
        
        nameLabel.font = UIFont.systemFont(ofSize: 15)
        nameLabel.textColor = Color_2b2b2b
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(containerView).offset(LineX(20))
            make.left.equalTo(containerView).offset(LineX(30))
        }
        
        timeLabel.font = UIFont.systemFont(ofSize: 14)
        timeLabel.textColor = Color_707070
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel)
            make.right.equalTo(containerView).offset(-LineX(15))
        }
        
        contentLabel.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel)
            make.bottom.equalTo(containerView).offset(-LineX(20))
        }
    }

    override func setDataModel(_ dataModel: Any) {
        let cellModel: OperationRecordModel = dataModel as! OperationRecordModel
        var iconName: String
        switch cellModel.historyType {
        case .insert:
            iconName = "add"
        case .delete:
            iconName = "delete"
        case .modify:
            iconName = "change"
        case .checkIn:
            iconName = "checkIn"
        case .checkOut:
            iconName = "checkOut"
        default:
            PrintDebug("Unknown history type")
            iconName = ""
        }
        iconView.image = UIImage(named: iconName)
        timeLabel.text = Date.convertTimestamp(cellModel.historyTime, intoStringWithformatter: "HH:mm:ss")
        nameLabel.text = cellModel.historyName
        
        var contentString: NSMutableAttributedString
        if cellModel.historyType! == .modify {
            let separtors = cellModel.historyRoom.components(separatedBy: "->")
            let formerName = separtors[0]
            let latterName = separtors[1]
            contentString = NSMutableAttributedString(string: (formerName + " —— " + latterName))
            contentString.addAttributes([NSAttributedString.Key.foregroundColor: Color_aaaaaa],
            range: NSRange(location: 0, length: formerName.count))
            contentString.addAttributes([NSAttributedString.Key.foregroundColor: Color_707070],
            range: NSRange(location: formerName.count, length: contentString.length - formerName.count))
        } else {
            contentString = NSMutableAttributedString(string: cellModel.historyRoom)
            contentString.addAttributes([NSAttributedString.Key.foregroundColor: Color_707070],
                                        range: NSRange(location: 0, length: contentString.length))
        }
        contentString.addAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)],
                                    range: NSRange(location: 0, length: contentString.length))
        contentLabel.attributedText = contentString
    }
    
    func hideBottomLine(_ isLastCell: Bool) {
        grayView.isHidden = !isLastCell
    }
}
