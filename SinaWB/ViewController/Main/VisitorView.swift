//
//  VisitorView.swift
//  SinaWB
//
//  Created by Geetion on 16/7/25.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit
import SnapKit

protocol VisitorViewDelegate : NSObjectProtocol {
    
    func loginButtonDidClick()
    
    func registerButtonDidClick()
}

class VisitorView: UIView {
    
    weak var delegate:VisitorViewDelegate?
    
    func setupVisitorInfo(isHome:Bool,imageName:String,message:String){
        iconView.hidden = !isHome
        homeIcon.image = UIImage(named: imageName)
        messageLabel.text = message
        
        if isHome {
            startAnimation(iconView)
        }
    }
    
    private func startAnimation(targetView:UIView){
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.repeatCount = MAXFLOAT
        animation.toValue = 2 * M_PI
        animation.duration = 20
        animation.removedOnCompletion = false
        targetView.layer.addAnimation(animation, forKey: nil)
        
    }
    
    func loginButtonDidClick() {
//        delegate?.loginButtonDidClick()
    }
    func registerButtonDidClick() {
//        delegate?.registerButtonDidClick()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(iconView)
        addSubview(homeIcon)
        addSubview(messageLabel)
        addSubview(registerButton)
        addSubview(loginButton)
        
        iconView.snp_makeConstraints { (make) in
            make.center.equalTo(self)
        }
        
        homeIcon.snp_makeConstraints { (make) in
            make.center.equalTo(self)
        }
        
        messageLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.width.equalTo(200)
            make.bottom.equalTo(iconView.snp_bottom)
        }
        
        loginButton.snp_makeConstraints { (make) in
            make.left.equalTo(iconView.snp_left)
            make.top.equalTo(messageLabel.snp_bottom)
        }
        
        registerButton.snp_makeConstraints { (make) in
            make.right.equalTo(iconView.snp_right)
            make.top.equalTo(messageLabel.snp_bottom)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var iconView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        return imageView
    }()
    
    private lazy var homeIcon:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
        return imageView
    }()
    
    private lazy var messageLabel:UILabel = {
       let label = UILabel()
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.numberOfLines = 0
        label.textColor = UIColor.grayColor()
        label.font = UIFont.systemFontOfSize(13)
        label.textAlignment = NSTextAlignment.Center
        return label
    }()
    
    private lazy var loginButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("登录", forState: .Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: .Normal)
        btn.addTarget(self, action: #selector(VisitorView.loginButtonDidClick), forControlEvents: .TouchUpInside)
        return btn
    }()
    
    private lazy var registerButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("注册", forState: .Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: .Normal)
        btn.addTarget(self, action: #selector(VisitorView.registerButtonDidClick), forControlEvents: .TouchUpInside)
        return btn
    }()
}
