//
//  AppDelegate.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/11.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        
//        UserDefaults.standard.set(false, forKey: LOGIN_FLAG)
//        UserDefaults.standard.synchronize()
        
        let isLogin = UserDefaults.standard.bool(forKey: LOGIN_FLAG)
        let rootViewController = isLogin ? MainViewController(): LoginViewController()
        window?.rootViewController = BaseNavigationController.init(rootViewController: rootViewController)
        
        window?.makeKeyAndVisible()
        
        return true
    }


}

