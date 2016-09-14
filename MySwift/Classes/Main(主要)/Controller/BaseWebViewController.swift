//
//  BaseWebViewController.swift
//  MySwift
//
//  Created by 曹后红 on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import NJKWebViewProgress


class BaseWebViewController: BaseViewController,UIWebViewDelegate, NJKWebViewProgressDelegate {

    var webView: UIWebView?
    var requestUrl: String?
    var progressView: NJKWebViewProgressView?
    var progressProxy:NJKWebViewProgress?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLeftNavigationItemWithImage(UIImage(named: "navigation_left_back")!)
        
        webView = UIWebView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGTH - 64))
        self.mMainView.addSubview(self.webView!)
        
        
        progressProxy = NJKWebViewProgress()
        webView?.delegate = progressProxy
        progressProxy?.webViewProxyDelegate = self
        progressProxy?.progressDelegate = self
        
        let progressBarHeight:CGFloat = 2.0
        let naviagtionBarBounds = self.navigationController?.navigationBar.bounds
        progressView = NJKWebViewProgressView(frame: CGRectMake(0, (naviagtionBarBounds?.size.height)! - progressBarHeight, (naviagtionBarBounds?.size.width)!, progressBarHeight))
        progressView?.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        
        loadURL()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.addSubview(self.progressView!)
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        progressView?.removeFromSuperview()
    }
    //MARK: - 加载地址
    func loadURL() {
        
        let url = NSURL(string: requestUrl!)
        let request = NSURLRequest(URL: url!)
        webView?.loadRequest(request)

    }
    
    //MARK: - UIWebViewDelegate
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        let url = request.URL?.absoluteString
        print("加载地址：\(url)")
        return true
        
    }
    
   
    func webViewDidStartLoad(webView: UIWebView) {
        
        
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        print("finishLoad")
    }
    
    //MARK: - NJKWebViewProgressDelegate
    func webViewProgress(webViewProgress: NJKWebViewProgress!, updateProgress progress: Float) {
        print("加载进度：\(progress)")
        progressView?.setProgress(progress, animated: true)
        self.title = webView?.stringByEvaluatingJavaScriptFromString("document.title")
    }
    
    override func doLeftNavigationBarImageBtnAction() {
        
        if ((webView?.canGoBack) == true) {
            webView?.goBack()
        }else
        {
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    
}
