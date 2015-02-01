//
//  EKDProfile.swift
//  Eureka Ed
//
//  Created by Rhed Shi on 1/31/15.
//  Copyright (c) 2015 Rhed Shi. All rights reserved.
//

import UIKit

let size: CGFloat = 150

class EKDProfile: UIButton {
    
    var name: String?
    var image: UIImage?
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
        super.init(frame: CGRect(origin: CGPointZero, size: CGSize(width: size, height: size)))
        self.initialize()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    private func initialize() {
        if image != nil {
            self.setImage(image, forState: UIControlState.Normal)
        }
        self.clipsToBounds = true
        
        self.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addSizeConstraints()
        
        self.layer.borderColor = UIColor.EKDYellowColor().CGColor
        self.layer.borderWidth = 8
        self.layer.cornerRadius = size / 2
    }
    
    private func addSizeConstraints() {
        let views = ["self" : self]
        var widthConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:[self(\(size))]", options: NSLayoutFormatOptions(0), metrics: nil, views: views)
        var heightConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:[self(\(size))]", options: NSLayoutFormatOptions(0), metrics: nil, views: views)
        self.addConstraints(widthConstraint)
        self.addConstraints(heightConstraint)
    }
}
