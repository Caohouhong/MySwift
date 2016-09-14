//
//  ShareView.swift
//  MySwift
//
//  Created by 曹后红 on 16/9/14.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class HHShareView: UIView {
    
    var viewWidth: CGFloat!
    var viewHeight: CGFloat!
    var oneWidth: CGFloat!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewWidth = self.frame.size.width
        viewHeight = self.frame.size.height
        oneWidth = viewWidth/8.0
        
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI(){
        
        let height = oneWidth + 20*UIRate
        
        let shareHoldView = UIView(frame:self.frame)
        shareHoldView.backgroundColor = UIColor.whiteColor()
        self.addSubview(shareHoldView)
        
        let shareLabel = UILabel(frame: CGRectMake(0, 0, viewWidth, 40*UIRate))
        shareLabel.text = "分享至"
        shareLabel.font = UIFontSize(15*UIRate)
        shareLabel.textAlignment = .Center
        shareHoldView.addSubview(shareLabel)
        
        let wechatBut = UIButton(frame: CGRectMake(0, 0, 36*UIRate, 36*UIRate))
        wechatBut.center = CGPointMake(oneWidth, height)
        wechatBut.setImage(UIImage(named: "wechat_72x72"), forState: .Normal)
        shareHoldView.addSubview(wechatBut)
        
        let friendsBut = UIButton(frame: CGRectMake(0, 0, 36*UIRate, 36*UIRate))
        friendsBut.center = CGPointMake(oneWidth * 3.0, height)
        friendsBut.setImage(UIImage(named: "wechat_72x72"), forState: .Normal)
        shareHoldView.addSubview(friendsBut)
        
        let QQBut = UIButton(frame: CGRectMake(0, 0, 36*UIRate, 36*UIRate))
        QQBut.center = CGPointMake(oneWidth * 5.0, height )
        QQBut.setImage(UIImage(named: "wechat_72x72"), forState: .Normal)
        shareHoldView.addSubview(QQBut)
        
        let QQRomeBut = UIButton(frame: CGRectMake(0, 0, 36*UIRate, 36*UIRate))
        QQRomeBut.center = CGPointMake(oneWidth * 7.0, height)
        QQRomeBut.setImage(UIImage(named: "wechat_72x72"), forState: .Normal)
        shareHoldView.addSubview(QQRomeBut)
        
        let sinaBut = UIButton(frame: CGRectMake(0, 0, 36*UIRate, 36*UIRate))
        sinaBut.center = CGPointMake(oneWidth, oneWidth * 3.0 + 20*UIRate)
        sinaBut.setImage(UIImage(named: "wechat_72x72"), forState: .Normal)
        shareHoldView.addSubview(sinaBut)
        
        let otherBut = UIButton(frame: CGRectMake(0, 0, 36*UIRate, 36*UIRate))
        otherBut.center = CGPointMake(oneWidth * 3.0, oneWidth * 3.0 + 20*UIRate)
        otherBut.setImage(UIImage(named: "wechat_72x72"), forState: .Normal)
        shareHoldView.addSubview(otherBut)
        
    }
}
