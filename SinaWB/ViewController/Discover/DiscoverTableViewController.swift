//
//  DiscoverTableViewController.swift
//  SinaWB
//
//  Created by Geetion on 16/7/24.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class DiscoverTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !userLogin {
            visitorView?.setupVisitorInfo(false, imageName: "visitordiscover_image_message", message: "")
        }

    }


}
