//
//  LineViewExtension.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/12.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

extension UIView {
    enum DashLineType {
        case vertical
        case horizontal
    }
    
    func drawDashLine(color lineColor: UIColor, width lineWidth: CGFloat, lineType: DashLineType) {
        let dashLineLayer = CAShapeLayer()
        dashLineLayer.bounds = bounds
        dashLineLayer.position = layer.position

        //dash line color
        dashLineLayer.fillColor = UIColor.clear.cgColor
        dashLineLayer.strokeColor = lineColor.cgColor
        
        //dash line width and attributes
        dashLineLayer.lineWidth = lineWidth
        dashLineLayer.lineJoin = CAShapeLayerLineJoin.round
        dashLineLayer.lineDashPattern = [4,4]
        
        //dash line path
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: lineType == DashLineType.vertical ? CGPoint(x: 0, y: bounds.height) : CGPoint(x: bounds.width, y: 0))
        dashLineLayer.path = path
        
        layer.addSublayer(dashLineLayer)
    }
    
    //custom
    func addGrayShadowEffect() {
        addShadowEffect(color: UIColor.gray)
    }
    
    func addBlueShadowEffect() {
        addShadowEffect(color: Color_2189f7)
    }
    
    //origin
    func addShadowEffect(color: UIColor, offset: CGSize, opacity: Float) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
    }
    
    func addShadowEffect(color: UIColor) {
        addShadowEffect(color: color, offset: CGSize(width: 0, height: 5), opacity: 0.3)
    }
    
    func addCorner(_ corner: UIRectCorner, radii: CGFloat, backgroundColor: UIColor) {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corner, cornerRadii: CGSize(width: radii, height: radii))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        maskLayer.fillColor = backgroundColor.cgColor
        
        layer.addSublayer(maskLayer)
    }
}

