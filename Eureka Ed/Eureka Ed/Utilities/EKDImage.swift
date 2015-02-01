//
//  EKDImage.swift
//  Eureka Ed
//
//  Created by Rhed Shi on 1/31/15.
//  Copyright (c) 2015 Rhed Shi. All rights reserved.
//

import Foundation

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
