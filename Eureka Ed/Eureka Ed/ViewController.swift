//
//  ViewController.swift
//  Eureka Ed
//
//  Created by Rhed Shi on 12/21/14.
//  Copyright (c) 2014 Rhed Shi. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let series = Series.BigHero6()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UICollectionViewDatasource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return series.videos!.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: VideoCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as VideoCell
        cell.video = series.videos![indexPath.row] as Video
        cell.imageView.image = cell.video!.image
        cell.imageView.contentMode = UIViewContentMode.ScaleAspectFit
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as VideoCell
        let url = cell.video!.url
        var player: MPMoviePlayerViewController = MPMoviePlayerViewController(contentURL: url)
        self.presentMoviePlayerViewControllerAnimated(player)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 151.0, height: 85.0)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 20.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 50.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    }
}

