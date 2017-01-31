//
//  InfiniteScrollCollectionView.swift
//  InfiniteScrollCollectionView
//
//  Created by Twaha Mukammel on 1/24/17.
//  Copyright © 2017 Twaha Mukammel. All rights reserved.
//

import UIKit

@objc public protocol InfiniteScrollCollectionViewDelegatge: NSObjectProtocol {
    func uniformItemSizeIn(collectionView: UICollectionView) -> CGSize
}

open class InfiniteScrollCollectionView: UICollectionView {
    
    public weak var infiniteScrollDelegate: InfiniteScrollCollectionViewDelegatge?
    
    lazy private var extraItems: Int = { [weak wkSelf = self] in
        if (wkSelf?.uniformItemSize.width)! > 0.0 {
            let viewSize = self.bounds.size
            let mexItemVisibleOnScreen = Int(ceil(viewSize.width / (wkSelf?.uniformItemSize.width)!))
            let extraItems = max(1, mexItemVisibleOnScreen - 1)
            
            return extraItems
        }
        else {
            return 0
        }
        }()
    
    lazy private var uniformItemSize: CGSize = {[weak wkSelf = self] in
        if let size = wkSelf?.infiniteScrollDelegate?.uniformItemSizeIn(collectionView: self) {
            return size
        }
        else {
            return .zero
        }
        }()
    
    lazy private var offsetCompensation: CGFloat = { [weak wkSelf = self] in
        if (wkSelf?.uniformItemSize.width)! > 0.0 {
            let viewSize = self.bounds.size
            let fraction = ceil(viewSize.width / (wkSelf?.uniformItemSize.width)!) - (viewSize.width / (wkSelf?.uniformItemSize.width)!)
            return fraction * (wkSelf?.uniformItemSize.width)!
        }
        else {
            return 0
        }
        }()
    
    private var numberOfElementsInDataSource: Int!
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    /// Call this method on ViewControllers 'viewDidAppear' to set initial offset to first data
    public func setInitialOffset() {
        self.contentOffset = CGPoint(x: uniformItemSize.width * CGFloat(extraItems), y: 0)
    }
    
    /// Call this method from 'scrollViewDidScroll' of this collectionView's delegate
    ///
    /// - Parameter scrollView: The scroll-view object in which the scrolling occurred.
    public func infiniteScrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView == self {
            if uniformItemSize.width > 0.0 && numberOfElementsInDataSource > 0 {
                if scrollView.contentOffset.x <= 0 {
                    scrollView.contentOffset = CGPoint(x: CGFloat(numberOfElementsInDataSource) * uniformItemSize.width, y: 0)
                }
                else if (scrollView.contentOffset.x >= scrollView.contentSize.width - scrollView.bounds.size.width) {
                    scrollView.contentOffset = CGPoint(x: (CGFloat(max(1, extraItems - 1)) * uniformItemSize.width) + offsetCompensation,
                                                       y: 0)
                }
            }
        }
    }
    
    
    /// Call this method before responding to 'numberOfItemsInSection', this method adds required number of repeating elements in leading and trailing edges of data array.
    ///
    /// - Parameter array: data source for the collection view
    /// - Returns: returns a new data array
    public func prepareDataSourceForInfiniteScroll(array: [Any]) -> [Any] {
        numberOfElementsInDataSource = array.count
        
        if extraItems > 0 {
            var newArray = Array<Any>()
            newArray.append(contentsOf: array)
            
            newArray.insert(contentsOf: array[0..<extraItems], at: array.count)
            newArray.insert(contentsOf: array[(array.count - extraItems)..<array.count], at: 0)
            
            return newArray
        }
        else {
            return array
        }
    }
}
