//
//  HomeViewLayout.swift
//  MySwift
//
//  Created by 曹后红 on 16/9/10.
//  Copyright © 2016年 apple. All rights reserved.
//  参考：http://www.hangge.com/blog/cache/detail_591.html#


import UIKit

class HomeViewLayout: UICollectionViewFlowLayout {

    var largeCellWidth: CGFloat!
    var smallCellWidth: CGFloat!
    
    let lineSpacing:CGFloat = 0.5
    
    
    // 内容区域总大小，不是可见区域
    override func collectionViewContentSize() -> CGSize {
        largeCellWidth = (collectionView!.bounds.size.width - lineSpacing)/2
        smallCellWidth = (collectionView!.bounds.size.width - lineSpacing * 3)/4
        return CGSizeMake(collectionView!.bounds.size.width,
                          smallCellWidth * 3  )
    }
    
    // 所有单元格位置属性
    override func layoutAttributesForElementsInRect(rect: CGRect)
        -> [UICollectionViewLayoutAttributes]? {
            var attributesArray = [UICollectionViewLayoutAttributes]()
            let cellCount = self.collectionView!.numberOfItemsInSection(0)
            for i in 0..<cellCount {
                let indexPath =  NSIndexPath(forItem:i, inSection:0)
                
                let attributes =  self.layoutAttributesForItemAtIndexPath(indexPath)
                
                attributesArray.append(attributes!)
                
            }
            return attributesArray
    }
    // 这个方法返回每个单元格的位置和大小
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath)
        -> UICollectionViewLayoutAttributes? {
            //当前单元格布局属性
            let attribute =  UICollectionViewLayoutAttributes(forCellWithIndexPath:indexPath)
            
            //当前行数，每行显示3个图片，1大2小
            let line:Int =  indexPath.item <= 2 ? 0 : 1
            //当前行的Y坐标
            let lineOriginY =  largeCellWidth * CGFloat(line) + CGFloat(lineSpacing * CGFloat(line))
//
            //右侧单元格X坐标，这里按左右对齐，所以中间空隙大
            let rightLargeX =  collectionView!.bounds.size.width - largeCellWidth
            let rightSmallX =  collectionView!.bounds.size.width - largeCellWidth
            
            let itemNumber = 7
            
            if (indexPath.item % itemNumber == 0) {
                attribute.frame = CGRectMake(0, 0, largeCellWidth,
                                             largeCellWidth)
            } else if (indexPath.item % itemNumber == 1) {
                attribute.frame = CGRectMake(rightSmallX, lineOriginY, largeCellWidth,
                                             smallCellWidth)
            } else if (indexPath.item % itemNumber == 2) {
                attribute.frame = CGRectMake(rightSmallX,
                                             0.5 + smallCellWidth , largeCellWidth, smallCellWidth)
            } else if (indexPath.item % itemNumber == 3) {
                attribute.frame = CGRectMake(0, lineOriginY, smallCellWidth,
                                             smallCellWidth )
            } else if (indexPath.item % itemNumber == 4) {
                attribute.frame = CGRectMake( smallCellWidth + lineSpacing,
                                             lineOriginY , smallCellWidth, smallCellWidth)
            } else if (indexPath.item % itemNumber == 5) {
                attribute.frame = CGRectMake(rightLargeX, lineOriginY, smallCellWidth,
                                             smallCellWidth)
            }else if (indexPath.item % itemNumber == 6){
                attribute.frame = CGRectMake( 3 * (smallCellWidth + lineSpacing),
                                            largeCellWidth + lineSpacing, smallCellWidth, smallCellWidth)
            }
            
            return attribute
    }
    /*
     //如果有页眉、页脚或者背景，可以用下面的方法实现更多效果
     func layoutAttributesForSupplementaryViewOfKind(elementKind: String!,
     atIndexPath indexPath: NSIndexPath!) -> UICollectionViewLayoutAttributes!
     func layoutAttributesForDecorationViewOfKind(elementKind: String!,
     atIndexPath indexPath: NSIndexPath!) -> UICollectionViewLayoutAttributes!
     */
}
