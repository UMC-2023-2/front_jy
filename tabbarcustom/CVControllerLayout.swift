//
//  CVControllerLayout.swift
//  tabbarcustom
//
//  Created by 신지연 on 2024/01/29.
//

import UIKit
import SnapKit

class CVControllerLayout: UICollectionViewFlowLayout {
    
    public var sideItemScale: CGFloat = 0.5
    public var sideItemAlpha: CGFloat = 0.5
    public var spacing: CGFloat = 100
    
    public var isPagingEnabled: Bool = true
    
    private var isSetup: Bool = false
    
    override public func prepare() {
        super.prepare()
        if !isSetup {
            setupLayout()
            //scrollToInitialPosition()
            isSetup = true
        }
    }
    
    private func setupLayout() {
        guard let collectionView = self.collectionView else { return }
        
        let collectionViewSize = collectionView.bounds.size
        
        let xInset = (collectionViewSize.width - self.itemSize.width) / 2
        let yInset = (collectionViewSize.height - self.itemSize.height) / 2
        
        self.sectionInset = UIEdgeInsets(top: yInset, left: xInset, bottom: yInset, right: xInset)
        
        let itemWidth = self.itemSize.height
        
        let scaledItemOffset = (itemWidth - itemWidth * self.sideItemScale) / 2
        self.minimumLineSpacing = spacing - scaledItemOffset
        
        self.scrollDirection = .vertical
    }
    
    public override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    public override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let superAttributes = super.layoutAttributesForElements(in: rect),
              let attributes = NSArray(array: superAttributes, copyItems: true) as? [UICollectionViewLayoutAttributes]
        else { return nil }
        
        return attributes.map({ transformLayoutAttributes(attributes: $0) })
    }
    

    private func scrollToInitialPosition() {
        guard let collectionView = self.collectionView else { return }
        let indexPath = IndexPath(item: 0, section: 0)
        let yOffset = collectionView.frame.size.height / 2
        collectionView.scrollToItem(at: indexPath, at: .init(rawValue: UInt(yOffset)), animated: false)
    }
    
    private func transformLayoutAttributes(attributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        guard let collectionView = self.collectionView else { return attributes }
        
        let collectionCenter = collectionView.frame.size.height / 5 * 2
        let contentOffset = collectionView.contentOffset.y
        let center = attributes.center.y - contentOffset
        
        let maxDistance = self.itemSize.height + self.minimumLineSpacing
        let distance = min(abs(collectionCenter - center), maxDistance)
        
        var ratio = (maxDistance - distance) / maxDistance
        if attributes.indexPath.item != -1 {
                ratio = 1.0
            }
        print("collectionView.frame.size.height")
        print(collectionView.frame.size.height)
        
        let alpha = ratio * (1 - self.sideItemAlpha) + self.sideItemAlpha
        let scale = ratio * (1 - self.sideItemScale) + self.sideItemScale
        
        attributes.alpha = alpha
        
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let dist = attributes.frame.midY - visibleRect.midY
        var transform = CATransform3DScale(CATransform3DIdentity, scale, scale, 1)
        transform = CATransform3DTranslate(transform, 0, 0, -abs(dist / 1000))
        attributes.transform3D = transform
        
        return attributes
    }
}
