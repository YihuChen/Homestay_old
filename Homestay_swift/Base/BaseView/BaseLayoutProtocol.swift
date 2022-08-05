//
//  BaseViewLayoutProtocol.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/12.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import Foundation

protocol BaseLayoutProtocol {
    func initConfig()
    func createSubviews()
    func addSubviewAttributes()
}

extension BaseLayoutProtocol {
    //optional method
    func initConfig() {
        //init config before create and layout
    }
    
    func createSubviews() {
        //init and add subviews
    }
    
    func addSubviewAttributes() {
        //set layout and appearance
    }
}
