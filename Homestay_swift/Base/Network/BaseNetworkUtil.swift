//
//  BaseNetworkUtil.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/24.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON

let ERROR_CODE_EMPTY_VALUE = -100
let ERROR_CODE_REQUEST_FAILED = -200

//子类继承之后记得用单例
class BaseNetworkUtil: NSObject {
    enum RequesErrorType {
        case emptyValue
        case serverError
        case connectError
    }
    
    private var statusCodeKey = "code"
    private var responseMsgKey = "msg"
    private var successCode = 1
    
    //这些由子类进行重写 默认填的参数之类的
    func urlOption(withUrl currentUrl: String) -> String {
        return currentUrl
    }
    
    func defaultRequestHeader() -> HTTPHeaders {
        return HTTPHeaders()
    }
    
    func setStatusConfig(successCode code: Int, statusKey: String, msgKey: String) {
        successCode = code
        statusCodeKey = statusKey
        responseMsgKey = msgKey
    }
    
    //进一步封装的请求 回调数据是传进来的HandyJSON数据对象类
    func request<T: HandyJSON>(_ url: String, params: [String: Any]? = nil, headers: HTTPHeaders? = nil, method: HTTPMethod, modelClass: T.Type, success: ((_ : T?) -> Void)? = nil, fail: ((_ : DzError) -> Void)? = nil) {
        request(url, params: params, headers: headers, method: method, success: {
            let model = JSONDeserializer<T>.deserializeFrom(dict: $0)
            success?(model)
        }, fail: fail)
    }
    
    //基础的请求 回调数据是字典
    func request(_ url: String, params: [String: Any]? = nil, headers: HTTPHeaders? = nil, method: HTTPMethod, success: ((_ : [String: Any]) -> Void)? = nil, fail: ((_ : DzError) -> Void)? = nil) {
        let requestUrl = urlOption(withUrl: url)
        var headerParam = defaultRequestHeader()
        headers?.forEach { headerParam.add($0) }
        PrintDebug("request start !!!\nURL:\(requestUrl)")
        AF.request(requestUrl, method: method, parameters: params, encoding: URLEncoding.queryString, headers: headerParam, requestModifier: { $0.timeoutInterval = 10 })
            .responseJSON { (response) in
            self.handleResponse(response, requestUrl: requestUrl, success: success, fail: fail)
        }
    }
    
    //MultipartformData的上传。讲道理应该用不上 图片基本都是用七牛的
    func upload(_ url: String, headers: HTTPHeaders? = nil, multipartFormData:@escaping (MultipartFormData) -> Void,
                progressHandler: ((_: Progress) -> Void)? = nil, success: ((_ : [String: Any]) -> Void)? = nil, fail: ((_ : DzError) -> Void)? = nil) {
        let requestUrl = urlOption(withUrl: url)
        var headerParam = defaultRequestHeader()
        headers?.forEach { headerParam.add($0) }
        //TODO 先这样写试试看 会不会有进度条的效果
        AF.upload(multipartFormData: multipartFormData, to: requestUrl, headers: headers, requestModifier: { $0.timeoutInterval = 20 }).responseJSON { response in
            self.handleResponse(response, requestUrl: requestUrl, success: success, fail: fail)
        }.uploadProgress {
            PrintDebug("UploadProgress: \($0.fractionCompleted)")
            progressHandler?($0)
        }
    }
    
    //对请求得到的回调数据的处理
    private func handleResponse(_ response: AFDataResponse<Any>,requestUrl url: String, success: ((_ : [String: Any]) -> Void)? = nil, fail: ((_ : DzError) -> Void)? = nil) {
        switch response.result {
        case .success:
            guard let data = response.value  else {
                self.handleError(errorType: .emptyValue, defaultUrl: url, data: "", fail: fail)
                return
            }

            let responseDict = data as! [String: Any]
            let currentCode = responseDict[self.statusCodeKey] as! Int
            guard currentCode == self.successCode  else {
                self.handleError(errorType: .serverError, defaultUrl: url, data: responseDict, fail: fail)
                return
            }
            //一般不建议这么做。这里因为后台那个人脑残 cookie放在header里面没办法 才写在这里的
            if url.contains("login") {
                let cookies = response.response?.allHeaderFields["Set-Cookie"]
                UserDefaults.standard.set(cookies, forKey: USER_COOKIE)
                UserDefaults.standard.synchronize()
            }
            PrintDebug("request end !!!\n\(url)\n\(responseDict)")
            success?(responseDict)
            break
        case let .failure(error):
            handleError(errorType: .connectError, defaultUrl: url, data: error, fail: fail)
            break
        }
    }
    
    //对请求错误的处理
    private func handleError(errorType: RequesErrorType, defaultUrl: String, data: Any, fail: ((_ : DzError) -> Void)? = nil) {
        var logInfo: String
        var requestError: DzError
        
        switch errorType {
        case .emptyValue:
            logInfo = "Request success: HOWEVER -- empty response value \n\(defaultUrl)"
            requestError = DzError(domain: defaultUrl, code: ERROR_CODE_EMPTY_VALUE, userInfo: ["msg" : "Request success: HOWEVER -- empty response value"])
            break
        case .serverError:
            let dataDict = data as! [String: Any]
            let currentCode = dataDict[self.statusCodeKey] as! Int
            logInfo = "Request success: HOWEVER -- server error \n\(defaultUrl)\n\(data)"
            requestError = DzError(domain: defaultUrl, code: currentCode, userInfo: ["msg" : dataDict[self.responseMsgKey] ?? dataDict])
            break
        case .connectError:
            let afError = data as! AFError
            logInfo = "Request failed: request error \n\(defaultUrl)\n\(afError.localizedDescription)"
            requestError = DzError(domain: afError.destinationURL?.absoluteString ?? defaultUrl,
                                   code: afError.responseCode ?? ERROR_CODE_REQUEST_FAILED,
                                   userInfo: ["msg" : afError.localizedDescription])
            break
        }
        PrintDebug(logInfo)
        if self.handleAbnormalCompletionResult(with: requestError) {
            fail?(requestError)
        }
    }
    
    //TODO override by subclass
    //To deal with some cases : request timeout | login timeout | ...
    func handleAbnormalCompletionResult(with error: DzError) -> Bool{
        return true
    }
}
