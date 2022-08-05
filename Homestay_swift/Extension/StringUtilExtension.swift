//
//  StringUtilExtension.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/14.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func width(forFont font: UIFont) -> CGFloat {
        let rect = NSString(string: self).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: font.lineHeight),
                                                       options: .usesLineFragmentOrigin,
                                                       attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(rect.width)
    }
}
