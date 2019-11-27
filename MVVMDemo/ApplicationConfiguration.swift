//
//  ApplicationConfiguration.swift
//  MVVMDemo
//
//  Created by Bibin on 27/11/19.
//  Copyright © 2019 Bibin. All rights reserved.
//

import UIKit

class ApplicationConfiguration {
    
    /// Use this function will setup the initial Viewcontroller.
    static func configureInitialViewController(on window: inout UIWindow?) {
        window = UIWindow(frame: UIScreen.main.bounds)
        let movieListScene = MovieListViewController.init(with: .init(id: 10))
        window?.rootViewController = UINavigationController(rootViewController: movieListScene)
        window?.makeKeyAndVisible()
    }
}
