//
//  CustomUIPresentationController.swift
//  SinaWB
//
//  Created by Geetion on 16/7/27.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class CunstomUIPresentationController: UIPresentationController {
    
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
    }
    
    override func containerViewWillLayoutSubviews(){
        presentedView()?.frame = CGRect(x: 90, y: 56, width: 150, height: 250)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(NSStream.close))
        containerView?.addGestureRecognizer(tapGesture)
    }
    
    func close() {
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
