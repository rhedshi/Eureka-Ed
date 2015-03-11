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
    
    let series = [Series.Episodes(), Series.Characters()]
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
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (series[section] as Series).videos!.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: EKDVideoThumbnailCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("EKDVideoThumbnailCollectionViewCell", forIndexPath: indexPath) as EKDVideoThumbnailCollectionViewCell
        cell.video = (series[indexPath.section] as Series).videos![indexPath.row] as Video
        cell.imageView.image = cell.video!.image
        cell.imageView.contentMode = UIViewContentMode.ScaleAspectFit
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        var reusableView = UICollectionReusableView()
        
        if kind == UICollectionElementKindSectionHeader {
            var headerView: EKDCollectionHeaderView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "EKDCollectionHeaderView", forIndexPath: indexPath) as EKDCollectionHeaderView
            headerView.title.text = indexPath.section == 0 ? "Episodes" : "Characters"
            
            reusableView = headerView
        }
        
        return reusableView
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath == NSIndexPath(forRow: 0, inSection: 0) {
            let videoInteractionPlayerViewController: Gizmo_Pranks_Episode_Viewcontroller = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("EKDVideoInteractionPlayerViewController") as Gizmo_Pranks_Episode_Viewcontroller
            let navigationController: UINavigationController = UINavigationController(rootViewController: videoInteractionPlayerViewController)
            self.embeddingViewController?.presentViewController(navigationController, animated: true, completion: { () -> Void in
                videoInteractionPlayerViewController.nextButtonPressed("")
            })
        }
        else {
            let cell = collectionView.cellForItemAtIndexPath(indexPath) as EKDVideoThumbnailCollectionViewCell
            let moviePlayer: MPMoviePlayerViewController = MPMoviePlayerViewController(contentURL: cell.video!.url)
            self.embeddingViewController?.presentMoviePlayerViewControllerAnimated(moviePlayer)
        }
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 180, height: 130)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 50
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 30)
    }
}

