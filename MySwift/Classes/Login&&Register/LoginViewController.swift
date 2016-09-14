//
//  ViewController.swift
//  MySwift
//
//  Created by 曹后红 on 16/8/16.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    /*
       疑问 1.   !的作用：隐式可选型，可存nil也可存值，在使用时确保有值。
                 与？的区别， 在使用时可以不解包直接使用。
     */
    var txtUser: UITextField! //用户名输入框
    var txtPwd: UITextField!  //密码输入框
    var formView: UIView! //登录框视图
    var horizontalLine: UIView! //分隔线
    var confirmButton: UIButton! //登录按钮
    
    var errorMsgView:UILabel! //错误提示
    
    var titleImgView: UIImageView! //标题文字
    var dotImgView: UIImageView!   //dot 图片
    var topConstraints: Constraint? //登录框距顶部距离约束
    var leftConstraints:Constraint?
    
    var buttonContraints:Constraint? //登录按钮约束
    var titleImgConstraints: Constraint? //title约束
    var dotContraints:Constraint? //dot约束
    
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
    
    
    
    var bubble1:UIImageView!
    var bubble2:UIImageView!
    var bubble3:UIImageView!
    var bubble4:UIImageView!
    var bubble5:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapSingle = UITapGestureRecognizer(target: self, action: #selector(tapSingleAction))
        tapSingle.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapSingle)
        
        //设置背景图片
        let backgroundImg = UIImageView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height))
        backgroundImg.image = UIImage(named: "login_bg_img")
        self.view.addSubview(backgroundImg)
        
        
        self.bubble1 = UIImageView(frame: CGRectMake(30, 150, 130, 130))
        bubble1.image = UIImage(named: "login_bubble1")
        self.view.addSubview(self.bubble1)
        
        self.bubble2 = UIImageView(frame: CGRectMake(220, 100, 124, 124))
        bubble2.image = UIImage(named: "login_bubble2")
        self.view.addSubview(self.bubble2)

        
        self.bubble3 = UIImageView(frame: CGRectMake(170, 220, 120, 120))
        bubble3.image = UIImage(named: "login_bubble3")
        self.view.addSubview(self.bubble3)

        
        self.bubble4 = UIImageView(frame: CGRectMake(30, 400, 84, 84))
        bubble4.image = UIImage(named: "login_bubble4")
        self.view.addSubview(self.bubble4)

        
        self.bubble5 = UIImageView(frame: CGRectMake(200, 350, 100, 100))
        bubble5.image = UIImage(named: "login_bubble5")
        self.view.addSubview(self.bubble5)
        
        self.bubble1.transform = CGAffineTransformMakeScale(0, 0)
        self.bubble2.transform = CGAffineTransformMakeScale(0, 0)
        self.bubble3.transform = CGAffineTransformMakeScale(0, 0)
        self.bubble4.transform = CGAffineTransformMakeScale(0, 0)
        self.bubble5.transform = CGAffineTransformMakeScale(0, 0)
       
        
        //登录框高度
        let formViewHeight = 90
        
        //登录框背景
        self.formView = UIView()
        self.formView.layer.borderWidth = 0.5
        self.formView.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.formView.backgroundColor = UIColor.whiteColor()
        self.formView.layer.cornerRadius = 5
        self.view.addSubview(self.formView)
        //最常规的设置模式
        self.formView.snp_makeConstraints { (make) in
            
            self.leftConstraints = make.left.equalTo(-self.view.bounds.width).constraint
            make.width.equalTo(self.view.bounds.width - 30)
            //存储top属性
            self.topConstraints = make.centerY.equalTo(-50).constraint
            
            make.height.equalTo(formViewHeight)
        }
        
        //分隔线
        self.horizontalLine = UIView()
        self.horizontalLine.backgroundColor = UIColor.lightGrayColor()
        self.formView.addSubview(self.horizontalLine)
        self.horizontalLine.snp_makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.centerY.equalTo(self.formView)
        }
        
        //用户icon
        let imgLock1 = UIImageView(frame: CGRectMake(11, 11, 22, 22))
        imgLock1.image = UIImage(named: "login_user_icon")
        
        //密码icon
        let imgLock2 = UIImageView(frame: CGRectMake(11, 11, 22, 22))
        imgLock2.image = UIImage(named: "login_pwd_icon")
        
        //用户名输入框
        self.txtUser = UITextField()
        self.txtUser.delegate = self
        self.txtUser.placeholder = "用户名"
        self.txtUser.tag = 100
        self.txtUser.returnKeyType = UIReturnKeyType.Next
        self.txtUser.leftView = UIView(frame: CGRectMake(0, 0, 44, 44))
        self.txtUser.leftViewMode = UITextFieldViewMode.Always
        
        //用户名输入框左侧图标
        self.txtUser.leftView!.addSubview(imgLock1)
        self.formView.addSubview(self.txtUser)
        
        //布局
        self.txtUser.snp_makeConstraints { (make) in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(44)
            make.centerY.equalTo(0).offset(-formViewHeight/4)
        }
        
        //密码输入框
        self.txtPwd = UITextField()
        self.txtPwd.delegate = self
        self.txtPwd.placeholder = "密码"
        self.txtPwd.tag = 101
        self.txtPwd.returnKeyType = UIReturnKeyType.Next
        self.txtPwd.leftView = UIView(frame: CGRectMake(0, 0, 44, 44))
        self.txtPwd.leftViewMode = UITextFieldViewMode.Always
        
        //密码输入框左侧图标
        self.txtPwd.leftView!.addSubview(imgLock2)
        self.formView.addSubview(txtPwd)
        
        //布局
        self.txtPwd.snp_makeConstraints { (make) in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(44)
            make.centerY.equalTo(self.formView).offset(formViewHeight/4)
        }
        
        //登录按钮
        self.confirmButton = UIButton(type: UIButtonType.Custom)
        self.confirmButton.setTitle("登录", forState: UIControlState.Normal)
        self.confirmButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.confirmButton.layer.cornerRadius = 5
        self.confirmButton.backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 1, alpha: 0.8)
        self.confirmButton.addTarget(self, action: #selector(loginConfirm), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(self.confirmButton)
        self.confirmButton.snp_makeConstraints { (make) in
           self.buttonContraints = make.left.equalTo(-self.view.bounds.width).constraint
            make.width.equalTo(self.view.bounds.width - 30)
            make.top.equalTo(self.formView.snp_bottom).offset(20)
            make.height.equalTo(44)
        }
        
        self.errorMsgView = UILabel()
        self.errorMsgView.backgroundColor = UIColor.redColor()
        self.errorMsgView.textColor = UIColor.whiteColor()
        self.errorMsgView.layer.masksToBounds = true
        self.errorMsgView.layer.cornerRadius = 5
        self.errorMsgView.hidden = true
        self.errorMsgView.textAlignment = .Center
        self.errorMsgView.text = "Error! try again!!!"
        self.view.addSubview(self.errorMsgView)
        self.errorMsgView.snp_makeConstraints { (make) in
            make.size.equalTo(self.confirmButton)
            make.center.equalTo(self.confirmButton)
        }
        
        
        
        //标题
        self.titleImgView = UIImageView()
        titleImgView.image = UIImage(named: "login_text_img")
        self.view.addSubview(self.titleImgView)
        
        self.titleImgView.snp_makeConstraints { (make) in
             make.bottom.equalTo(self.formView.snp_top).offset(-20)
            self.titleImgConstraints = make.centerX.equalTo(-self.view.bounds.width).constraint
        }
        
        
        //dot
        dotImgView = UIImageView()
        dotImgView.image = UIImage(named: "login_dot")
        self.view.addSubview(dotImgView)
        dotImgView.snp_makeConstraints { (make) in
            self.dotContraints = make.left.equalTo(-self.view.bounds.width/2).constraint
            make.bottom.equalTo(self.titleImgView.snp_top).offset(-2)
        }
        
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    //MARK: - textFieldDelegate
    func textFieldDidBeginEditing(textField: UITextField) {
//        UIView.animateWithDuration(0.5) { 
//            self.topConstraints?.updateOffset(-125)
//            self.view.layoutIfNeeded()
//        }
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let tag = textField.tag
        switch tag {
        case 100:
            self.txtPwd.becomeFirstResponder()
            break
        case 101:
            loginConfirm()
            break
        default:
          break
        }
        return true
    }
    //MARK: - 登录按钮
    func loginConfirm(){
//        //收起键盘
//        self.view.endEditing(true)
//        
//        UIView.animateWithDuration(0.5) { 
//            self.topConstraints?.updateOffset(0)
//            self.view.layoutIfNeeded()
        
        self.confirmButton.addSubview(self.spinner)
        self.spinner.frame.origin = CGPointMake(10, 3)
        
        self.spinner.startAnimating()
        
        self.confirmButton.center.x -= 30
        
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.Repeat, animations: { 
//            self.txtPwd.transform = CGAffineTransformRotate(self.txtPwd.transform, CGFloat(M_PI_2))
            }, completion: nil)
        
        UIView.animateWithDuration(1.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: {
            self.confirmButton.center.x += 30
            
            
            
            }, completion:{ _ in
                UIView.animateWithDuration(0.3, animations: { 
                    self.confirmButton.center.y += 70
                    self.spinner.removeFromSuperview()
                    },completion: { _ in
                        UIView.transitionWithView(self.errorMsgView, duration: 1, options: .TransitionFlipFromRight, animations: {
                            self.errorMsgView.hidden = false
                            }, completion: { _ in
                                let shopVC = ShoppingViewController()
                                self.navigationController?.pushViewController(shopVC, animated: true)
                                self.errorMsgView.hidden = true
                        })
                })
        })
        
//        }
        
    }

    //MARK: - 单指点击屏幕
    func tapSingleAction(){
        //收起键盘
        self.view.endEditing(true)
        
//        UIView.animateWithDuration(0.5) {
//            self.topConstraints?.updateOffset(-50)
//            self.view.layoutIfNeeded()
//        }
    }
    
    //MARK: - 数值位数控制
    func getNumber(number: String , index: UInt) -> String{
        
        var result: String
        
        let double = (number as NSString).doubleValue

        result = NSString(format: "%.\(index)f",double) as String
        
        return result
    }
    
    override func viewDidAppear(animated: Bool) {
       
        //MARK: - bubble的动画
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: [], animations: {
            self.bubble1.transform = CGAffineTransformMakeScale(1, 1)
            }, completion: nil)
        
        UIView.animateWithDuration(0.3, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: [], animations: {
            
            self.bubble3.transform = CGAffineTransformMakeScale(1, 1)
            self.bubble4.transform = CGAffineTransformMakeScale(1, 1)
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.3, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: [], animations: {
            
            self.bubble2.transform = CGAffineTransformMakeScale(1, 1)
            
            self.bubble5.transform = CGAffineTransformMakeScale(1, 1)
            }, completion: nil)
        
        //MARK: - title 与 dot的动画
        UIView.animateWithDuration(0.5, delay: 0.3, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: [], animations: {
            
                self.titleImgConstraints?.updateOffset(0)
                self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        UIView.animateWithDuration(4, delay: 0.4, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: [], animations: {
            
            self.dotContraints?.updateOffset(111)
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        //MARK: - 输入框、按钮动画
        UIView.animateWithDuration(1, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {
            
            self.leftConstraints?.updateOffset(15)
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.6, options: .CurveEaseOut, animations: {
            
            self.buttonContraints?.updateOffset(15)
            self.view.layoutIfNeeded()
            
            }, completion: nil)
    }
}



