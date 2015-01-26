//
//  MenuViewController.swift
//  Eureka Ed
//
//  Created by Rhed Shi on 1/25/15.
//  Copyright (c) 2015 Rhed Shi. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    var backgroundImageView: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpBackgroundImage()
    }
    
    func setUpBackgroundImage() {
        self.backgroundImageView = UIImageView(image: UIImage(named: "galaxy"))
        self.backgroundImageView?.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        var imageViewRect: CGRect = UIScreen.mainScreen().bounds
        imageViewRect.size.width += 589
        self.backgroundImageView?.frame = imageViewRect
        self.backgroundImageView?.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(self.backgroundImageView!)
        
        let viewDictionary: NSDictionary = NSDictionary(object: self.backgroundImageView!, forKey: "imageView")
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[imageView]", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: viewDictionary))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[imageView]", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: viewDictionary))
    }
    
    @IBAction func closeButtonPressed(sender: AnyObject) {
        self.sideMenuViewController.closeMenuAnimated(true, completion: nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
