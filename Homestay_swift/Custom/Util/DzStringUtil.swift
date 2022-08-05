//
//  DzStringUtil.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/9/10.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import Foundation

class DzStringUtil: Any {
    static func isEmptyStringOrNil(_ string: String?) -> Bool {
        return string == nil || string == ""
    }
}
