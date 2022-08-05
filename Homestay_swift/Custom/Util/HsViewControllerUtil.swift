//
//  HsViewControllerUtil.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/9/10.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class HsViewControllerUtil: Any {
    static func fadedIntoViewController(_ viewController: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = .fade
        transition.isRemovedOnCompletion = true
        
        UIApplication.shared.delegate?.window??.rootViewController = viewController
        UIApplication.shared.delegate?.window??.layer.add(transition, forKey: "transition")
    }
}
