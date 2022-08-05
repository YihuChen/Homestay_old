//
//  DzNetworkUtil.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/31.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class HsNetworkUtil: BaseNetworkUtil {
    let KEY_TOKEN = "xx-token"
    let KEY_DEVICE_TYPE = "xx-device-type"
    let KEY_ACCOUNT = "account"
    let KEY_APPKEY = "appkey"
    let KEY_TIMESTAMP = "timestamp"
    let KEY_SIGNATURE = "signature"
    let KEY_COOKIE = "Cookie"
    
    let STATUS_CODE_LOGIN_TIMEOUT = -3
    
    static let instance = HsNetworkUtil()
    override func urlOption(withUrl currentUrl: String) -> String {
        return BaseUrl + currentUrl
    }
    
    override func defaultRequestHeader() -> HTTPHeaders {
        var resultHeaders = HTTPHeaders()
        
        let isLogin = UserDefaults.standard.bool(forKey: LOGIN_FLAG)
        //resultHeaders.add(name: KEY_TOKEN, value: isLogin ? UserDefaults.standard.string(forKey: LOGIN_TOKEN)! : "")
        resultHeaders.add(name: KEY_DEVICE_TYPE, value: "iphone")
        resultHeaders.add(.accept("application/json"))
        resultHeaders.add(.contentType("application/json; charset=utf-8"))
        
        if isLogin {
            let account = UserDefaults.standard.string(forKey: USER_ACCOUNT)
            let appkey = ("eshanren" + account!).md5()
            let timestamp = Date.currentTimestamp()
            let signature = (timestamp + appkey).md5()
            
            resultHeaders.add(name: KEY_ACCOUNT, value: account!)
            resultHeaders.add(name: KEY_APPKEY, value: appkey)
            resultHeaders.add(name: KEY_TIMESTAMP, value: timestamp)
            resultHeaders.add(name: KEY_SIGNATURE, value: signature)
            
            if let cookie = UserDefaults.standard.string(forKey: USER_COOKIE) {
                resultHeaders.add(name: KEY_COOKIE, value: cookie)
            }
        }

        return resultHeaders
    }
    
    override func handleAbnormalCompletionResult(with error: DzError) -> Bool {
        if error.code == STATUS_CODE_LOGIN_TIMEOUT {
            //登录超时 需要重新登录
            UserDefaults.standard.set(false, forKey: LOGIN_FLAG)
            UserDefaults.standard.synchronize()
            
            let rootViewContrller = BaseNavigationController.init(rootViewController: LoginViewController())
            HsViewControllerUtil.fadedIntoViewController(rootViewContrller)
            return false
        }
        return true
    }
}

extension HsNetworkUtil {
    
    func login(account: String, pasd: String, success:@escaping (_: LoginModel) -> Void, fail: ((_: DzError) -> Void)? = nil) {
        let params = ["account" : account, "password" : pasd, "timestamp" : Date.currentTimestamp()]
        HsNetworkUtil.instance.request("api/setting/login", params: params, method: HTTPMethod.post, modelClass: HsHttpModel<LoginModel>.self, success: {
            success($0!.data!)
        }, fail: fail)
    }
    
    func checkVer(success:@escaping (_ : VersionModel) -> Void, fail: ((_: DzError) -> Void)? = nil) {
        let params = ["nowVer" : "100"]
        HsNetworkUtil.instance.request("api/setting/checkVer", params: params, method: HTTPMethod.get, modelClass: HsHttpModel<VersionModel>.self, success: {
            success($0!.data!)
        }, fail: fail)
    }
    
    func manageSearchStatics(homestayID: String, success:@escaping (_ : StatisticsModel) -> Void, fail: ((_: DzError) -> Void)? = nil) {
        let params = ["homestayId" : homestayID, "timestamp" : Date.currentTimestamp()]
        HsNetworkUtil.instance.request("api/manage/searchStatistics", params: params, method: HTTPMethod.get, success: {
            success(StatisticsModel(with: $0))
        }, fail: fail)
    }
    
    func manageSearchRoom(homestayID: String, searchContent: String = "", page: Int, size: Int = 12, success:@escaping (_ : HsListModel<RoomItemModel>) -> Void, fail: ((_: DzError) -> Void)? = nil) {
        let params = ["homestayId" : homestayID, "roomName": searchContent, "pageNum": page, "pageSize": size] as [String : Any]
        HsNetworkUtil.instance.request("api/manage/searchRoom", params: params, method: HTTPMethod.get, modelClass: HsHttpModel<HsListModel<RoomItemModel>>.self, success: {
            success($0!.data!)
        }, fail: fail)
    }
    
    func manageUploadAvatar(imageData: Data, success:@escaping (_ : String) -> Void, fail: ((_: DzError) -> Void)? = nil) {
        HsNetworkUtil.instance.upload("api/manage/uploadAvatar", multipartFormData: {
            $0.append(imageData, withName: "file")
        }, progressHandler: nil, success: {
            success($0["path"] as! String)
        }, fail: fail)
    }
    
    func manageCheckIn(homestayID: String, name: String, idNum: String, roomID: String, avatarPath: String, success:@escaping () -> Void, fail: ((_: DzError) -> Void)? = nil) {
        let params = ["homestayId" : homestayID,
                      "customerName": name,
                      "identityCard": idNum,
                      "roomId": roomID,
                      "checkInStatus": "1",
                      "avatar": avatarPath,
                      "checkInTime" : Date.currentTimestamp()]
        HsNetworkUtil.instance.request("api/manage/checkIn", params: params, method: HTTPMethod.post, success: { _ in
            success()
        }, fail: fail)
    }
    
