//
//  InitialViewController.swift
//  Eureka Ed
//
//  Created by Rhed Shi on 1/31/15.
//  Copyright (c) 2015 Rhed Shi. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func profilePressed(sender: AnyObject) {
        let profile: EKDProfileCircleButton = sender as EKDProfileCircleButton
        let mainViewController: MainViewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("MainViewController") as MainViewController
        mainViewController.profileCircleButton = EKDProfileCircleButton(name: "", image: profile.image!, style: .BarButtonItem)
        let navigationController: UINavigationController = UINavigationController(rootViewController: mainViewController)
        navigationController.navigationBar.translucent = false
        self.sideMenuViewController.setMainViewController(navigationController, animated: true, closeMenu: false)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
