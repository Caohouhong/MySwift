//
//  HomeViewController.swift
//  MySwift
//
//  Created by 曹后红 on 16/8/29.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, CyclePictureViewDelegate{ //
    
    var collectionView : UICollectionView?
    var cyclePicture: CyclePictureView! //图片轮播
    var imageArray: NSMutableArray? //储存所有照片
    var urlArray: NSMutableArray? //存储地址
    
    var collectionItemWidth: CGFloat?  //每行4个
    var collectionTwoItemwidth: CGFloat? //每行2个
    
    var cellImageArray: NSMutableArray = [] //cell图片
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.translucent = true;
        self.automaticallyAdjustsScrollViewInsets = false;
        self.view.backgroundColor = UIColorRGBA(210, g: 210, b: 210)
        //加载轮播图片
        self.initImageView()
        
        cellImageArray = ["http://img2.3lian.com/2014/f5/77/d/61.jpg","http://pic.baike.soso.com/p/20130829/20130829094104-1901011238.jpg", "http://n5.7k7kimg.cn/uploads/allimg/091215/7_091215174014_1.jpg","http://xx.yzz.cn/public/images/101231/73_163606_a2699_lit.jpg","http://desktop.kole8.com/desktop/desk_file-11/11/27/2012/9/201291112144312.jpg","http://img.daimg.com/uploads/allimg/141115/1-141115135036.jpg","http://pic21.nipic.com/20120614/2786001_210837285000_2.jpg"]
        
        //collectionView
        let layout = HomeViewLayout()
        
        collectionItemWidth = (SCREEN_WIDTH - 2.0*UIRate)/4.0
        collectionTwoItemwidth = (SCREEN_WIDTH - 1*UIRate)/2.0
        
        layout.minimumLineSpacing = 0.5*UIRate
        layout.minimumInteritemSpacing = 0.3*UIRate
       
//        layout.itemSize = CGSizeMake(collectionItemWidth!, collectionItemWidth!)
        
        collectionView = UICollectionView(frame: CGRectMake(0, 64 + 200*UIRate, SCREEN_WIDTH, collectionItemWidth!*3 + 1.5*UIRate), collectionViewLayout: layout)
        
        collectionView?.registerClass(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = UIColor(red:0.18, green:0.49, blue:0.73, alpha:1.00)
       
        self.view.addSubview(collectionView!)
        
//        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
//        collectionView?.addGestureRecognizer(longPress)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //计时器开始滚动
        cyclePicture.isDragging = false
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        //计时器暂停滚动
        cyclePicture.isDragging = true
    }
    
    //MARK: - 图片轮播
    func initImageView(){
        //初始化图片数据
        imageArray = NSMutableArray()
        urlArray = NSMutableArray()
        
       let holdView = UIView(frame: CGRectMake(0, 64, SCREEN_WIDTH, 200*UIRate))
        self.view.addSubview(holdView)
        
        //添加数据
        let array = [   ["image":"http://dfzy.ggjy.net/ziran/UploadSoftPic/200705/20070511100822129.jpg","url":"https://www.baidu.com"],
                    ["image":"http://pic2.52pk.com/files/120116/801441_153023_4787.jpg","url":"http://cn.bing.com"],
                    ["image":"http://img5q.duitang.com/uploads/item/201411/21/20141121230440_yBssa.jpeg","url":"https://www.yahoo.com"], ["image":"http://img04.tooopen.com/images/20130916/sy_41580784261.jpg","url":"https://www.so.com"],
                     ["image":"http://e-lvyou.com/admin/Upload_mp_pic/2014316175741877.jpg","url":"http://gold.xitu.io/explore/all"], ["image":"http://pic.zsucai.com/files/2013/0814/xychh1.jpg","url":"http://www.swift51.com/swift.html"]]
        
        
        for item in array {
            imageArray?.addObject(item["image"]!)
            urlArray?.addObject(item["url"]!)
        }
        
        //图片轮播
        cyclePicture = CyclePictureView(frame: CGRectMake(0, 0, SCREEN_WIDTH, 200*UIRate), imageArray: imageArray!)
        cyclePicture.delegate = self
        holdView.addSubview(cyclePicture)
    
    }
    
    //MARK: - collectionView delegate && datasource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 7
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let identify: String = "cell"
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identify, forIndexPath: indexPath)  as! HomeCollectionViewCell

        let url = NSURL(string: cellImageArray[indexPath.row] as! String)
        cell.imageView?.kf_setImageWithURL(url)
        
        cell.cellWithDataAtIndex(indexPath.row)
        
        cell.backgroundColor = UIColor.whiteColor()
        
        //选中效果
        let selectedBGView = UIView()
        selectedBGView.frame = cell.bounds
        selectedBGView.backgroundColor = UIColor.lightGrayColor()
        cell.selectedBackgroundView = selectedBGView
        
        return cell
    }
    
    //点击变色，手离开后颜色恢复
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            showHint(self.view, hint: "这是第一个cell")
            break
            
        case 1:
           showHudInView(self.view)
            break
        case 2:
            hideHud()
            break
        default:
            
            break
        }
        
    }
    
    //MARK: - CyclePictureViewDelegate:广告图片点击跳转到某个外链
    func cyclePictureSkipToSomeLink(index: Int) {
        
        let mWebView = BaseWebViewController()
        mWebView.requestUrl = self.urlArray?[index] as? String
        self.navigationController?.pushViewController(mWebView, animated: true)
    }
}
