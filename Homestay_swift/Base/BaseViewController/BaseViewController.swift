//
//  BaseViewController.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/12.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController, BaseLayoutProtocol {
    var navView: NavigationView = NavigationView()
    var intentData: [String: Any] = [String: Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initConfig()
        createSubviews()
        addSubviewAttributes()
        
        addNotifications()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func addNotifications() {
        //...
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func addViewController(_ viewController: BaseViewController) {
        addViewController(viewController, data: nil)
    }
    
    func addViewController(_ viewController: BaseViewController, data: [String: Any]?) {
        if data != nil {
            viewController.intentData = data!
        }
        if navigationController != nil {
            navigationController?.pushViewController(viewController, animated: true)
            return
        }
        PrintDebug("error: empty navgationController")
    }
    
    //BaseLayoutProtocol
    func initConfig() {
        //let subclass to override
        view.backgroundColor = Color_f4f4f4
    }
    
    func createSubviews() {
        self.view.addSubview(navView)
    }
    
    func addSubviewAttributes() {
        let viewControllerCount = self.navigationController?.viewControllers.count ?? 1
        if viewControllerCount == 1 {
            navView.leftButn.isHidden = true
        } else {
            navView.leftButn.addTarget(self, action: #selector(backButnClick), for: UIControl.Event.touchUpInside)
        }
        navView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: Screen_Width, height: NavBarHeight + StatusBarHeight))
        }
    }
    
    @objc func backButnClick() {
        navigationController?.popViewController(animated: true)
    }
}
