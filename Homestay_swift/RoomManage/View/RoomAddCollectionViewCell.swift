//
//  RoomAddCollectionViewCell.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/17.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class RoomAddCollectionViewCell: BaseCollectionViewCell {
    private var addButn = UIButton()
    
    override func initConfig() {
        contentView.backgroundColor = UIColor.white
        contentView.layer.cornerRadius = 10.0
    }
    
    override func createSubviews() {
        contentView.addSubview(addButn)
    }
    
    override func addSubviewAttributes() {
        addButn.setImage(UIImage(named: "add_room"), for: UIControl.State.normal)
        addButn.snp.makeConstraints { (make) in
            make.center.size.equalToSuperview()
        }
    }
    
}
