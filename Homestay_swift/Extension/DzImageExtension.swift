//
//  DzImageExtension.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/21.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func resize(to dimension: CGFloat) -> UIImage {
        var width: CGFloat
        var height: CGFloat
        var newImage: UIImage
        
        let aspectRatio = size.width / size.height
        if aspectRatio > 1 {
            width = dimension
            height = dimension / aspectRatio
        } else {
            height = dimension
            width = dimension * aspectRatio
        }
        if #available(iOS 10.0, *) {
            let renderFormat = UIGraphicsImageRendererFormat.default()
            renderFormat.opaque = false
            let renderer = UIGraphicsImageRenderer(size: CGSize(width: width, height: height), format: renderFormat)
            newImage = renderer.image { (context) in
                self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
            }
        } else {
            UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), false, 0)
            self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
            newImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
        }
        return newImage
    }
}
