//
//  EKDInteractionBlock.swift
//  Eureka Ed
//
//  Created by Rhed Shi on 2/15/15.
//  Copyright (c) 2015 Eureka Ed. All rights reserved.
//

import UIKit

class EKDInteractionBlock: UIButton {
    
    var target: UIView? {
        didSet {
            target!.layer.cornerRadius = 6
            target!.layer.shadowColor = self.backgroundColor?.CGColor
            target!.layer.shadowOffset = CGSize(width: 0, height: 0)
            target!.layer.shadowOpacity = 0.75
            target!.layer.shadowRadius = 4
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 4
    }
}
