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
    var embeddingViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.orangeColor()
        self.collectionView.setTranslatesAutoresizingMaskIntoConstraints(false)
    }
    
    @IBAction func addPressed(sender: AnyObject) {
        var frame:CGRect = self.view.frame
        self.view.frame = CGRectMake(frame.origin.x + 150, frame.origin.y, frame.width, frame.height)
    }
    
    // MARK: - UICollectionViewDatasource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return series.videos!.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: EKDVideoThumbnailCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("EKDVideoThumbnailCollectionViewCell", forIndexPath: indexPath) as EKDVideoThumbnailCollectionViewCell
        cell.video = series.videos![indexPath.row] as Video
        cell.imageView.image = cell.video!.image
        cell.imageView.contentMode = UIViewContentMode.ScaleAspectFit
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        var reusableView: UICollectionReusableView?
        
        if kind == UICollectionElementKindSectionHeader {
            var headerView: EKDVideoThumbnailCollectionHeaderView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "EKDVideoThumbnailCollectionHeaderView", forIndexPath: indexPath) as EKDVideoThumbnailCollectionHeaderView
            headerView.title.text = "Watch the latest videos."
            reusableView = headerView
        }
        
        return reusableView!
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as EKDVideoThumbnailCollectionViewCell
        let url = cell.video!.url
        var player: MPMoviePlayerViewController = MPMoviePlayerViewController(contentURL: url)
        self.embeddingViewController?.presentMoviePlayerViewControllerAnimated(player)
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
        return UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
    }
}

