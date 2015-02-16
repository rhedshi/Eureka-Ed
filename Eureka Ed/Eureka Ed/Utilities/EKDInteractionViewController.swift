//
//  EKDInteractionViewController.swift
//  Eureka Ed
//
//  Created by Rhed Shi on 2/15/15.
//  Copyright (c) 2015 Eureka Ed. All rights reserved.
//

import UIKit

protocol EKDInteractionViewControllerDelegate {
    
    func didCompleteInteraction()
}

class EKDInteractionViewController: UIViewController {
    
    var delegate: EKDInteractionViewControllerDelegate?
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var targetArea: UIView!
    
    var origin: CGPoint = CGPointZero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        origin = button.center
        let panGestureRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: "panGestureRecognized:")
        button.addGestureRecognizer(panGestureRecognizer)
        
        targetArea.layer.shadowColor = UIColor.EKDBlueColor().CGColor
        targetArea.layer.shadowOpacity = 0.75
        targetArea.layer.shadowOffset = CGSize(width: 0, height: 0)
        targetArea.layer.shadowRadius = 4
    }
    
    func panGestureRecognized(recognizer: UIPanGestureRecognizer) {
        
        self.view.bringSubviewToFront(recognizer.view!)
        
        let translation = recognizer.translationInView(self.view)
        recognizer.view!.center = CGPoint(x:recognizer.view!.center.x + translation.x,
            y:recognizer.view!.center.y + translation.y)
        recognizer.setTranslation(CGPointZero, inView: self.view)
        
        if recognizer.state == UIGestureRecognizerState.Ended {
            
            if targetArea.pointInside(targetArea.convertPoint(recognizer.view!.center, fromView: self.view), withEvent: nil) {
                recognizer.view!.center = targetArea.center
                delegate?.didCompleteInteraction()
            }
            else {
                recognizer.view!.center = origin
            }
        }
    }
}
