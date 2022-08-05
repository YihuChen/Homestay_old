//
//  OperationRecordViewController.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/18.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class OperationRecordViewController: BaseTableViewController {
    private var page = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.setRefreshType(.both)
        tableView?.tableViewRefreshBlock = {
            self.loadTableViewData(isReload: $0)
        }
        tableView?.mj_header?.beginRefreshing()
    }

    override func initConfig() {
        super.initConfig()
        
        navView.titleLabel.text = .localized_operation_record_title
    }
    
    override func createTableView() -> BaseTableView {
        return OperationRecordTableView()
    }
    
    private func loadTableViewData(isReload: Bool) {
        if isReload {
            page = 1
        } else {
            page += 1
        }
        
        let homestayID = UserDefaults.standard.string(forKey: HOMESTAY_ID)
        HsNetworkUtil.instance.manageSearchHistory(homestayID: homestayID!, page: page, success: { (listModel) in
            if listModel.totalPage <= self.page {
                self.tableView?.mj_footer?.endRefreshingWithNoMoreData()
            } else {
                self.tableView?.mj_header?.endRefreshing()
                self.tableView?.mj_footer?.endRefreshing()
            }
            
            let sections = self.tableView?.sectionDataArray ?? NSMutableArray()
            let rows = self.tableView?.rowDataArray ?? NSMutableArray()
            if isReload {
                self.tableView?.removeAllObjects()
            }
            //转化处理数据
            for itemModel in listModel.list {
                guard itemModel != nil else { continue }
                guard let historyTime = itemModel?.historyTime else { continue }
                
                //处理section
                let dateString = Date.convertTimestamp(historyTime, intoStringWithformatter: "yyyy-MM-dd")
                var index = -1
                var isNewSection = true
                for item in sections {
                    let tempItemModel = item as! OperationRecordSectionModel
                    if tempItemModel.time == dateString {
                        index = sections.index(of: item)
                        isNewSection = false
                        break
                    }
                }
                if isNewSection {
                    index = 0
                    let sectionItemModel = OperationRecordSectionModel(time: dateString, needHideTopline: sections.count == 0)
                    sections.add(sectionItemModel)
                }
                //处理row
                let currentRowData = isNewSection ? NSMutableArray() : (rows[index] as! NSMutableArray)
                currentRowData.add(itemModel!)
                if isNewSection {
                    rows.add(currentRowData)
                } else {
                    rows.replaceObject(at: index, with: currentRowData)
                }
            }
            self.tableView?.sectionDataArray = sections
            self.tableView?.rowDataArray = rows
            self.tableView?.reloadData()
        }) { (error) in
            //提示错误
            self.tableView?.mj_header?.endRefreshing()
            self.tableView?.mj_footer?.endRefreshing()
        }
    }
}
