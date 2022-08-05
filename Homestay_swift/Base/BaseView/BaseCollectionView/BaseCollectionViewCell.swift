//
//  BaseCollectionViewCell.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/17.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell, BaseLayoutProtocol {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initConfig()
        createSubviews()
        addSubviewAttributes()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //BaseLayoutProtocol
    func initConfig() {
        //
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
