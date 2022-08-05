//
//  BaseNavigationController.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/17.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController, UIGestureRecognizerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        interactivePopGestureRecognizer?.delegate = self
        delegate = self
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            interactivePopGestureRecognizer?.isEnabled = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }

}
