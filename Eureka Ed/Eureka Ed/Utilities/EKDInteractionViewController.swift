//
//  EKDInteractionViewController.swift
//  Eureka Ed
//
//  Created by Rhed Shi on 2/15/15.
//  Copyright (c) 2015 Eureka Ed. All rights reserved.
//

import UIKit

protocol EKDInteractionViewControllerDelegate {
    
    func didCompleteInteraction()
}

class EKDInteractionViewController: UIViewController {
    
    var delegate: EKDInteractionViewControllerDelegate?
}
