//
//  MainViewController.swift
//  SinaWB
//
//  Created by Geetion on 16/7/24.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置tabBer高亮颜色
        tabBar.tintColor = UIColor.orangeColor()
        addChildViewControllers()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setupAddButton()

    }

    
    private func setupAddButton(){

        let buttonWidth = UIScreen.mainScreen().bounds.width/CGFloat((viewControllers?.count)!)
        let rect = CGRect(x: 0, y: 0, width: buttonWidth, height: 49)
        composeButton.frame = CGRectOffset(rect, buttonWidth * 2, 0)
        
        tabBar.addSubview(composeButton)
    }

    
    private func addChildViewControllers() {
        let jsonPath = NSBundle.mainBundle().pathForResource("MainVCSettings", ofType: "json")
        let jsonData = NSData(contentsOfFile: jsonPath!)
        do{
            let jsonDict = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.MutableContainers)
            for dict in jsonDict as! [[String:String]]{
                addChildViewController(dict["vcName"]!, title: dict["title"]!, imageName: dict["imageName"]!)
            }
        }catch{
            print(error)
            addChildViewController("HomeTableViewController", title: "首页", imageName: "tabbar_home")
            addChildViewController("MessageTableViewController", title: "消息", imageName: "tabbar_message_center")
            addChildViewController("NullViewController", title: "", imageName: "")
            addChildViewController("DiscoverTableViewController", title: "广场", imageName: "tabbar_discover")
            addChildViewController("ProfileTableViewController", title: "我", imageName: "tabbar_profile")
        }
    }
    
    private func addChildViewController(childController: String,title:String,imageName:String) {
        
        let productName = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        
        let classType =   NSClassFromString(productName + "." + childController)! as! UIViewController.Type
        let viewController = classType.init()
        viewController.tabBarItem.image = UIImage(named: imageName)
        viewController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        viewController.title = title
        
        let nav = UINavigationController()
        nav.addChildViewController(viewController)
        
        self.addChildViewController(nav)
    }
    
    private lazy var composeButton:UIButton = {
        let btn = UIButton()
        
        btn.setImage(UIImage(named:"tabbar_compose_icon_add"), forState: .Normal)
        btn.setImage(UIImage(named:"tabbar_compose_icon_add_highlighted"), forState: .Highlighted)
        btn.setBackgroundImage(UIImage(named:"tabbar_compose_button"), forState: .Normal)
        btn.setBackgroundImage(UIImage(named:"tabbar_compose_button_highlighted"), forState: .Highlighted)
        
        return btn
    }()

}
