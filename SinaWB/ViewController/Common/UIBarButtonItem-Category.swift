//
//  UIBarButtonItem-Category.swift
//  SinaWB
//
//  Created by Geetion on 16/7/26.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    class func createBarButtonItem(imageName:String,target:AnyObject?,action:Selector) -> UIBarButtonItem {
        let button = UIButton()
        
        button.setImage(UIImage(named:imageName ), forState: .Normal)
        button.setImage(UIImage(named: imageName + "_highlighted" ), forState: .Highlighted)
        button.sizeToFit()
        button.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        return UIBarButtonItem(customView: button)
    }
}
