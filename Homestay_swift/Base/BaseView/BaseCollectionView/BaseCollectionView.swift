//
//  BaseCollectionView.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/17.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class BaseCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    var dataArray: NSMutableArray?
    var defaultCellid: String?
    
    init(collectionViewLayout layout: UICollectionViewLayout, cellInfos: [String : AnyClass]) {
        super.init(frame: CGRect.zero, collectionViewLayout: layout)
        
        delegate = self
        dataSource = self
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        //设置默认的cellid
        defaultCellid = cellInfos.keys.first!
        //遍历info。注册cell
        cellInfos.forEach { (key, cellClass) in
            register(cellClass.self, forCellWithReuseIdentifier: key)
        }   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentIdentifier = currentCellid(forItemAt: indexPath)
        let cell: BaseCollectionViewCell  = collectionView.dequeueReusableCell(withReuseIdentifier: currentIdentifier, for: indexPath) as! BaseCollectionViewCell
        
        if indexPath.row >= dataArray?.count ?? 0 {
            PrintDebug("BaseCollectionView setDataModel error : index beyond !!!!")
            return cell
        }
        let dataModel = dataArray?.object(at: indexPath.row)
        if dataModel != nil {
            cell.setDataModel(dataModel!)
        } else {
            PrintDebug("BaseCollectionView setDataModel error : nil dataModel !!!!")
        }
        return cell
    }
    
    func currentCellid(forItemAt indexPath: IndexPath) -> String {
        //should be override by subclass when having more than one cell class
        return defaultCellid!
    }
}
