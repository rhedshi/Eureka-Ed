//
//  EKDVideoInteractionPlayerViewController.swift
//  Eureka Ed
//
//  Created by Rhed Shi on 2/11/15.
//  Copyright (c) 2015 Eureka Ed. All rights reserved.
//

import UIKit
import MediaPlayer

class EKDVideoInteractionPlayerViewController: UIViewController, EKDInteractionViewControllerDelegate {
    
    var player: MPMoviePlayerViewController?
    
    var videos: [Video] = [
        Video(url: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Baymax and Hiro", ofType: "mp4")!)!, image: UIImage(named: "Baymax and Hiro.jpg")!, name: "Baymax and Hiro"),
        Video(url: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Honey Lemon", ofType: "mp4")!)!, image: UIImage(named: "Honey Lemon.jpg")!, name: "Honey Lemon"),
        Video(url: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Wasabi", ofType: "mp4")!)!, image: UIImage(named: "Wasabi.jpg")!, name: "Wasabi")
    ]
    
    @IBOutlet weak var container: EKDContainerView!
    @IBOutlet weak var bottomBar: UIToolbar!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let interactionViewController: EKDInteractionViewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("Gizmo-Pranks-Interaction-1") as EKDInteractionViewController
        interactionViewController.delegate = self
        container.addViewController(interactionViewController)
    }
    
    @IBAction func nextButtonPressed(sender: AnyObject) {
        self.play()
    }
    
    @IBAction func closeButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
    }
    
    func play() {
        let video: Video? = self.videos.first as Video?
        player = MPMoviePlayerViewController(contentURL: video?.url)
        if !videos.isEmpty {
            NSNotificationCenter.defaultCenter().removeObserver(player!, name: MPMoviePlayerPlaybackDidFinishNotification, object: nil)
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "didFinishPlayback:", name: MPMoviePlayerPlaybackDidFinishNotification, object: nil)
            self.presentMoviePlayerViewControllerAnimated(player)
            videos.removeAtIndex(0)
        }
        bottomConstraint.constant = -44
    }
    
    func didFinishPlayback(notification: NSNotification) {
        let userInfo: [String: NSNumber] = notification.userInfo as [String: NSNumber]
        let number: NSNumber = userInfo[MPMoviePlayerPlaybackDidFinishReasonUserInfoKey]! as NSNumber
        let reason: MPMovieFinishReason = MPMovieFinishReason(rawValue: number.integerValue)! as MPMovieFinishReason
        
        switch reason {
        case .PlaybackEnded:
            self.view.backgroundColor = UIColor.whiteColor()
        case .UserExited:
            self.view.backgroundColor = UIColor.redColor()
        default:
            break
        }
        
        self.dismissMoviePlayerViewControllerAnimated()
    }
    
    // MARK: - EKDInteractionViewControllerDelegate
    
    func didCompleteInteraction() {
        bottomConstraint.constant = 0
        bottomBar.layoutIfNeeded()
    }
}
