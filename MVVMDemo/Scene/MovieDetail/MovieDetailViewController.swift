//
//  MovieDetailViewController.swift
//  MVVMDemo
//
//  Created by Bibin on 28/11/19.
//  Copyright © 2019 Bibin. All rights reserved.
//

import UIKit

class MovieDetailViewController: BaseViewController {
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [self.containerView,
         self.imageView].forEach {
            $0?.layer.cornerRadius = 10
            $0?.clipsToBounds = true
        }
        self.titleLabel.text = movie?.name
        self.subtitleLabel.text = "\(movie?.releasedYear ?? 0)"
        self.imageView.image = movie?.image
    }
    
}

extension MovieDetailViewController: Storyboarded {
    static var storyboard: Storyboard { .movie }
}
