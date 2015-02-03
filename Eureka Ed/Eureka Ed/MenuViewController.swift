//
//  MenuViewController.swift
//  Eureka Ed
//
//  Created by Rhed Shi on 1/25/15.
//  Copyright (c) 2015 Rhed Shi. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var backgroundImageView: UIImageView?
    let datasource = ["Home", "Profile", "Kids", "Store", "Account", "Settings", "Logout"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpBackgroundImage()
        self.setUpTableView()
    }
    
    func setUpBackgroundImage() {
        self.backgroundImageView = UIImageView(image: UIImage(named: "Galaxy"))
        self.backgroundImageView?.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        var imageViewRect: CGRect = UIScreen.mainScreen().bounds
        imageViewRect.size.width += 589
        self.backgroundImageView?.frame = imageViewRect
        self.backgroundImageView?.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(self.backgroundImageView!)
        
        let clearView: UIView = UIView(frame: UIScreen.mainScreen().bounds)
        clearView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.35)
        self.view.addSubview(clearView)
        
        let viewDictionary = ["imageView" : self.backgroundImageView!, "clearView" : clearView]
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[imageView]", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: viewDictionary))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[imageView]", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: viewDictionary))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[clearView]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: viewDictionary))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[clearView]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: viewDictionary))
    }
    
    func setUpTableView() {
        tableView.contentInset = UIEdgeInsets(top: 0, left: 150, bottom: 0, right: 0)
        tableView.setTranslatesAutoresizingMaskIntoConstraints(false)
        let viewDictionary = ["tableView" : tableView]
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[tableView]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: viewDictionary))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[tableView]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: viewDictionary))
        self.view.bringSubviewToFront(tableView)
    }
    
    @IBAction func closeButtonPressed(sender: AnyObject) {
        self.sideMenuViewController.closeMenuAnimated(true, completion: nil)
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("UITableViewCell") as? UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "UITableViewCell")
        }
        cell?.textLabel?.text = datasource[indexPath.row]
        cell?.textLabel?.textColor = indexPath.row == 0 ? UIColor.EKDBlueColor() : UIColor.whiteColor()
        cell?.backgroundColor = UIColor.clearColor()
        return cell!
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
