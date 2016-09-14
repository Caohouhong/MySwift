//
//  MineViewController.swift
//  MySwift
//
//  Created by 曹后红 on 16/9/6.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit


class MineViewController: UIViewController {

    var testBtn: UIButton! //跳转按钮
    var animateBtn:UIButton!
    var popupVC: CNPPopupController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        testBtn = UIButton(type: UIButtonType.System)
        testBtn.setTitle("点击跳转", forState: .Normal)
        testBtn.layer.borderWidth = 0.6
        testBtn.layer.cornerRadius = 5
        testBtn.backgroundColor = UIColorFromRGB("0x3caafa", alpha: 0.5)
        
        testBtn.addTarget(self, action: #selector(testBtnAction), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(testBtn)
        testBtn.snp_makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.left.equalTo(15*UIRate)
            make.right.equalTo(-15*UIRate)
            make.height.equalTo(45*UIRate)
        }
        
        //动画按钮
        animateBtn = UIButton(type: UIButtonType.System)
        animateBtn.setTitle("动画跳转", forState: .Normal)
        animateBtn.layer.borderWidth = 0.6
        animateBtn.layer.cornerRadius = 5
        animateBtn.backgroundColor = UIColorFromRGB("0x3cfafa")
        
        animateBtn.addTarget(self, action: #selector(animateBtnAction), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(animateBtn)
        animateBtn.snp_makeConstraints { (make) in
            make.centerY.equalTo(self.view).offset(100*UIRate)
            make.left.equalTo(15*UIRate)
            make.right.equalTo(-15*UIRate)
            make.height.equalTo(45*UIRate)
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func testBtnAction(){
        let shopVC = ShoppingViewController()
        self.navigationController?.pushViewController(shopVC, animated: true)
        
    }

    
    func animateBtnAction(){
        let animateVC = AnimateViewController()
        self.navigationController?.pushViewController(animateVC, animated: true)
        
//        self.showPopupView(CNPPopupStyle.Centered)
    }
    
    func showPopupView(popupStyle: CNPPopupStyle){
        
        let customView = UIView(frame: CGRectMake(0, 0 , 300, 400))
        customView.backgroundColor = UIColor.whiteColor()
        
        let cancelBtn = UIButton(frame: CGRectMake(0, 300, 150, 100))
        cancelBtn.backgroundColor = UIColor.blueColor()
        customView.addSubview(cancelBtn)

        let confirmBtn = UIButton(frame: CGRectMake(150, 300, 150, 100))
        confirmBtn.backgroundColor = UIColor.blackColor()
        customView.addSubview(confirmBtn)
        
        let xBtn = UIButton(frame: CGRectMake(150 - 10, 450, 22, 22))
        xBtn.setImage(UIImage(named: "home_tabbar_press_22x22_"), forState: .Normal)
       
        self.popupVC = CNPPopupController(contents: [customView,xBtn])
        self.popupVC.presentPopupControllerAnimated(true)
        
    }
}
