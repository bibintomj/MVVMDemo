//
//  BaseViewController.swift
//  MVVMDemo
//
//  Created by Bibin on 27/11/19.
//  Copyright © 2019 Bibin. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
     override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            // Setting the navigation bar button items
            let navigationItem = (tabBarController?.navigationItem ?? self.navigationItem)
            navigationItem.setLeftBarButtonItems(leftBarButtons, animated: true)
            navigationItem.setRightBarButtonItems(rightBarButtons, animated: true)
    }
}

// MARK: BarButtonItemSettable Protocol Conformance
@objc extension BaseViewController: BarButtonItemSettable {
    var leftBarButtons: [UIBarButtonItem] { return [] }
    var rightBarButtons: [UIBarButtonItem] { return [] }
}

// MARK: Protocols
/// Protocol variables to retrieve the BarButtonItems in navigation bar.
@objc protocol BarButtonItemSettable {
    /// Collection of leftBarButtons in navigation bar.
    @objc optional var leftBarButtons: [UIBarButtonItem] { get }
    
    /// Collection of leftBarButtons in navigation bar.
    @objc optional var rightBarButtons: [UIBarButtonItem] { get }
}
