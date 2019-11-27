//
//  baseViewModel.swift
//  MVVMDemo
//
//  Created by Bibin on 27/11/19.
//  Copyright © 2019 Bibin. All rights reserved.
//

import UIKit

protocol BaseViewModel {
    associatedtype Service
    var service: Service? { get set }
    init(with service: Service?)
}

protocol ViewModelInitializable {
    associatedtype ViewModel: BaseViewModel
    var viewModel: ViewModel! { get set }
    init(with service: ViewModel.Service)
}

extension ViewModelInitializable where Self: Storyboarded {
    init(with service: ViewModel.Service) {
        self = .instantiate()
        self.viewModel = .init(with: service)
    }
}

extension ViewModelInitializable where Self: NibLoadable {
    init(with service: ViewModel.Service) {
        self = .instantiate()
        self.viewModel = .init(with: service)
    }
}
