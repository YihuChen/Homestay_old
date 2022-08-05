//
//  CustomerTableView.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/20.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class CustomerTableView: BaseTableView {
    let CustomerRecordCellReuseID = "CustomerTableViewCellReuseID"
    
    init() {
        let cellInfo = [CustomerRecordCellReuseID: CustomerTableViewCell.self]
        super.init(cellInfos: cellInfo)
        
        backgroundColor = Color_f4f4f4
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(LineX(112))
    }
}
