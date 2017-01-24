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

    @IBOutlet weak var collectionView: InfiniteScrollCollectionView!
    
    var dataArray: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.infiniteScrollDelegate = self
        dataArray = collectionView.prepareDataSourceForInfiniteScroll(array: dataArray) as! [Int]
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        collectionView.setInitialOffset()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - InfiniteScrollCollectionViewDelegatge

    func uniformItemSizeIn(collectionView: UICollectionView) -> CGSize {
        return CGSize(width: 75, height: 40)
    }
    
    //MARK: - UICollectionViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView.infiniteScrollViewDidScroll(scrollView: scrollView)
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 40)
    }
    
    //MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "demoCell", for: indexPath) as! DemoCell
        cell.title.text = String(dataArray[indexPath.row])
        return cell
    }

}

