//
//  BaseTableView.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/18.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class BaseTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    var hasMultipleSection = false
    var tableViewRefreshBlock: ((_: Bool) -> Void)?
    var tableViewCellClickBlock: ((_: IndexPath) -> Void)?
    
    var defaultCellReuseId: String?
    var sectionDataArray: NSMutableArray?
    var rowDataArray: NSMutableArray?
    var refreshType: MJRefrshType = .none
    
    private let defaultTableViewHeaderFooterViewReuseId = "defaultTableViewHeaderFooterViewReuseId"
    
    init(cellInfos: [String : AnyClass]) {
        super.init(frame: .zero, style: .grouped)
        
        dataSource = self
        delegate = self
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        separatorStyle = UITableViewCell.SeparatorStyle.none
        
        //设置默认的cellid
        defaultCellReuseId = cellInfos.keys.first!
        //遍历info。注册cell
        cellInfos.forEach { (key, cellClass) in
            register(cellClass, forCellReuseIdentifier: key)
        }
        register(BaseTableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: defaultTableViewHeaderFooterViewReuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return hasMultipleSection ? (sectionDataArray?.count ?? 0) : 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDataArray(forSection: section)?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(LineX(150))
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return defaultViewHeaderFooterView(for: tableView)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return defaultViewHeaderFooterView(for: tableView)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentIdentifier = currentCellid(forItemAt: indexPath)
        let cell: BaseTableViewCell = tableView.dequeueReusableCell(withIdentifier: currentIdentifier, for: indexPath) as! BaseTableViewCell
        let currentModelArray = currentDataArray(forSection: indexPath.section)
        
        if indexPath.row >= currentModelArray?.count ?? 0 {
            PrintDebug("BaseTableView setDataModel error : index beyond !!!!")
            return cell
        }
        let dataModel = currentModelArray?.object(at: indexPath.row)
        if dataModel != nil {
            cell.setDataModel(dataModel!)
        } else {
            PrintDebug("BaseTableView setDataModel error : nil dataModel !!!!")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableViewCellClickBlock?(indexPath)
    }

    func currentCellid(forItemAt indexPath: IndexPath) -> String {
        //should be override by subclass when having more than one cell class
        return defaultCellReuseId!
    }
    
    func currentDataArray(forSection section: Int) -> NSMutableArray? {
        if hasMultipleSection {
            return rowDataArray?.object(at: section) as! NSMutableArray?
        }
        return rowDataArray
    }
    
    func removeAllObjects() {
        sectionDataArray?.removeAllObjects()
        rowDataArray?.removeAllObjects()
    }
    
    func setRefreshType(_ type: MJRefrshType) {
        refreshType = type
        if type == .header || type == .both {
            let header = MJRefreshNormalHeader()
            header.setRefreshingTarget(self, refreshingAction: #selector(reloadTableViewData))
            header.backgroundColor = Color_f4f4f4
            self.mj_header = header
        }
        if type == .both {
            let footer = MJRefreshAutoNormalFooter()
            footer.setRefreshingTarget(self, refreshingAction: #selector(loadTableViewData))
            footer.backgroundColor = Color_f4f4f4
            self.mj_footer = footer
        }
    }
    
    private func defaultViewHeaderFooterView(for tableView: UITableView) -> UIView? {
        var view = tableView.dequeueReusableHeaderFooterView(withIdentifier: defaultTableViewHeaderFooterViewReuseId)
        if view == nil {
            view = BaseTableViewHeaderFooterView.init(reuseIdentifier: defaultTableViewHeaderFooterViewReuseId)
        }
        return view
    }
    
    @objc private func reloadTableViewData() {
        tableViewRefreshBlock?(true)
    }
    
    @objc private func loadTableViewData() {
        tableViewRefreshBlock?(false)
    }
}
