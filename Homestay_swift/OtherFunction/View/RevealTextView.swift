//
//  MessageRevealView.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/19.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

class RevealTextView: RevealInfoView {
    private var contentLabel = UILabel()
    
    override func addSubviewAttributes() {
        super.addSubviewAttributes()
        
        addCustomView(contentLabel)
        contentLabel.font = UIFont.systemFont(ofSize: 16)
        contentLabel.textColor = Color_9f9f9f
        contentLabel.numberOfLines = 0
        contentLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(LineX(15))
            make.right.equalToSuperview().offset(-LineX(15))
            make.top.equalToSuperview().offset(LineX(20))
        }
    }
    
    override func setDataModel(_ dataModel: Any) {
        super.setDataModel(dataModel)
        
        let msgModel: RevealInfoModel = dataModel as! RevealInfoModel
        let contentString = msgModel.content as! String
        if msgModel.msgTitle == .localized_about_us_title {
            contentLabel.textAlignment = NSTextAlignment.left
            
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 10
            let attributes = [NSAttributedString.Key.font: contentLabel.font, NSAttributedString.Key.foregroundColor: contentLabel.textColor, NSAttributedString.Key.paragraphStyle: style]
            let attributeContent = NSAttributedString(string: contentString, attributes: attributes as [NSAttributedString.Key : Any])
            contentLabel.attributedText = attributeContent
        } else {
            contentLabel.textAlignment = NSTextAlignment.center
            contentLabel.text = contentString
        }
    }
}
