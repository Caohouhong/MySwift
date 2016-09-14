
//
//  HomeCollectionViewCell.swift
//  MySwift
//
//  Created by 曹后红 on 16/9/10.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView?
    var textLabel: UILabel?
    var cellWidth: CGFloat! //宽
    var cellHeight: CGFloat! //高
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cellWidth = self.contentView.bounds.size.width
        cellHeight = self.contentView.bounds.size.height
        
        imageView = UIImageView(frame: CGRectMake(0, 0, cellWidth/2, cellHeight/2))
        imageView?.center = self.contentView.center
        self.addSubview(imageView!)
        
        textLabel = UILabel(frame: CGRectMake(0, cellHeight - 20*UIRate, cellWidth, 20*UIRate))
        textLabel?.font = UIFontSize(15*UIRate)
        textLabel?.textAlignment = .Center
        self.addSubview(textLabel!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func cellWithDataAtIndex(index: Int){
        
        switch index {
        case 0:
            textLabel?.text = "火影"
            break
        case 1:
            textLabel?.text = "还是火影"
            break
        case 2:
            textLabel?.text = "火影2"
            break
        case 3:
            textLabel?.text = "蚂蚁"
            break
        case 4:
            textLabel?.text = "飞机"
            break
        case 5:
            textLabel?.text = "花"
            break
        case 6:
            textLabel?.text = "太阳"
            break
        default:
            break
        }
        
        }
        
    }
