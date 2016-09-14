//
//  BaseViewController.swift
//  MySwift
//
//  Created by 曹后红 on 16/9/6.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    ///baseView,默认frame从Nav开始到底部，颜色white
    var mMainView:UIView!
    
    override func viewDidLoad() {
        self.navigationController!.navigationBar.translucent = true;
        self.automaticallyAdjustsScrollViewInsets = false;
        
        self.baseUI()
    }
    
    func baseUI(){
        
        mMainView = UIView(frame: CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGTH - 64))
        mMainView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.mMainView)
    }

    ///初始化NavigationBarTitle
    func initTitle(title:String){
        self.navigationItem.title = title
    }
    
    ///初始化NavigationBar左按钮（图片）
    func initLeftNavigationItemWithImage(image: UIImage){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .Plain, target: self, action: #selector(doLeftNavigationBarImageBtnAction))
    }
    
    ///初始化NavigationBar左按钮(文字)
    func initLeftNavigationItemWithText(text: String){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: text, style: UIBarButtonItemStyle.Plain, target: self, action: #selector(doLeftNavigationBarTextBtnAction))
    }
    
    
    ///初始化NavigationBar右按钮(图片)
    func initRightNavigationItemWithImage(image: UIImage){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: UIBarButtonItemStyle.Plain, target: self, action: #selector(doRightNavigationBarImageBtnAction))
    }
    
    ///初始化NavigationBar右按钮(文字)
    func initRightNavigationItemWithText(text: String){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: text, style: UIBarButtonItemStyle.Plain, target: self, action: #selector(doRightNavigationBarTextBtnAction))
    }
    
    
    ///NavigationBar左图片点击按钮事件
    func doLeftNavigationBarImageBtnAction(){
        
    }
    
    ///NavigationBar左文字点击按钮事件
    func doLeftNavigationBarTextBtnAction(){
        
    }

    ///NavigationBar右图片按钮点击事件
    func doRightNavigationBarImageBtnAction(){
        
    }
    
    ///NavigationBar右文字按钮点击事件
    func doRightNavigationBarTextBtnAction(){
        
    }
    
}
