//
//  MainViewController.swift
//  Eureka Ed
//
//  Created by Rhed Shi on 1/24/15.
//  Copyright (c) 2015 Rhed Shi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var container: EKDContainerView!

    var selectedIndex: Int = 1
    var selectedButton: EKDButton?
    var profileCircleButton: EKDProfileCircleButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileCircleButton?.addTarget(self, action: "switchUserPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: profileCircleButton!)
    }
    
    override func viewDidAppear(animated: Bool) {
        self.selectButton(selectedIndex)
    }
    
    @IBAction func sideButtonPressed(sender: AnyObject) {
        selectedButton?.selected = false
        self.selectButton(sender.tag)
    }
    
    func selectButton(index: Int) {
        selectedIndex = index
        selectedButton = (self.view.viewWithTag(index) as EKDButton)
        selectedButton!.selected = true
        
        switch index {
        case 1:
            self.title = "Videos"
        case 2:
            self.title = "Challenges"
        case 3:
            self.title = "Achievements"
        case 4:
            self.title = "Friends"
        case 5:
            self.title = "Share"
        default:
            break
        }
        
        if index == 1 {
            let viewController: ViewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("ViewController") as ViewController
            viewController.embeddingViewController = self
            container.addViewController(viewController)
        }
        else if index == 5 {
            
        }
        else {
            let viewController: UIViewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("CameraViewController") as UIViewController
            container.addViewController(viewController)
        }
        
        Flurry.logEvent(self.title)
    }
    
    @IBAction func openButtonPressed(sender: AnyObject) {
        self.sideMenuViewController.openMenuAnimated(true, completion: nil)
        // self.showAlert()
        
        Flurry.logEvent("Parent Portal")
    }
    
    func enter(#passcode: String) {
        if passcode == "1234" {
            self.sideMenuViewController.openMenuAnimated(true, completion: nil)
        }
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Enter Passcode", message: "", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) { (_) in }
        let enterAction = UIAlertAction(title: "Enter", style: .Cancel) { (_) in
            let passcodeTextField = alertController.textFields![0] as UITextField
            self.enter(passcode: passcodeTextField.text)
        }
        enterAction.enabled = false
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Passcode"
            textField.secureTextEntry = true
            textField.keyboardType = UIKeyboardType.NumberPad
            
            NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification, object: textField, queue: NSOperationQueue.mainQueue()) { (notification) in
                enterAction.enabled = textField.text != ""
            }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(enterAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func switchUserPressed(sender: AnyObject) {
        let initialViewController: InitialViewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("InitialViewController") as InitialViewController
        self.sideMenuViewController.setMainViewController(initialViewController, animated: false, closeMenu: false)
        
        Flurry.logEvent("Switch User")
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.Default
    }
}
