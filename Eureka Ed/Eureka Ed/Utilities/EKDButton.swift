//
//  EKDButton.swift
//  Eureka Ed
//
//  Created by Rhed Shi on 1/24/15.
//  Copyright (c) 2015 Rhed Shi. All rights reserved.
//

import UIKit

class EKDButton: UIButton {
    
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal | UIControlState.Selected)
        self.setBackgroundImage(UIImage.imageWithColor(UIColor.EKDBlueColor()), forState: UIControlState.Selected)
        self.setBackgroundImage(UIImage.imageWithColor(UIColor.EKDYellowColor()), forState: UIControlState.Normal)
        self.adjustsImageWhenHighlighted = false
        
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSizeMake(0, 2)
        self.layer.shadowColor = UIColor.blackColor().CGColor
        
        self.clipsToBounds = true
    }
    
    override var selected: Bool {
        didSet {
            self.clipsToBounds = !selected
        }
    }

}
