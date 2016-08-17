//
//  BaseTableViewController.swift
//  SinaWB
//
//  Created by Geetion on 16/7/25.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController,VisitorViewDelegate {
    
    var userLogin = true
    var visitorView:VisitorView?
    
    override func loadView() {
        userLogin ? super.loadView() : setupVistorView()
    }
    
    private func setupVistorView(){
        visitorView = VisitorView()
        view = visitorView
//        visitorView?.delegate = self
    }
    
    func loginButtonDidClick(){
        print("123")
    }
    
    func registerButtonDidClick(){
        
    }
}
