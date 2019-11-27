//
//  Storyboarded.swift
//  MVPDemo2
//
//  Created by Bibin on 19/02/19.
//  Copyright © 2019 Bibin. All rights reserved.
//

import UIKit

enum Storyboard {
    case movie
    var instance: UIStoryboard { .init(name: String(describing: self).capitalized, bundle: .main) }
}

protocol Storyboarded {
    static var storyboard: Storyboard { get }
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        // swiftlint:disable:next force_cast
        storyboard.instance.instantiateViewController(withIdentifier: String(describing: self)) as! Self
    }
}
