//
//  ViewController.swift
//  ScrollItemView
//
//  Created by 马超 on 16/7/22.
//  Copyright © 2016年 qikeyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor(red: 220/255.0, green: 220/255.0, blue: 220/255.0, alpha: 1.0)
        
        setupCollectionView()
        
    }

  
    // set up collection view
    private func setupCollectionView() {
        
        let screenW = UIScreen.mainScreen().bounds.size.width;
        var rect = view.bounds
        rect.size.height = (screenW - 15 * 2 - 10 * 3) / 2 + 30 + 10
        rect.origin.y = 100
        myCollectionView = UICollectionView(frame: rect, collectionViewLayout: collectionLayout())
        myCollectionView.backgroundColor = UIColor.whiteColor()
        myCollectionView.pagingEnabled = true
        myCollectionView.showsHorizontalScrollIndicator = true
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        view.addSubview(myCollectionView)


      myCollectionView.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
      
    }
    
    // set up layout
    private func collectionLayout() -> UICollectionViewLayout {
        
        let layout = CustomLayout()
        return layout;
    }
    
    
    //MARK:- collection view data source
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 26
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath)
    
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
    }

}

