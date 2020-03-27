//
//  Movie.swift
//  MVVMDemo
//
//  Created by Bibin on 27/11/19.
//  Copyright © 2019 Bibin. All rights reserved.
//

import UIKit

struct Movie {
    var id: Int
    var name: String
    var releasedYear: Int
    var image: UIImage = { [#imageLiteral(resourceName: "1"), #imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "3"), #imageLiteral(resourceName: "4"), #imageLiteral(resourceName: "5"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "7")].randomElement()! }()
}

let testMovies: [Movie] = [ .init(id: 1, name: "Batman", releasedYear: 2008),
                          .init(id: 2, name: "The Dark Knight", releasedYear: 2009),
                          .init(id: 3, name: "Man of Steel", releasedYear: 2010),
                          .init(id: 4, name: "AquaMan", releasedYear: 2018),
                          .init(id: 5, name: "Captain America", releasedYear: 2009),
                          .init(id: 6, name: "Justice League", releasedYear: 2018),
                          .init(id: 7, name: "Avengers", releasedYear: 2012)]
