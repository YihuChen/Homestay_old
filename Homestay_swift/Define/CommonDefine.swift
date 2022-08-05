//
//  CommonDefine.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/11.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

let Screen_Bounds = UIScreen.main.bounds
let Screen_Height:Double = Double(UIScreen.main.bounds.height)
let Screen_Width:Double = Double(UIScreen.main.bounds.width)

let StatusBarHeight:Double = Double(UIApplication.shared.statusBarFrame.size.height)//状态栏高度
let NavBarHeight:Double = 44.0

let iphone8W = 375.0
let iphone8H = 667.0

let ScaleX:Double = Double(Screen_Width)/iphone8W
let ScaleY:Double = Double(Screen_Height)/iphone8W

func LineX(_ l:Double) -> Double {
    return l * ScaleX
}

func LineY(_ l:Double) -> Double {
    return l * ScaleY
}

func PrintDebug<T>(_ message:T, file: String = #file, methodsName: String = #function, line: Int = #line){
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    print("————class: \(fileName) method: \(methodsName) line: \(line)\n————\(message)\n")
    #endif
}

let BaseUrl = "http://192.168.0.105:8080/"
//#if DEBUG //测试环境
//let BaseUrl = "http://172.20.10.11:8080/"
//#else
//let BaseUrl = "http://172.20.10.11:8080/"
//#endif

