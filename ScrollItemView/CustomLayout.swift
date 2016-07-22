//
//  CustomLayout.swift
//  ScrollItemView
//
//  Created by 马超 on 16/7/22.
//  Copyright © 2016年 qikeyun. All rights reserved.
//

import UIKit

let edgeMargin: CGFloat = 15   // 边界的间距
let padding: CGFloat = 10     // 内部每个cell的间距
let column: Int = 4      // 每页有多少列
let row: Int = 2        // 每页有多少行


class CustomLayout: UICollectionViewLayout {
    
    private var layoutAttr: [UICollectionViewLayoutAttributes] = []
    
    var totalCount: Int {  // 有多少cell
        get {
            return collectionView!.numberOfItemsInSection(0)
        }
    }
    
    var page: Int {
        get {
            let numOfPage: Int = column * row
            return totalCount / numOfPage + 1
        }
    }
    
    // 重写此方法，自定义想要的布局
    override func prepareLayout() {
        super.prepareLayout()
        
        // 这个方法最主要的任务是计算出每个cell的位置
        layoutAttr = []
        var indexPath: NSIndexPath
        for index in 0..<totalCount {
            indexPath = NSIndexPath(forRow: index, inSection: 0)
            let attributes = layoutAttributesForItemAtIndexPath(indexPath)!
            
            layoutAttr.append(attributes)
        }
    }

    override func collectionViewContentSize() -> CGSize { // 返回滚动的Size，根据页数计算出来
        return CGSizeMake(collectionView!.frame.size.width * CGFloat(page), collectionView!.frame.size.height)
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        
        // 这个方法用来计算每一个cell的位置
        let att: UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        
        let collectW: CGFloat = collectionView!.frame.size.width   // collection view 宽度
        let numOfPage: Int = column * row
        let pageIndex: Int = indexPath.row / numOfPage    // 当前cell处在哪一个页
        let columnInPage: Int = indexPath.row % numOfPage % column   // 当前cell 在当前页的哪一列，用来计算位置
        let rowInPage: Int = indexPath.row % numOfPage / column  // 当前cell 在当前页的哪一行，用来计算位置
        // 计算宽度
        let cellW: CGFloat = (collectW - edgeMargin * 2 - CGFloat(column - 1) * padding) / CGFloat(column)
        // 高度
        let cellH: CGFloat = cellW
        // x
        let cellX: CGFloat = collectW * CGFloat(pageIndex) + edgeMargin + (cellW + padding) * CGFloat(columnInPage)
        // y
        let cellY :CGFloat = edgeMargin + (cellH + padding) * CGFloat(rowInPage)
        
        att.frame = CGRectMake(cellX, cellY, cellW, cellH)
        return att
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return layoutAttr
    }
    
    
}
