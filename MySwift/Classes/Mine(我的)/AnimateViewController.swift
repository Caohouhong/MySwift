//
//  AnimateViewController.swift
//  MySwift
//
//  Created by 曹后红 on 16/9/6.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class AnimateViewController: BaseViewController {

    var redSquare:UIView!
    var blueSquare:UIView!
    var blackSquare:UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initTitle("动画")
        
        redSquare = UIView()
        redSquare.backgroundColor = UIColor.redColor()
        self.view.addSubview(redSquare)
        redSquare.frame = CGRectMake(10, 70, 50, 50)
        
        blueSquare = UIView()
        blueSquare.backgroundColor = UIColor.blueColor()
        self.view.addSubview(blueSquare)
        blueSquare.frame = CGRectMake(100, 70, 50, 50)
        
        blackSquare = UIView()
        blackSquare.backgroundColor = UIColor.blackColor()
        self.view.addSubview(blackSquare)
        blackSquare.frame = CGRectMake(190, 70, 50, 50)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        UIView.animateWithDuration(1) {
            self.redSquare.center.x = self.view.bounds.width - self.redSquare.center.x
        }
        
        UIView.animateWithDuration(2, delay: 0.5, usingSpringWithDamping: 0.4, initialSpringVelocity: 1, options: [], animations: {
            self.blueSquare.center.y = self.view.bounds.height/2 - self.blueSquare.center.y
            
            }, completion: nil)
        
        UIView.animateWithDuration(1, delay: 0.2, options: .CurveLinear, animations: {
            
            self.blackSquare.center.y = self.view.bounds.height - self.blackSquare.center.y
            }, completion: nil)
        
        
    }
}
