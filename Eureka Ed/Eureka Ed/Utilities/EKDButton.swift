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

extension UIImage {
    
    class func imageWithColor(color: UIColor) -> UIImage {
        let pixel: CGRect = CGRectMake(0, 0, 1, 1)
        UIGraphicsBeginImageContextWithOptions(pixel.size, false, 0)
        color.setFill()
        UIRectFill(pixel)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }
}

extension UIColor {
    
    class func hexadecimal(string: NSString) -> UIColor {
        var clean: NSString = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).stringByReplacingOccurrencesOfString("#", withString: "", options: nil, range: nil).uppercaseString
        
        if (clean.length < 6) {
            return UIColor.clearColor()
        }
        if (clean.hasPrefix("0X")) {
            clean = clean.substringFromIndex(2)
        }
        if (clean.length != 6) {
            return UIColor.clearColor()
        }
        
        var rgb: UInt32 = 0;
        if (!NSScanner(string: clean).scanHexInt(&rgb)) {
            return UIColor.clearColor()
        }
        else {
            return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((rgb & 0xFF00) >> 8))/255.0, blue: ((CGFloat)(rgb & 0xFF))/255.0, alpha: 1.0)
        }
    }
    
    class func EKDBlueColor() -> UIColor {
        
        return UIColor.hexadecimal("#2390B5")
    }
    
    class func EKDYellowColor() -> UIColor {
        
        return UIColor.hexadecimal("#FEC332")
    }
}
