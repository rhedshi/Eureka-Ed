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
    
    class func Characters() -> Series {
        let videos = [
            Video(url: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Gizmo-DONE", ofType: "mp4")!)!, image: UIImage(named: "gizmo.png")!, name: "Gizmo"),
            Video(url: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Merlin-DONE", ofType: "mp4")!)!, image: UIImage(named: "merlin.png")!, name: "Merlin"),
            Video(url: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Iggy-DONE", ofType: "mp4")!)!, image: UIImage(named: "iggy.png")!, name: "Iggy"),
            Video(url: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Jane-DONE", ofType: "mp4")!)!, image: UIImage(named: "jane.png")!, name: "Jane"),
            Video(url: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Martin-DONE", ofType: "mp4")!)!, image: UIImage(named: "martin.png")!, name: "Mr. Martin"),
            Video(url: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Principal-DONE", ofType: "mp4")!)!, image: UIImage(named: "principal.png")!, name: "Principal"),
            Video(url: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Clyde-DONE", ofType: "mp4")!)!, image: UIImage(named: "clyde")!, name: "Clyde"),
        ]
        return Series(videos: videos)
    }
    
    class func Episodes() -> Series {
        let videos = [
            Video(url: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Gizmo_Animatic_Storyboard", ofType: "mp4")!)!, image: UIImage(named: "episode.png")!, name: "Gizmo Pranks on Pranks"),
            Video(url: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Preview", ofType: "mp4")!)!, image: UIImage(named: "preview.png")!, name: "Preview"),
        ]
        return Series(videos: videos)
    }
}
