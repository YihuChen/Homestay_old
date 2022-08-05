//
//  RevealInfoView.swift
//  Homestay_swift
//
//  Created by 陈毅琥 on 2020/8/20.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

import UIKit

struct RevealInfoModel {
    var msgTitle = ""
    var content: Any = ""
    var imageName = ""
    var butnTitle = ""
}

class RevealInfoView: BaseView {
    public var butnClickBlock: (() -> Void)?
    
    private var whiteView = UIView()
    private var imageView = UIImageView()
    private var arrowView = UIImageView(image: UIImage(named: "double_nar"))
    private var titleLabel = UILabel()
    private var contentView = UIView()
    private var butn = UIButton()
    
    override func createSubviews() {
        addSubview(whiteView)
        addSubview(imageView)
        addSubview(arrowView)
        addSubview(titleLabel)
        addSubview(contentView)
        addSubview(butn)
    }
    
    override func addSubviewAttributes() {
        imageView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(LineX(185))
        }
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textColor = UIColor.white
        titleLabel.snp.makeConstraints { (make) in
            make.right.equalTo(imageView).offset(-LineX(20))
            make.bottom.equalTo(imageView).offset(-LineX(20))
        }
        
        arrowView.snp.makeConstraints { (make) in
            make.right.equalTo(titleLabel.snp.left).offset(-LineX(10))
            make.centerY.equalTo(titleLabel)
            make.size.equalTo(CGSize(width: LineX(22), height: LineX(15)))
        }
        
        contentView.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom)
            make.left.right.equalToSuperview()
        }
        
        butn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        butn.layer.cornerRadius = CGFloat(LineX(25))
        butn.backgroundColor = Color_2189f7
        butn.addBlueShadowEffect()
        butn.setTitleColor(UIColor.white, for: .normal)
        butn.addTarget(self, action: #selector(butnClicked), for: .touchUpInside)
        butn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(LineX(35))
            make.right.equalToSuperview().offset(-LineX(35))
            make.height.equalTo(LineX(50))
            make.bottom.equalTo(whiteView).offset(LineX(25))
        }
        
        whiteView.backgroundColor = UIColor.white
        whiteView.layer.cornerRadius = 10.0
        whiteView.addGrayShadowEffect()
        whiteView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.bottom.equalTo(contentView).offset(LineX(50))
        }
        
        self.snp.makeConstraints { (make) in
            make.bottom.equalTo(butn)
        }
    }
    
    override func setDataModel(_ dataModel: Any) {
        let msgModel: RevealInfoModel = dataModel as! RevealInfoModel
        
        titleLabel.text = msgModel.msgTitle
        imageView.image = UIImage(named: msgModel.imageName)
        butn.setTitle(msgModel.butnTitle, for: .normal)
    }
    
    func addCustomView(_ customView: UIView) {
        contentView.addSubview(customView)
        
        contentView.snp.makeConstraints { (make) in
            make.bottom.equalTo(customView)
        }
    }
    
    func hideButn() {
        butn.isHidden = true
        
        whiteView.snp.updateConstraints { (make) in
            make.bottom.equalTo(contentView).offset(LineX(30))
        }
    }
    
    @objc private func butnClicked() {
        butnClickBlock?()
    }
}
