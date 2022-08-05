//
//  TimeSearchView.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/21.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

protocol TimeSearchOperationDelegate {
    
}

class TimeSearchView: BaseView {
    private var searchButn = UIButton()
    private var startTimeButn = UIButton()
    private var endTimeButn = UIButton()
    private var clearButn = UIButton()
    private var lineView = UIView()
    
    override func initConfig() {
        addGrayShadowEffect()
        
        backgroundColor = UIColor.white
    }
    
    override func createSubviews() {
        addSubview(searchButn)
        addSubview(startTimeButn)
        addSubview(endTimeButn)
        addSubview(clearButn)
        addSubview(lineView)
    }
    
    override func addSubviewAttributes() {
        
        searchButn.setImage(UIImage(named: "search_small")?.resize(to: CGFloat(LineX(15))), for: UIControl.State.normal)
        searchButn.addTarget(self, action: #selector(operationButnClick(sender:)), for: UIControl.Event.touchUpInside)
        searchButn.snp.makeConstraints { (make) in
            make.left.bottom.height.equalToSuperview()
            make.width.equalTo(LineX(62))
        }
        
        clearButn.setImage(UIImage(named: "delete_small")?.resize(to: CGFloat(LineX(12))), for: UIControl.State.normal)
        clearButn.addTarget(self, action: #selector(operationButnClick(sender:)), for: UIControl.Event.touchUpInside)
        clearButn.snp.makeConstraints { (make) in
            make.right.bottom.height.equalToSuperview()
            make.width.equalTo(LineX(62))
        }
        
        let font = UIFont.systemFont(ofSize: 16)
        let width = String.localized_start_time_search_title.width(forFont: font) + CGFloat(LineX(5))
        startTimeButn.setTitleColor(Color_2b2b2b, for: UIControl.State.selected)
        startTimeButn.setTitleColor(Color_aaaaaa, for: UIControl.State.normal)
        startTimeButn.setTitle(String.localized_start_time_search_title, for: UIControl.State.normal)
        startTimeButn.titleLabel?.font = font
        startTimeButn.addTarget(self, action: #selector(selectTimeButnClick(sender:)), for: UIControl.Event.touchUpInside)
        startTimeButn.snp.makeConstraints { (make) in
            make.left.equalTo(searchButn.snp.right)
            make.bottom.height.equalToSuperview()
            make.width.equalTo(width)
        }
        
        endTimeButn.setTitleColor(Color_2b2b2b, for: UIControl.State.selected)
        endTimeButn.setTitleColor(Color_aaaaaa, for: UIControl.State.normal)
        endTimeButn.setTitle(String.localized_end_time_search_title, for: UIControl.State.normal)
        endTimeButn.titleLabel?.font = font
        endTimeButn.addTarget(self, action: #selector(selectTimeButnClick(sender:)), for: UIControl.Event.touchUpInside)
        endTimeButn.snp.makeConstraints { (make) in
            make.right.equalTo(clearButn.snp.left)
            make.size.bottom.equalTo(startTimeButn)
        }
        
        lineView.backgroundColor = Color_2b2b2b
        lineView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: LineX(23), height: LineX(1)))
        }
    }
    
    @objc private func selectTimeButnClick(sender: UIButton) {
        
    }
    
    @objc private func operationButnClick(sender: UIButton) {
        
    }
}
