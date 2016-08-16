//
//  HomeTableViewController.swift
//  SinaWB
//
//  Created by Geetion on 16/7/24.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class HomeTableViewController: BaseTableViewController {
    
    private let messageInfo = "关注一些人看看这里有什么惊喜"
    
    private lazy var popoverAnimation:PopoverAnimation = {
       let animation = PopoverAnimation()
        return animation
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !userLogin {
            visitorView?.setupVisitorInfo(true, imageName: "visitordiscover_feed_image_house", message: messageInfo)
            return
        }
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HomeTableViewController.changePopoverViewStatus), name: popoverViewWillPrensent, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HomeTableViewController.changePopoverViewStatus), name: popoverViewWillDismiss, object: nil)
        
        setupNavigationBar()
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func changePopoverViewStatus() {

        let titleButton = navigationItem.titleView as! TitleButton
        titleButton.selected = !titleButton.selected
    }
    
    private func setupNavigationBar(){

        navigationItem.rightBarButtonItem =
        UIBarButtonItem.createBarButtonItem("navigationbar_pop",target: self,action: #selector(HomeTableViewController.leftButtonDidClick))
        navigationItem.leftBarButtonItem = UIBarButtonItem.createBarButtonItem("navigationbar_friendattention",target: self,action: #selector(HomeTableViewController.rightButtonDidClick))
        
        let titleButton = TitleButton()
        titleButton.setTitle("Cc极生", forState: .Normal)
        titleButton.addTarget(self, action: #selector(HomeTableViewController.titleButtonDidClick(_:)), forControlEvents: .TouchUpInside)
        navigationItem.titleView = titleButton

    }
    
    func leftButtonDidClick() {
        let storyBoard = UIStoryboard(name: "QRCodeView", bundle: nil)
        let qrcodeViewController = storyBoard.instantiateInitialViewController()
        self.presentViewController(qrcodeViewController!, animated: true, completion: nil)
    }
    
    func rightButtonDidClick() {
    }
    
    func titleButtonDidClick(btn:TitleButton){
        
        let storyBoard = UIStoryboard(name: "PopoverViewController", bundle: nil)
        let popoverView = storyBoard.instantiateInitialViewController()
        popoverView?.modalPresentationStyle = UIModalPresentationStyle.Custom
        popoverView?.transitioningDelegate = popoverAnimation
        presentViewController(popoverView!, animated: true, completion: nil)
    }
    

}
