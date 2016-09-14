//
//  CyclePictureView.swift
//  MySwift
//
//  Created by 曹后红 on 16/9/6.
//  Copyright © 2016年 apple. All rights reserved.
//  

import UIKit

protocol CyclePictureViewDelegate{
    ///跳转到某个链接
    func cyclePictureSkipToSomeLink(index: Int)
}

class CyclePictureView: UIView, UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    var pageControl: UIPageControl!
    var curPage: Int = 0
    var curImageArray: NSMutableArray? //当前图片
    var imageArray: NSMutableArray?    //总的图片
    
    var viewWidth: CGFloat?            //view的宽度、高度
    var viewHeight: CGFloat?
    
    var delegate: CyclePictureViewDelegate?  // 代理
    
    var timer: NSTimer!
    
    var i: Int = 0
    
    ///true关闭计时器，false打开计时器
    var isDragging: Bool = false
    
    ///初始化传入frame与图片array即可
    init(frame: CGRect, imageArray: NSMutableArray) {
        super.init(frame: frame)
        
        viewWidth = self.frame.size.width
        viewHeight = self.frame.size.height
        
        self.curImageArray = NSMutableArray()
        self.imageArray = NSMutableArray()
        self.imageArray = imageArray
        
        scrollView = UIScrollView(frame: frame)
        scrollView.contentSize = CGSizeMake(3.0*viewWidth!, viewHeight!)
        scrollView.contentOffset = CGPointMake(viewWidth!, 0)
        scrollView.pagingEnabled = true
        scrollView.delegate = self
        self.addSubview(scrollView)
        
        pageControl = UIPageControl(frame: CGRectMake(viewWidth! - 20*UIRate*CGFloat(imageArray.count), viewHeight! - 30*UIRate, 20*UIRate*CGFloat(imageArray.count), 20*UIRate))
        pageControl.numberOfPages = imageArray.count
        pageControl.currentPage = 0
        pageControl.userInteractionEnabled = false
        pageControl.currentPageIndicatorTintColor = UIColor(red: 1, green: 0.6, blue: 0.9, alpha: 1)
        pageControl.pageIndicatorTintColor = UIColor.brownColor()
        self.addSubview(pageControl)
        
        reloadImageData()
        addTimer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //刷新图片
    func reloadImageData(){
        
        self.pageControl.currentPage = curPage
        
        var front = curPage - 1
        var last = curPage + 1
        
        if curPage == 0 {
            front = (self.imageArray?.count)! - 1
        }
        
        if curPage == (self.imageArray?.count)! - 1 {
            last = 0
        }
        
        if curImageArray?.count > 0 {
            curImageArray?.removeAllObjects()
        }
        
        //当前图片数组添加图片
        curImageArray?.addObject(self.imageArray![front])
        curImageArray?.addObject(self.imageArray![curPage])
        curImageArray?.addObject(self.imageArray![last])
        
        let subViews = self.scrollView.subviews
        if subViews.count > 0{
            for view in subViews {
                view.removeFromSuperview()
            }
        }
        
        //创建imageView
        for i in 0..<3 {
            let adImageView = UIImageView(frame: CGRectMake(CGFloat(i) * viewWidth!, 0, viewWidth!, viewHeight!))
            //一定要设置允许交互，要不然点击方法不响应
            adImageView.userInteractionEnabled = true
            let imageURL = NSURL(string: self.curImageArray![i] as! String)
            adImageView.kf_setImageWithURL(imageURL, placeholderImage: UIImage(named: "wallpaper_profile"), optionsInfo: [], progressBlock: { (receivedSize, totalSize) in
                
//                let progress = Double(receivedSize)/Double(totalSize)
//                
//                let progressStr = NSString(format: "%.2f",progress*100.0) as String
                
//                self.progressLabel.text = "下载进度：\(progressStr)%"
                
            }) { (image, error, cacheType, imageURL) in
                
            }
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapTheImage))
            adImageView.addGestureRecognizer(tap)

            
            self.scrollView.addSubview(adImageView)
        }
        
        self.scrollView.contentOffset = CGPointMake(viewWidth!, 0)
        
    }
    
    //MARK: - scrollView delegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.x >= 2.0*SCREEN_WIDTH {
            
            curPage += 1
            
            if curPage == self.imageArray?.count {
                curPage = 0
            }
            reloadImageData()
        }else if scrollView.contentOffset.x <= 0{
            
            curPage -= 1
            
            if curPage == -1 {
                curPage = (self.imageArray?.count)! - 1
            }
            reloadImageData()
        }
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
       
       isDragging = true
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        isDragging = false
    }
    
    //MARK: - 添加计时器
    func addTimer(){
        timer = NSTimer.scheduledTimerWithTimeInterval(2.5, target: self, selector: #selector(nextImage), userInfo: nil, repeats: true)
    }
    
    func nextImage(){

        if isDragging {
            return
        }
        self.scrollView.setContentOffset(CGPointMake(2.0 * viewWidth!, 0), animated: true)
    }
    
    // MARK: - Action:点击图片跳转
    func tapTheImage(){
        
        delegate?.cyclePictureSkipToSomeLink(curPage)
    }
}
