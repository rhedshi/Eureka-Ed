//
//  Gizmo-Pranks-Interaction1-ViewController.swift
//  Eureka Ed
//
//  Created by Rhed Shi on 2/18/15.
//  Copyright (c) 2015 Eureka Ed. All rights reserved.
//

import UIKit

class Gizmo_Pranks_Interaction1_ViewController: EKDInteractionViewController {
    
    @IBOutlet weak var block1: EKDInteractionBlock!
    @IBOutlet weak var block2: EKDInteractionBlock!
    @IBOutlet weak var block3: EKDInteractionBlock!
    
    @IBOutlet var blocks: [EKDInteractionBlock]!
    
    @IBOutlet weak var target1: UIView!
    @IBOutlet weak var target2: UIView!
    @IBOutlet weak var target3: UIView!
    @IBOutlet weak var target4: UIView!
    
    @IBOutlet weak var option1: EKDInteractionBlock!
    @IBOutlet weak var option2: EKDInteractionBlock!
    @IBOutlet weak var option3: EKDInteractionBlock!
    @IBOutlet weak var option4: EKDInteractionBlock!
    
    @IBOutlet var options: [EKDInteractionBlock]!
    
    var finished: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        block1.target = target1
        block2.target = target2
        block3.target = target3
        
        option3.target = target4
        
        for block in blocks + options {
            let moveBlock: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: "blockMoved:")
            block.addGestureRecognizer(moveBlock)
        }
    }
    
    func blockMoved(recognizer: UIPanGestureRecognizer) {
        
        let block: EKDInteractionBlock = recognizer.view! as EKDInteractionBlock
        
        self.view.bringSubviewToFront(block.superview!)
        block.superview!.bringSubviewToFront(block)
        
        let translation = recognizer.translationInView(self.view)
        block.center = CGPoint(x:block.center.x + translation.x, y:block.center.y + translation.y)
        recognizer.setTranslation(CGPointZero, inView: self.view)
        
        if recognizer.state == UIGestureRecognizerState.Ended {
            
            if block.target == nil {
                block.setTranslatesAutoresizingMaskIntoConstraints(false)
                block.layoutIfNeeded()
                return
            }
            
            let target: UIView = block.target!
            let point = target.convertPoint(block.center, fromView: block.superview)
            
            if target.pointInside(point, withEvent: nil) {
                finished++
                target.backgroundColor = block.backgroundColor
                block.center = block.superview!.convertPoint(target.center, fromView: target.superview)
                block.setTranslatesAutoresizingMaskIntoConstraints(true)
                if finished == 4 {
                    delegate?.didCompleteInteraction()
                }
            }
            else {
                block.setTranslatesAutoresizingMaskIntoConstraints(false)
                block.layoutIfNeeded()
            }
        }
    }
}
