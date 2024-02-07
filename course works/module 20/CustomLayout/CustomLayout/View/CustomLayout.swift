//
//  CustomLayout.swift
//  CustomLayout
//
//  Created by Игорь Крысин on 11.01.2024.
//

import UIKit

protocol CustomLayoutDelegate: AnyObject {
      func collectionView( _ collectionView: UICollectionView, heightForImageAtIndexPath indexPath: IndexPath) -> CGSize

}

class CustomLayout: UICollectionViewFlowLayout {
    
    weak var delegateLayout: CustomLayoutDelegate?
    
    private let numberOfColumns = 2
    
    private let cellPadding: CGFloat = 2
    
    private var cashe: [UICollectionViewLayoutAttributes] = []
    
    private var contentHeight: CGFloat = 0
    
    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else { return 0}
        return collectionView.bounds.width
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        guard cashe.isEmpty, let collectionView = collectionView else { return }
        
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffset: [CGFloat] = []
        
        for column in 0..<numberOfColumns {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        var column = 0
        
        var yOffset: [CGFloat] = .init(repeating: 0, count: numberOfColumns)
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            
            let imageSize = delegateLayout?.collectionView(collectionView, heightForImageAtIndexPath: indexPath)
            
            let cellWidth = columnWidth
            
            var cellHeight = imageSize!.height * cellWidth / imageSize!.width
            cellHeight = cellPadding * 2 + cellHeight
            
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: cellWidth, height: cellHeight)
            
            let insertFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            attributes.frame = insertFrame
            cashe.append(attributes)
            
            yOffset[column] = yOffset[column] + cellHeight
            column = column < (numberOfColumns - 1) ? (column + 1) : 0
            
        }
        
        
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibaleLayoutAtttributes = [UICollectionViewLayoutAttributes]()
        for attributes in cashe {
            if attributes.frame.intersects(rect) {
                visibaleLayoutAtttributes.append(attributes)
            }
        }
        return visibaleLayoutAtttributes
    }
    
    
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cashe[indexPath.item]
    }
    
    
    
}












