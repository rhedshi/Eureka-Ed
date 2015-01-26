//
//  EKDContainerView.swift
//  Eureka Ed
//
//  Created by Rhed Shi on 1/24/15.
//  Copyright (c) 2015 Rhed Shi. All rights reserved.
//

import UIKit

class EKDContainerView: UIView {
    
    var embeddedViewController: UIViewController?
    
    func addViewController(viewController: UIViewController) {
        let view = viewController.view
        
        self.embeddedViewController?.view.removeFromSuperview()
        self.embeddedViewController = viewController
        
        self.addView(view)
    }
    
    private func addView(view: UIView) {
        self.addSubview(view)
        self.addLayoutConstraintsForView(view)
    }
    
    private func addLayoutConstraintsForView(view: UIView) {
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let topLayoutConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0)
        let bottomLayoutConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0)
        let leftLayoutConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0)
        let rightLayoutConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0)
        
        self.addConstraint(topLayoutConstraint)
        self.addConstraint(bottomLayoutConstraint)
        self.addConstraint(leftLayoutConstraint)
        self.addConstraint(rightLayoutConstraint)
    }

}
