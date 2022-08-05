//
//  RoomManageViewController.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/14.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class RoomManageViewController: BaseViewController {
    private var collectionView = RoomCollectionView()
    private var searchButn = UIButton()
    private var dataArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataArray.add(RoomModel())
        dataArray.add(RoomModel(name: "dhsakdhsjadshjakshdaj", isAvailable: false))
        dataArray.add(RoomModel(name: "hhhhhh", isAvailable: true))
        collectionView.dataArray = dataArray
        collectionView.reloadData()
    }
    
    override func initConfig() {
        super.initConfig()
        
        navView.titleLabel.text = .localized_room_manage_title
        navView.addRightButn(content: .localized_operation_record_title, font: UIFont.systemFont(ofSize: 16), color: Color_707070, target: self, selector: #selector(navRightButnClicked))
    }
    
    @objc private func navRightButnClicked() {
        addViewController(OperationRecordViewController())
    }
    
    override func createSubviews() {
        super.createSubviews()
    
        view.addSubview(collectionView)
        view.addSubview(searchButn)
    }
    
    override func addSubviewAttributes() {
        super.addSubviewAttributes()
        view.bringSubviewToFront(navView)
        
        collectionView.backgroundColor = view.backgroundColor
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(navView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        
        view.bringSubviewToFront(searchButn)
        searchButn.addBlueShadowEffect()
        searchButn.layer.shadowOffset = CGSize(width: 3, height: 3)
        searchButn.layer.shadowOpacity = 0.5
        searchButn.addTarget(self, action: #selector(searchButnClick), for: UIControl.Event.touchUpInside)
        searchButn.setImage(UIImage(named: "quick_search")?.resize(to: CGFloat(LineX(50))), for: UIControl.State.normal)
        searchButn.snp.makeConstraints { (make) in
            make.size.equalTo(LineX(50))
            make.right.equalToSuperview().offset(-LineX(15))
            make.bottom.equalToSuperview().offset(-LineX(40))
        }
    }
    
    @objc private func searchButnClick() {
        addViewController(MainSearchViewController())
    }
}
