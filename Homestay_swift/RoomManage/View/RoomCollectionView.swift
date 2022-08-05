//
//  RoomCollectionView.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/17.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class RoomCollectionView: BaseCollectionView {
    private let RoomNormalCellid = "RoomNormalCellid"
    private let RoomAddCellid = "RoomAddCellid"
    
    init() {
        let layout = UICollectionViewFlowLayout()
        //流水布局相关设置
        let double_15 = LineX(15)
        let double_10 = LineX(10)
        let float_15 = CGFloat(double_15)
        let float_10 = CGFloat(double_10)
        layout.sectionInset = UIEdgeInsets(top: float_15, left: float_15, bottom: float_15, right: float_15)
        layout.minimumLineSpacing = float_15
        layout.minimumInteritemSpacing = float_10
        layout.itemSize = CGSize(width: (Screen_Width - double_15 * 2 - double_10 * 2) / 3, height: LineX(135))
        
        let cellInfo = [RoomNormalCellid: RoomNormalCollectionViewCell.self, RoomAddCellid: RoomAddCollectionViewCell.self]
        super.init(collectionViewLayout: layout, cellInfos: cellInfo)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = (dataArray?.count ?? 0) + 1
        return count
    }
    
    override func currentCellid(forItemAt indexPath: IndexPath) -> String {
        let cellid = dataArray?.count ?? 0 == indexPath.row ? RoomAddCellid : RoomNormalCellid
        return cellid
    }
}
