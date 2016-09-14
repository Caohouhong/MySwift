//
//  HHNavigationController.swift
//  MySwift
//
//  Created by 曹后红 on 16/8/24.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class HHNavigationController: UINavigationController {

    override class func initialize() {
        super.initialize()
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = UIColor ( red: 0.6173, green: 1.0, blue: 0.996, alpha: 1.0 )
        //设置左右bar的颜色
        navBar.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        
        //设置title的属性，字体，颜色
        navBar.titleTextAttributes = [NSFontAttributeName: UIFont.systemFontOfSize(17),NSForegroundColorAttributeName: UIColor.blackColor()]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            //push时隐藏tabbar
            viewController.hidesBottomBarWhenPushed = true
//
            //左侧返回按钮（带上一层的title）
            viewController.navigationItem.backBarButtonItem = UIBarButtonItem(image: UIImage(named: "navigation_left_back"), style: .Plain, target: self, action: #selector(navigationBack))

            //左侧返回按钮 （frame有点问题）
//            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image:    UIImage(named: "navigation_left_back"), style: .Plain, target: self, action: #selector(navigationBack))
        }
        super.pushViewController(viewController, animated: true)
    }
    
    func navigationBack(){
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
