//
//  HsJsonModel.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/31.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import Foundation
import HandyJSON

//mode有部分不一样是因为接口文档找不到了
//然后数据结构不是很清楚 就直接拿需要的部分用了
class HsHttpModel<T: HandyJSON>: HandyJSON {
    var code: Int?
    var msg: String?
    var data: T?
    
    public required init() {}
}

class LoginModel: HandyJSON {
    var owner = ""
    var address = ""
    var addTime = ""
    var terminalVer = ""
    var placeId = ""
    var cityId = ""
    var userId = ""
    var provinceId = ""
    var errorTime = ""
    var placeType = ""
    var areaId = ""
    var phone = ""
    var state = ""
    var placeName = ""
    var placeCode = ""
    
    public required init() {}
}

class VersionModel: HandyJSON {
    var needUpdate = 0
    var url = ""

    public required init() {}
}

struct StatisticsModel {
    var todayCheckin = 0
    var todayCheckout = 0
    var spareRoom = 0
    var roomCount = 0
    
    init(with dict: [String: Any]) {
        let models: [[String: Any]] = dict["data"] as! [[String: Any]]
        guard models.count >= 5 else {
            PrintDebug("StatisticsModel init error !!! \(dict)")
            return
        }
        //不知道 第四个元素是干什么的
        todayCheckin = models[0]["checkInToday"] as! Int
        todayCheckout = models[1]["checkOutToday"] as! Int
        spareRoom = models[2]["checkOutRoom"] as! Int
        roomCount = models[4]["countRoom"] as! Int
    }
}

class RoomItemModel: HandyJSON {
    var roomId = ""
    var roomName = ""
    var checkInStatus = ""
    
    public required init() {}
}

class HsListModel<T: HandyJSON>: HandyJSON {
    var pageSize = 0
    var totalRow = 0
    var pageNumber = 0
    var lastPage = 0
    var firstPage = 0
    var totalPage = 0
    var list: [T?] = []
    
    public required init() {}
}

class RegistrationRecordModel: HandyJSON {
    var customerId = ""
    var customerName = ""
    var avatar = ""
    var checkInStatus = ""
    var checkInTime = ""
    var checkOutTime = ""
    var homestayId = ""
    var roomId = ""
    var roomName = ""
    
    public required init() {}
}

struct RegistrationDetailModel {
    var roomNumber = ""
    var customerAvatar = ""
    var customerIDNum = ""
    var customerName = ""
    var checkInDate = ""
    var checkoutDate = ""
    
    init(with dict: [String: Any]) {
        let partAvatar = dict["avatar"] as! String
        customerAvatar = BaseUrl + partAvatar
        customerIDNum = dict["identityCard"] as! String
        customerName = dict["customerName"] as! String
        
        checkInDate  = Date.convertTimestamp(dict["checkInTime"] as! String)
        if let checkoutTimestamp = dict["checkOutTime"] {
            checkoutDate = Date.convertTimestamp(checkoutTimestamp as! String)
        }
    }
}

enum OperationType: String, HandyJSONEnum {
    case insert = "append"
    case modify = "update"
    case delete = "delete"
    case checkIn = "checkIn"
    case checkOut = "checkOut"
}

class OperationRecordModel: HandyJSON {
    var historyName = ""
    var historyTime = ""
    var historyRoom = ""
    var changedNum = ""
    var historyType: OperationType?
    
    public required init() {}
}

struct OperationRecordSectionModel {
    var time = ""
    var needHideTopline = false
}


