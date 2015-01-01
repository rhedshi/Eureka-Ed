//
//  Video.swift
//  Eureka Ed
//
//  Created by Rhed Shi on 12/22/14.
//  Copyright (c) 2014 Rhed Shi. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    let url: NSURL
    let image: UIImage
    let name: String?
    
    init(url: NSURL, image: UIImage, name: String?) {
        self.url = url
        self.image = image
        if name != nil {
            self.name = name
        }
        super.init()
    }
   
}
