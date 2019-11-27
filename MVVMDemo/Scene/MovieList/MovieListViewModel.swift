//
//  MovieListViewModel.swift
//  MVVMDemo
//
//  Created by Bibin on 27/11/19.
//  Copyright © 2019 Bibin. All rights reserved.
//

import Foundation

struct MovieListViewModel: BaseViewModel {
    var service: MovieListViewModelService?
    
    init(with service: MovieListViewModelService? = nil) { self.service = service }
}

struct MovieListViewModelService {
    var id: Int
}
