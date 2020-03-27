//
//  MovieListViewModel.swift
//  MVVMDemo
//
//  Created by Bibin on 27/11/19.
//  Copyright © 2019 Bibin. All rights reserved.
//

import Foundation

class MovieListViewModel: BaseViewModel {
    
    var dataSource: MovieListViewModelDataSource?
    var onAddNewMovie: ((Int?) -> Void)?
    
    required init(with service: MovieListViewModelDataSource? = nil) { self.dataSource = service }

}

extension MovieListViewModel {
    func add(movie: Movie) {
        dataSource?.insert(movie)
        guard let totalMoviesCount = dataSource?.movies.count else { return }
        self.onAddNewMovie?(totalMoviesCount - 1)
    }
}

struct MovieListViewModelDataSource {
    fileprivate var movies: [Movie]
    
    init(movies: [Movie]) { self.movies = movies }
}

extension MovieListViewModelDataSource {
    var numberOfMovies: Int { movies.count }
    
    func movie(at index: Int) -> Movie { movies[index] }
    
    mutating func insert(_ movie: Movie, at index: Int? = nil) {
        guard index != nil else {
            self.movies.append(movie)
            return
        }
        self.movies.insert(movie, at: index!)
    }
}
