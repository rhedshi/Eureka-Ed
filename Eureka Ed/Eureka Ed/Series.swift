//
//  Series.swift
//  Eureka Ed
//
//  Created by Rhed Shi on 12/22/14.
//  Copyright (c) 2014 Rhed Shi. All rights reserved.
//

import UIKit

class Series: NSObject {
    
    let videos: [Video]?
    
    init(videos: [Video]) {
        self.videos = videos
        super.init()
    }
    
    class func BigHero6() -> Series {
        let videos = [
            Video(url: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Baymax and Hiro", ofType: "mp4")!)!, image: UIImage(named: "Baymax and Hiro.jpg")!, name: "Baymax and Hiro"),
            Video(url: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Fred", ofType: "mp4")!)!, image: UIImage(named: "Fred.jpg")!, name: "Fred"),
            Video(url: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Go Go", ofType: "mp4")!)!, image: UIImage(named: "Go Go.jpg")!, name: "Go Go"),
            Video(url: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Honey Lemon", ofType: "mp4")!)!, image: UIImage(named: "Honey Lemon.jpg")!, name: "Honey Lemon"),
            Video(url: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Wasabi", ofType: "mp4")!)!, image: UIImage(named: "Wasabi.jpg")!, name: "Wasabi"),
            Video(url: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Gizmo_Animatic_3", ofType: "mp4")!)!, image: UIImage(named: "camera_logo.png")!, name: "Gizmo Animatic 3"),
        ]
        return Series(videos: videos)
    }
    
}
