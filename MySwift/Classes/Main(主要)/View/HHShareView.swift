//
//  ShareView.swift
//  MySwift
//
//  Created by 曹后红 on 16/9/14.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class HHShareView: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var viewWidth: CGFloat!
    var oneWidth: CGFloat!
    var cellDataDic = [["image":"wechat_72x72","text":"微信"],["image":"wechat_72x72","text":"朋友圈"], ["image":"wechat_72x72","text":"QQ"], ["image":"wechat_72x72","text":"QQ空间"], ["image":"wechat_72x72","text":"新浪微博"], ["image":"wechat_72x72","text":"其他"]]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewWidth = self.frame.size.width
        oneWidth = viewWidth/4.0
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI(){
        
        let height = 40*UIRate
        
        let shareHoldView = UIView(frame:self.frame)
        shareHoldView.backgroundColor = UIColor.whiteColor()
        self.addSubview(shareHoldView)
        
        let shareLabel = UILabel(frame: CGRectMake(0, 0, viewWidth, 40*UIRate))
        shareLabel.text = "分享至"
        shareLabel.font = UIFontSize(15*UIRate)
        shareLabel.textAlignment = .Center
        shareHoldView.addSubview(shareLabel)
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSizeMake(oneWidth, oneWidth)
        
        let collectionView = UICollectionView(frame: CGRectMake(0, height, viewWidth, oneWidth*2.0), collectionViewLayout: layout)
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "shareCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.whiteColor()
        
        shareHoldView.addSubview(collectionView)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("shareCell", forIndexPath: indexPath)
        
        let imageView = UIImageView(frame: CGRectMake(0, 0, 36*UIRate, 36*UIRate))
        imageView.center = cell.contentView.center
        imageView.image = UIImage(named: cellDataDic[indexPath.row]["image"]!)
        cell.contentView.addSubview(imageView)
        
        let textLabel = UILabel(frame: CGRectMake(0, cell.contentView.frame.height - 30*UIRate, oneWidth, 30*UIRate))
        textLabel.text = cellDataDic[indexPath.row]["text"]!
        textLabel.font = UIFontSize(13*UIRate)
        textLabel.textAlignment = .Center
        cell.contentView.addSubview(textLabel)
        
        cell.backgroundColor = UIColor.whiteColor()
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            
            break
        case 1:
            break
        case 2:
            break
        case 3:
            break
        case 4:
            break
        case 5:
            break
        case 6:
            break
        default:
            break
        }
    }
    
}

