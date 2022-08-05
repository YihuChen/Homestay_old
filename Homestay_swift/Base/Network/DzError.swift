//
//  DzError.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/9/2.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import Foundation

struct DzError: Error {
    var code: Int
    var domain: String
    var userInfo: [String: Any]
    
    init(domain: String, code: Int, userInfo: [String: Any]) {
        self.domain = domain
        self.code = code
        self.userInfo = userInfo
    }
}
