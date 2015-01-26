//
//  MasterViewController.swift
//  Eureka Ed
//
//  Created by Rhed Shi on 1/24/15.
//  Copyright (c) 2015 Rhed Shi. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    
    @IBOutlet weak var container: EKDContainerView!
    
    var selectedIndex: Int = 1
    var selectedButton: EKDButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        selectedButton = (self.view.viewWithTag(selectedIndex) as EKDButton)
        self.selectButton(selectedIndex)
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        selectedButton?.selected = false
        selectedButton = (sender as EKDButton)
        self.selectButton(sender.tag)
    }
    
    func selectButton(index: Int) {
        selectedIndex = index
        selectedButton?.selected = true
        
        var viewController: UIViewController?
        
        switch index {
        case 1:
            self.title = "Videos"
            var intermediate: ViewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("ViewController") as ViewController
            intermediate.embeddingViewController = self
            viewController = intermediate
        
        case 2:
            self.title = "Challenges"
            // viewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("PuzzleViewController") as UIViewController
            
        case 3:
            self.title = "Achievements"
            // viewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("StarViewController") as UIViewController
            
        case 4:
            self.title = "Friends"
            // viewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("FriendsViewController") as UIViewController
            
        default:
            viewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("CameraViewController") as? UIViewController
        }
        
        if (viewController == nil) {
            viewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("CameraViewController") as? UIViewController
        }
        container.addViewController(viewController!)
    }
}
