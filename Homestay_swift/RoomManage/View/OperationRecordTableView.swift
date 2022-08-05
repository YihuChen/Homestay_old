//
//  OperationRecordTableView.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/18.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class OperationRecordTableView: BaseTableView {
    private let OperationRecordCellid = "OperationRecordCellid"
    private let OperationRecordSectionid = "OperationRecordSectionid"
    
    init() {
        let cellInfo = [OperationRecordCellid: OperationRecordTableViewCell.self]
        super.init(cellInfos: cellInfo)
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: Screen_Width, height: 18))
        headerView.backgroundColor = Color_f4f4f4
        tableHeaderView = headerView
        
        hasMultipleSection = true
        register(OperationRecordTableSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: OperationRecordSectionid)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView: OperationRecordTableSectionHeaderView? = tableView.dequeueReusableHeaderFooterView(withIdentifier: OperationRecordSectionid) as! OperationRecordTableSectionHeaderView?
        if headerView == nil {
            headerView = OperationRecordTableSectionHeaderView()
        }
        let dataModel = sectionDataArray?.object(at: section)
        if dataModel != nil {
            headerView!.setDataModel(dataModel!)
        }
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: OperationRecordTableViewCell = super.tableView(tableView, cellForRowAt: indexPath) as! OperationRecordTableViewCell
        
        var isLastCell = false
        let isLastSection = indexPath.section == ((sectionDataArray?.count ?? 0) - 1)
        if isLastSection {
            let modelArray = currentDataArray(forSection: indexPath.section)
            isLastCell = indexPath.row == ((modelArray?.count ?? 0) - 1)
        }
        cell.hideBottomLine(isLastCell)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(LineX(45))
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(LineX(105))
    }
}
