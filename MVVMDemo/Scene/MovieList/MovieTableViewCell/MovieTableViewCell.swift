//
//  MovieTableViewCell.swift
//  MVVMDemo
//
//  Created by Bibin on 27/11/19.
//  Copyright © 2019 Bibin. All rights reserved.
//

import UIKit

final class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    var movie: Movie? {
        didSet { self.configureUI() }
    }
    
}

private extension MovieTableViewCell {
    func configureUI() {
        self.thumbnailImageView.image = movie?.image
        self.thumbnailImageView.layer.cornerRadius = self.thumbnailImageView.frame.height / 2
        self.thumbnailImageView.clipsToBounds = true
        self.titleLabel.text = movie?.name
        self.subtitleLabel.text = String(describing: movie?.releasedYear ?? 0)
    }
}

extension MovieTableViewCell: NibLoadable, ReuseIdentifying {}
