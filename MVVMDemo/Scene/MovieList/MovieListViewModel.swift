//
//  MovieListViewModel.swift
//  MVVMDemo
//
//  Created by Bibin on 27/11/19.
//  Copyright © 2019 Bibin. All rights reserved.
//

import Foundation

class MovieListViewModel: BaseViewModel {
    var dataSource: MovieListViewModelService?
    var onAddNewMovie: ((Int?) -> Void)?
    
    required init(with service: MovieListViewModelService? = nil) { self.dataSource = service }

}

extension MovieListViewModel {
    func add(movie: Movie) {
        dataSource?.add(movie)
        guard let totalMoviesCount = dataSource?.movies.count else { return }
        self.onAddNewMovie?(totalMoviesCount - 1)
    }
}

struct MovieListViewModelService {
    var movies: [Movie]
    
    mutating func add(_ movie: Movie) { self.movies.append(movie) }
}
