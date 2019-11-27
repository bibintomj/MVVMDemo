//
//  MovieListViewController.swift
//  MVVMDemo
//
//  Created by Bibin on 27/11/19.
//  Copyright © 2019 Bibin. All rights reserved.
//

import UIKit

class MovieListViewController: BaseViewController, ViewModelInitializable {
    var viewModel: MovieListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension MovieListViewController: Storyboarded {
    static var storyboard: Storyboard { .movie }
}
