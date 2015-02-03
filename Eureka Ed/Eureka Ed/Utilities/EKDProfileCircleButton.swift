//
//  EKDProfileCircleButton.swift
//  Eureka Ed
//
//  Created by Rhed Shi on 2/1/15.
//  Copyright (c) 2015 Rhed Shi. All rights reserved.
//

import UIKit

class EKDProfileCircleButton: UIButton {
    
    var name: String?
    var image: UIImage?
    var size: CGFloat = 0
    var style: EKDProfileCircleButtonStyle
    
    enum EKDProfileCircleButtonStyle {
        case Default
        case BarButtonItem
    }
    
    init(name: String, image: UIImage, style: EKDProfileCircleButtonStyle) {
        self.name = name
        self.image = image
        self.style = style
        
        switch style {
        case .Default:
            self.size = 150
        case .BarButtonItem:
            self.size = 30
        default:
            break
        }
        
        super.init(frame: CGRect(origin: CGPointZero, size: CGSize(width: self.size, height: self.size)))
        self.setImage(image, forState: UIControlState.Normal)
        self.initialize()
    }

    required init(coder aDecoder: NSCoder) {
        self.style = .Default
        super.init(coder: aDecoder)
        self.size = self.frame.size.width < self.frame.size.height ? self.frame.size.width : self.frame.size.height
        self.image = self.imageForState(UIControlState.Normal)
        self.initialize()
        self.addSizeConstraints()
    }
    
    private func initialize() {
        self.clipsToBounds = true
        
        switch style {
        case .Default:
            self.layer.borderColor = UIColor.EKDYellowColor().CGColor
        case .BarButtonItem:
            self.layer.borderColor = UIColor.EKDBlueColor().CGColor
        }
        
        self.layer.borderWidth = size / 18.75
        self.layer.cornerRadius = size / 2
    }
    
    private func addSizeConstraints() {
        self.setTranslatesAutoresizingMaskIntoConstraints(false)
        let viewDictionary = ["self" : self]
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[self(\(size))]", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: viewDictionary))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[self(\(size))]", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: viewDictionary))
    }

}
