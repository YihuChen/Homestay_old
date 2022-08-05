//
//  SegmentButtonView.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/19.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class SegmentButtonView: BaseView {
    public var selectIndex = 0
    public var segButnClickBlock: ((Int) -> Bool)?
    
    private var scrollView = UIScrollView()
    private var contentView = UIView()
    private var indicatorView = UIView()
    private var butnArray = NSMutableArray()
    
    override func createSubviews() {
        addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        contentView.addSubview(indicatorView)
    }
    
    override func addSubviewAttributes() {
        scrollView.snp.makeConstraints { (make) in
            make.center.size.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { (make) in
            make.edges.height.equalToSuperview()
        }
        
        indicatorView.backgroundColor = Color_2189f7
        indicatorView.layer.cornerRadius = CGFloat(LineX(2))
        indicatorView.snp.makeConstraints { (make) in
            make.height.equalTo(LineX(4))
            make.width.equalTo(LineX(25))
            make.bottom.equalToSuperview()
        }
    }
    
    func loadSegmentButns(withTitles titles: NSMutableArray) {
        butnArray.removeAllObjects()
        
        var lastView: UIView = contentView
        for item in titles {
            let title = item as! String
            let index = titles.index(of: item)
            let butn = UIButton()
            butn.setTitle(title, for: .normal)
            butn.setTitleColor(Color_2b2b2b, for: .normal)
            butn.addTarget(self, action: #selector(segButnClicked(sender:)), for: .touchUpInside)
            butn.tag = index + 1
            butn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            contentView.addSubview(butn)
            butn.snp.makeConstraints { (make) in
                if index == 0 {
                    make.left.equalToSuperview()
                } else {
                    make.left.equalTo(lastView.snp.right)
                }
                make.height.bottom.equalToSuperview()
                make.width.equalTo(scrollView).dividedBy(titles.count)
            }
            if index == 0 {
                indicatorView.snp.makeConstraints { (make) in
                    make.centerX.equalTo(butn)
                }
            }
            lastView = butn
            butnArray.add(butn)
        }
        contentView.snp.makeConstraints { (make) in
            make.right.equalTo(lastView)
        }
    }
    
    @objc private func segButnClicked(sender: UIButton) {
        let senderIndex = butnArray.index(of: sender)
        if senderIndex == selectIndex { //防止重复点击
            return
        }
        let isExecutable = segButnClickBlock?(senderIndex) ?? true
        if isExecutable {
            selectIndex = senderIndex
            startIndicatorAnimation(withIndex: senderIndex)
        }
    }
    
    private func startIndicatorAnimation(withIndex index: Int) {
        let butn = butnArray.object(at: index) as! UIButton
        indicatorView.snp.remakeConstraints { (make) in
            make.centerX.equalTo(butn)
            make.height.equalTo(LineX(4))
            make.width.equalTo(LineX(25))
            make.bottom.equalToSuperview()
        }
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
}


