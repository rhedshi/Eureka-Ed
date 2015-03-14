//
//  Gizmo-Pranks-Episode-Viewcontroller.swift
//  Eureka Ed
//
//  Created by Rhed Shi on 2/26/15.
//  Copyright (c) 2015 Eureka Ed. All rights reserved.
//

import UIKit
import MediaPlayer

class Gizmo_Pranks_Episode_Viewcontroller: EKDVideoInteractionPlayerViewController, EKDInteractionViewControllerDelegate {
    
    var player: MPMoviePlayerViewController?
    
    var videos: [Video] = [
        Video(url: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Gizmo_Animation_1", ofType: "mp4")!)!, image: UIImage(named: "camera_logo.png")!, name: "Gizmo Animation 1"),
        Video(url: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Gizmo_Animation_2", ofType: "mp4")!)!, image: UIImage(named: "camera_logo.png")!, name: "Gizmo Animation 2"),
        Video(url: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Gizmo_Animation_3", ofType: "mp4")!)!, image: UIImage(named: "camera_logo.png")!, name: "Gizmo Animation 3")
    ]
    
    var interactions: [EKDInteractionViewController] = [
        UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("Gizmo_Pranks_Interaction_1") as EKDInteractionViewController,
        UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("Gizmo_Pranks_Interaction_2") as EKDInteractionViewController
    ]
    
    var cameraViewController: UIViewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("CameraViewController") as UIViewController
    
    @IBOutlet weak var container: EKDContainerView!
    @IBOutlet weak var bottomBar: UIToolbar!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.hidden = true
        continueButton.layer.cornerRadius = 6
        container.addViewController(cameraViewController)
    }
    
    @IBAction func nextButtonPressed(sender: AnyObject) {
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
    
    @IBAction func closeButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
        Flurry.logEvent("Exit: \(videos.count) Videos Left, \(interactions.count) Interactions Left")
    }
    
    @IBAction func continueButtonPressed(sender: AnyObject) {
        self.presentMoviePlayerViewControllerAnimated(player)
        player!.moviePlayer.play()
        continueButton.hidden = true
        
        Flurry.logEvent("Continue: \(videos.count) Videos Left, \(interactions.count) Interactions Left")
    }
    
    func didFinishPlayback(notification: NSNotification) {
        let userInfo: [String: NSNumber] = notification.userInfo as [String: NSNumber]
        let number: NSNumber = userInfo[MPMoviePlayerPlaybackDidFinishReasonUserInfoKey]! as NSNumber
        let reason: MPMovieFinishReason = MPMovieFinishReason(rawValue: number.integerValue)! as MPMovieFinishReason
        
        switch reason {
        case .PlaybackEnded:
            Flurry.logEvent("Playback Ended")
            if !interactions.isEmpty {
                switch interactions.count {
                case 1:
                    Flurry.logEvent("Completed 2nd Video")
                case 2:
                    Flurry.logEvent("Completed 1st Video")
                default:
                    break
                }
                container.addViewController(interactions.first!)
                interactions.first!.delegate = self
                interactions.removeAtIndex(0)
            }
            if videos.isEmpty {
                Flurry.logEvent("Completed 3rd Video")
                container.addViewController(cameraViewController)
            }
        case .UserExited:
            Flurry.logEvent("User Exited")
            container.addViewController(cameraViewController)
            continueButton.hidden = false
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
