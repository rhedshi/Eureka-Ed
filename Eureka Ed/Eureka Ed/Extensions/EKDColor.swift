//
//  EKDColor.swift
//  Eureka Ed
//
//  Created by Rhed Shi on 1/31/15.
//  Copyright (c) 2015 Rhed Shi. All rights reserved.
//

import Foundation

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
    
    class func randomColor() -> UIColor {
        srand48(Int(NSDate().timeIntervalSince1970))
        return UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
    }
    
    class func EKDBlueColor() -> UIColor {
        
        return UIColor.hexadecimal("#2390B5")
    }
    
    class func EKDYellowColor() -> UIColor {
        
        return UIColor.hexadecimal("#FEC332")
    }
}
