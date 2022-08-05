//
//  DzDateExtension.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/9/2.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import Foundation

extension Date {
    static func currentTimestamp() -> String {
        return String(Int(Date().timeIntervalSince1970) * 1000)
    }
    
    static func convertTimestamp(_ timestamp: String, intoStringWithformatter formatter: String = "yyyy-MM-dd HH : mm : ss") -> String {
        let date = Date(timeIntervalSince1970: (Double(timestamp)! / 1000))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        return dateFormatter.string(from: date)
    }
}
