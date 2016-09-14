//
//  HHTabBarController.swift
//  MySwift
//
//  Created by 曹后红 on 16/8/24.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class HHTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewControllers()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override class func initialize() {
        
        //改变tabbar字体和图片的颜色（如果设置了选中图片，则图片为选中图片）
        let tabBar = UITabBar.appearance()
        tabBar.tintColor = UIColor(red: 111/255, green: 111/255, blue: 111/255, alpha: 1)

    }
    
    /**
     # 添加子控制器
     */
    private func addChildViewControllers() {
        addChildViewController(HomeViewController(), title: "首页", imageName: "home_tabbar_normal_22x22_", selectedImageName: "home_tabbar_press_22x22_")
        addChildViewController(VideoViewController(), title: "视频", imageName: "video_tabbar_normal_22x22_", selectedImageName: "video_tabbar_press_22x22_")
        addChildViewController(LoginViewController(), title: "关注", imageName: "newcare_tabbar_normal_22x22_", selectedImageName: "newcare_tabbar_press_22x22_")
        addChildViewController(MineViewController(), title: "我的", imageName: "mine_tabbar_normal_22x22_", selectedImageName: "mine_tabbar_press_22x22_")
    }

    
    func addChildViewController(childController: UIViewController, title: String, imageName: String,selectedImageName: String) {
       childController.tabBarItem.image = UIImage(named: imageName)
       childController.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.imageWithRenderingMode(.AlwaysOriginal)
       childController.title = title
        let nav = HHNavigationController(rootViewController: childController)
        addChildViewController(nav)
        
    }


}
