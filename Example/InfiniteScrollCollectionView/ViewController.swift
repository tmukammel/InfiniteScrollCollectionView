//
//  ViewController.swift
//  InfiniteScrollCollectionView
//
//  Created by Twaha Mukammel on 1/24/17.
//  Copyright © 2017 Twaha Mukammel. All rights reserved.
//

import UIKit
import InfiniteScrollCollectionView

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource, InfiniteScrollCollectionViewDelegatge {
    
    @IBOutlet weak var collectionView1: InfiniteScrollCollectionView!
    @IBOutlet weak var collectionView2: InfiniteScrollCollectionView!
    @IBOutlet weak var collectionView3: InfiniteScrollCollectionView!
    
    // Model
    var dataArray1: [Int] = [1]
    var dataArray2: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    var dataArray3: [Int] = [1, 2, 3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView2.infiniteScrollDelegate = self
        dataArray2 = collectionView2.prepareDataSourceForInfiniteScroll(array: dataArray2) as! [Int]
        
        collectionView3.infiniteScrollDelegate = self
        dataArray3 = collectionView3.prepareDataSourceForInfiniteScroll(array: dataArray3) as! [Int]
        
        collectionView1.infiniteScrollDelegate = self
        dataArray1 = collectionView1.prepareDataSourceForInfiniteScroll(array: dataArray1) as! [Int]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        collectionView2.setInitialOffset()
        collectionView3.setInitialOffset()
        collectionView1.setInitialOffset()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - InfiniteScrollCollectionViewDelegatge
    
    func uniformItemSizeIn(collectionView: UICollectionView) -> CGSize {
        switch collectionView {
        case self.collectionView2:
            return CGSize(width: 75, height: 40)
        case collectionView3:
            return CGSize(width: 150, height: 160)
        default:
            return CGSize(width: 375, height: 160)
        }
    }
    
    //MARK: - UICollectionViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        switch scrollView {
        case collectionView2:
            collectionView2.infiniteScrollViewDidScroll(scrollView: scrollView)
        case collectionView3:
            collectionView3.infiniteScrollViewDidScroll(scrollView: scrollView)
        default:
            collectionView1.infiniteScrollViewDidScroll(scrollView: scrollView)
        }
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case self.collectionView2:
            return CGSize(width: 75, height: 40)
        case collectionView3:
            return CGSize(width: 150, height: 160)
        default:
            return CGSize(width: 375, height: 160)
        }
    }
    
    //MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case self.collectionView2:
            return dataArray2.count;
        case collectionView3:
            return dataArray3.count;
        default:
            return dataArray1.count;
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case self.collectionView2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "demoCell", for: indexPath) as! DemoCell
            cell.title.text = String(dataArray2[indexPath.row])
            return cell
            
        case collectionView3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "demoCell2", for: indexPath) as! DemoCell
            cell.title.text = String(dataArray3[indexPath.row])
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "demoCell1", for: indexPath) as! DemoCell
            cell.title.text = String(dataArray1[indexPath.row])
            return cell
        }
    }
    
}
