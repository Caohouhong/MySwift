//
//  ShoppingViewController.swift
//  MySwift
//
//  Created by 曹后红 on 16/9/6.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class ShoppingViewController: BaseViewController {

    //popup窗口
    var popupView:CNPPopupController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initTitle("美购")
        self.initRightNavigationItemWithText("分享")
        
   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
    }
    
    
    override func doRightNavigationBarTextBtnAction() {
        
        let shareView = HHShareView(frame: CGRectMake(0, 0, SCREEN_WIDTH - 30*UIRate, 300*UIRate))
        self.popupView = CNPPopupController(contents:[shareView])
        self.popupView.theme.presentationStyle = .SlideInFromTop
        self.popupView.theme.dismissesOppositeDirection = true
        self.popupView.presentPopupControllerAnimated(true)
        
    }
}
    

