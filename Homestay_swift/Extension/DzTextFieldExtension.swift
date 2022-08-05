//
//  TextFieldExtension.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/19.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit
import Foundation

extension UITextField {
    func setAttributePlaceholder(content: String, font: UIFont, textColor: UIColor) {
        let attributes = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: textColor]
        attributedPlaceholder = NSAttributedString(string: content, attributes: attributes)
    }
}

