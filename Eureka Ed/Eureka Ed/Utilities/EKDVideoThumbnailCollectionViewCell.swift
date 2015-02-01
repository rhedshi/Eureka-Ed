//
//  EKDVideoThumbnailCollectionViewCell.swift
//  Eureka Ed
//
//  Created by Rhed Shi on 1/31/15.
//  Copyright (c) 2015 Rhed Shi. All rights reserved.
//

import UIKit

class EKDVideoThumbnailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var video: Video?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.layer.borderWidth = 1
        
        self.layer.shadowColor = UIColor.darkGrayColor().CGColor
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSizeMake(0, 2)
        
        self.clipsToBounds = false
    }
}
