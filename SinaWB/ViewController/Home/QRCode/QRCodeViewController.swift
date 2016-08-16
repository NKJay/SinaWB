//
//  QRCodeViewController.swift
//  SinaWB
//
//  Created by Geetion on 16/7/28.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class QRCodeViewController: UIViewController {
    @IBOutlet weak var scanlineView: UIImageView!
    @IBOutlet weak var scanlineHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var scanlineTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var tabBar: UITabBar!
    
    @IBAction func leftButtonDidClick(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func rightButtonDidClick(sender: AnyObject) {
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        scanlineAnimation()
    }
    
    private func scanlineAnimation() {
        
        scanlineTopConstraint.constant = -scanlineHeightConstraint.constant
        
        scanlineView.layoutIfNeeded()
        
        print(scanlineTopConstraint.constant)
        UIView.animateWithDuration(2.0) {
            
            self.scanlineTopConstraint.constant = self.scanlineHeightConstraint.constant
            
            UIView.setAnimationRepeatCount(MAXFLOAT)
            self.scanlineView.layoutIfNeeded()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.selectedItem = tabBar.items![0]
    }

}
