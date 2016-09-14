//
//  File.swift
//  MySwift
//
//  Created by 曹后红 on 16/9/3.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

//屏幕的宽度、高度
let SCREEN_WIDTH = UIScreen.mainScreen().bounds.width
let SCREEN_HEIGTH = UIScreen.mainScreen().bounds.height

///适配比(屏幕宽度／375.0)
let UIRate = SCREEN_WIDTH/375.0

///颜色设置,alpha默认为1.0
func UIColorRGBA(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat = 1.0) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

///根据十六进制生成颜色,hex样式"0x3caafa",alpha默认1.0
func UIColorFromRGB (hex:String, alpha:CGFloat = 1.0) -> UIColor {
    var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
    
    if (cString.hasPrefix("#")) {
        cString = (cString as NSString).substringFromIndex(1)
    }
    let rString = (cString as NSString).substringToIndex(2)
    let gString = ((cString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
    let bString = ((cString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
    
    var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
    NSScanner(string: rString).scanHexInt(&r)
    NSScanner(string: gString).scanHexInt(&g)
    NSScanner(string: bString).scanHexInt(&b)
    return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(alpha))
}

///系统常规字体大小
func UIFontSize(size: CGFloat) -> UIFont{
    
    return UIFont.systemFontOfSize(size)
}

///系统粗体大小
func UIFontBoldSize(size: CGFloat) -> UIFont{
    
    return UIFont.boldSystemFontOfSize(size)
}


///自定义打印日志
func PrintLog<N>(message:N,fileName:String = #file,methodName:String = #function,lineNumber:Int = #line){
    //文件地址、方法、行号、打印信息
    //        print("\(fileName as NSString)\n方法:\(methodName)\n行号:\(lineNumber)\n打印信息\(message)");
    print("方法:\(methodName)\n行号:\(lineNumber)\n打印信息:\(message)");
}





