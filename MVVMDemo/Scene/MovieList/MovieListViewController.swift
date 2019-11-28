//
//  MovieListViewController.swift
//  MVVMDemo
//
//  Created by Bibin on 27/11/19.
//  Copyright © 2019 Bibin. All rights reserved.
//

import UIKit

final class MovieListViewController: BaseViewController, ViewModelInitializable {
    
    var viewModel: MovieListViewModel!
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movies"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.register(MovieTableViewCell.self)
        self.tableView.tableFooterView = .init()
    }
    
    override var rightBarButtons: [UIBarButtonItem] {
        [.init(barButtonSystemItem: .add, target: self, action: #selector(self.handleAddMovieButtonTap))]
    }
    
    func bind(to viewModel: MovieListViewModel) {
        viewModel.onAddNewMovie = self.addedNewMovie
    }
}

private extension MovieListViewController {
    @objc func handleAddMovieButtonTap(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Movie", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in textField.placeholder = "Name" }
        alert.addTextField { textField in textField.placeholder = "Released year" }
        
        alert.addAction(.init(title: "Add", style: .default, handler: { _ in
            let name = alert.textFields?.first?.text ?? ""
            let year = Int(alert.textFields?.last?.text ?? "0") ?? 0
            self.viewModel.add(movie: .init(id: Int.random(in: (10...100)), name: name, releasedYear: year))
        }))
        self.present(alert, animated: true)
    }
    
    func addedNewMovie(at index: Int?) {
        guard index != nil else { return }
        self.tableView.insertRows(at: [.init(row: index!, section: 0)], with: .automatic)
    }
}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.dataSource?.movies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.movie = self.viewModel.dataSource?.movies[indexPath.row]
        return cell
    }
}

extension MovieListViewController: Storyboarded {
    static var storyboard: Storyboard { .movie }
}
