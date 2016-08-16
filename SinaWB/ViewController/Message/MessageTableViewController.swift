//
//  MessageTableViewController.swift
//  SinaWB
//
//  Created by Geetion on 16/7/24.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class MessageTableViewController: BaseTableViewController {
    
    let messageInfo = "登陆后，别人评论你的微博，给你发消息，都会在这里收到通知"

    override func viewDidLoad() {
        super.viewDidLoad()

        if !userLogin {
            visitorView?.setupVisitorInfo(false, imageName: "visitordiscover_image_message", message: messageInfo)
        }
    }
}