    func manageModifyRoom(homestayID: String, newName: String, roomID: String, success:@escaping () -> Void, fail: ((_: DzError) -> Void)? = nil) {
        let params = ["homestayId": homestayID, "roomName": newName, "roomId": roomID]
        HsNetworkUtil.instance.request("api/manage/modifyRoom", params: params, method: HTTPMethod.get, success: { _ in
            success()
        }, fail: fail)
    }
    
    func manageDeleteRoom(homestayID: String, roomName: String, roomID: String, success:@escaping () -> Void, fail: ((_: DzError) -> Void)? = nil) {
        let params = ["homestayId": homestayID, "roomName": roomName, "roomId": roomID]
        HsNetworkUtil.instance.request("api/manage/removeRoom", params: params, method: HTTPMethod.get, success: { _ in
            success()
        }, fail: fail)
    }
    
    func manageAddRoom(homestayID: String, roomName: String, success:@escaping () -> Void, fail: ((_: DzError) -> Void)? = nil) {
        let params = ["homestayId": homestayID, "roomName": roomName]
        HsNetworkUtil.instance.request("api/manage/appendRoom", params: params, method: HTTPMethod.get, success: { _ in
            success()
        }, fail: fail)
    }
    
    func manageSearchCheckOut(homestayID: String, searchContent: String = "", page: Int, size: Int = 5, success:@escaping (_ : HsListModel<RegistrationRecordModel>) -> Void, fail: ((_: DzError) -> Void)? = nil) {
        let params = ["homestayId" : homestayID, "roomName": searchContent, "pageNum": page, "pageSize": size] as [String : Any]
        HsNetworkUtil.instance.request("api/manage/searchCheckOut", params: params, method: HTTPMethod.get, modelClass: HsHttpModel<HsListModel<RegistrationRecordModel>>.self, success: {
            success($0!.data!)
        }, fail: fail)
    }
    
    func manageSearch(homestayID: String, keyword: String = "", page: Int, size: Int = 5, success:@escaping (_ : HsListModel<RegistrationRecordModel>) -> Void, fail: ((_: DzError) -> Void)? = nil) {
        let params = ["homestayId" : homestayID, "keyword": keyword, "pageNum": page, "pageSize": size] as [String : Any]
        HsNetworkUtil.instance.request("api/manage/search", params: params, method: HTTPMethod.get, modelClass: HsHttpModel<HsListModel<RegistrationRecordModel>>.self, success: {
            success($0!.data!)
        }, fail: fail)
    }
    
    func manageSearchCheckIn(homestayID: String, startCheckIn: String = "", endCheckIn: String = "", startCheckOut: String = "", endCheckout: String = "",
                             page: Int, size: Int = 5, success:@escaping (_ : HsListModel<RegistrationRecordModel>) -> Void, fail: ((_: DzError) -> Void)? = nil) {
        let params = ["homestayId" : homestayID,
                      "checkInTimeStart": startCheckIn,
                      "checkInTimeEnd": endCheckIn,
                      "checkOutTimeStart": startCheckOut,
                      "checkOutTimeEnd": endCheckout,
                      "pageNum": page,
                      "pageSize": size] as [String : Any]
        HsNetworkUtil.instance.request("api/manage/searchCheckInRecord", params: params, method: HTTPMethod.get, modelClass: HsHttpModel<HsListModel<RegistrationRecordModel>>.self, success: {
            success($0!.data!)
        }, fail: fail)
    }
    
    func manageSearchDetail(homestayID: String, customerID: String, success:@escaping (_ : RegistrationDetailModel) -> Void, fail: ((_: DzError) -> Void)? = nil) {
        let params = ["homestayId" : homestayID, "customerId": customerID]
        HsNetworkUtil.instance.request("api/manage/searsearchDetailch", params: params, method: HTTPMethod.get, success: {
            success(RegistrationDetailModel(with: $0))
        }, fail: fail)
    }
    
    func manageCheckOut(homestayID: String, customerID: String, roomID: String, success:@escaping () -> Void, fail: ((_: DzError) -> Void)? = nil) {
        let params = ["homestayId": homestayID, "customerId": customerID, "roomId": roomID, "checkInStatus": "0"]
        HsNetworkUtil.instance.request("api/manage/checkout", params: params, method: HTTPMethod.post, success: { _ in
            success()
        }, fail: fail)
    }
    
    func settingModifyPasd(account: String, old: String, new: String, success:@escaping () -> Void, fail: ((_: DzError) -> Void)? = nil) {
        let params = ["account": account, "oldPwd": old, "newPwd": new, "timestamp": Date.currentTimestamp()]
        HsNetworkUtil.instance.request("api/setting/modifyPwd", params: params, method: HTTPMethod.get, success: { _ in
            success()
        }, fail: fail)
    }
    
    func manageSearchHistory(homestayID: String, page: Int, size: Int = 5, success:@escaping (_ : HsListModel<OperationRecordModel>) -> Void, fail: ((_: DzError) -> Void)? = nil) {
        let params = ["homestayId" : homestayID, "pageNum": page, "pageSize": size] as [String : Any]
        HsNetworkUtil.instance.request("api/manage/searchHistory", params: params, method: HTTPMethod.get, modelClass: HsHttpModel<HsListModel<OperationRecordModel>>.self, success: {
            success($0!.data!)
        }, fail: fail)
    }
}
