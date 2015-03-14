//
//  EKDVideoThumbnailCollectionViewCell.swift
//  Eureka Ed
//
//  Created by Rhed Shi on 1/31/15.
//  Copyright (c) 2015 Rhed Shi. All rights reserved.
//

import UIKit

class EKDVideoThumbnailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.backgroundColor = UIColor.groupTableViewBackgroundColor()
            imageView.layer.borderColor = UIColor.lightGrayColor().CGColor
            imageView.layer.borderWidth = 1
            imageView.clipsToBounds = false
        }
    }
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var overlayButton: UIButton!
    
    var video: Video? {
        didSet {
            title.text = video!.name
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
