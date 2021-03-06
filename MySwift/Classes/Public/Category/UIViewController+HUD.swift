//
//  UIViewController+HUD.swift
//  MySwift
//
//  Created by 曹后红 on 16/9/12.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import MBProgressHUD

// keyWindow
let KeyWindow : UIWindow = UIApplication.sharedApplication().keyWindow!

private var HUDKey = "HUDKey"
extension UIViewController
{
    var hud : MBProgressHUD?
        {
        get{
            return objc_getAssociatedObject(self, &HUDKey) as? MBProgressHUD
        }
        set{
            objc_setAssociatedObject(self, &HUDKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /**
     显示提示信息(有菊花, 一直显示, 不消失)，默认文字“加载中”，默认偏移量0
     
     - parameter view:    显示在哪个View上
     - parameter hint:    提示信息
     - parameter yOffset: y上的偏移量
     */
    func showHudInView(view: UIView, hint: String = "加载中", yOffset:CGFloat? = 0){
        let HUD = MBProgressHUD(view: view)
        HUD.label.text = hint
        HUD.label.font = UIFontSize(12)
        //设为false后点击屏幕其他地方有反应
        HUD.userInteractionEnabled = false
        //HUD内的内容的颜色
        HUD.contentColor = UIColor(red:0.82, green:0.82, blue:0.82, alpha:1.00)
        //View的眼色
        HUD.bezelView.color = UIColor.blackColor()
        HUD.margin = 10.0
        //偏移量，以center为起点
//        HUD.offset.y = yOffset ?? 0
        view.addSubview(HUD)
        HUD.showAnimated(true)
        hud = HUD
    }
    
    /**
     显示纯文字提示信息(显示在keywindow上)，默认时间2s，默认偏移量0
     
     - parameter hint: 提示信息
     - parameter duration: 持续时间(不填的话, 默认两秒)
     - parameter yOffset: y上的偏移量
     */
    func showHintInKeywindow(hint: String, duration: Double = 2.0, yOffset:CGFloat? = 0) {
        let view = KeyWindow
        let HUD = MBProgressHUD(view: view)
        view.addSubview(HUD)
        HUD.animationType = .ZoomOut
        HUD.userInteractionEnabled = false
        HUD.bezelView.color = UIColor.blackColor()
        HUD.contentColor = UIColor.whiteColor()
        HUD.mode = .Text
        HUD.label.text = hint
        HUD.showAnimated(true)
        HUD.removeFromSuperViewOnHide = false
        HUD.hideAnimated(true, afterDelay: duration)
        hud = HUD
    }
    
    
    /**
     显示纯文字提示信息，默认时间2s，默认偏移量0
     
     - parameter hint: 显示在哪个View上
     - parameter hint: 提示信息
     - parameter duration: 持续时间(不填的话, 默认两秒)
     - parameter yOffset: y上的偏移量
     */
    func showHint(view: UIView, hint: String, duration: Double = 2.0, yOffset:CGFloat? = 0) {
        let HUD = MBProgressHUD(view: view)
        view.addSubview(HUD)
        HUD.animationType = .ZoomOut
        HUD.bezelView.color = UIColor.blackColor()
        HUD.contentColor = UIColor.whiteColor()
        HUD.mode = .Text
        HUD.label.text = hint
        HUD.userInteractionEnabled = false
        HUD.removeFromSuperViewOnHide = false
        HUD.showAnimated(true)
        HUD.hideAnimated(true, afterDelay: duration)
        hud = HUD
    }
    
    
    func hideHud() {
        hud!.hideAnimated(true)
    }
    
    
}
