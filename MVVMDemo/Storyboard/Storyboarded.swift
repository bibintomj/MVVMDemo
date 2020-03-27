//
//  Storyboarded.swift
//  MVPDemo2
//
//  Created by Bibin on 19/02/19.
//  Copyright © 2019 Bibin. All rights reserved.
//

import UIKit

/// Encapsulates all Storyboards in the code.
/// case name must match the name of Storyborad file excepty the first letter. Keep the first letter lowercased to maintain camelcase naming standards.
enum Storyboard {
    case movie
    /// Creates storyboard from case.
    var instance: UIStoryboard { .init(name: String(describing: self).capitalized, bundle: .main) }
}

/// Storyboarded protocol to manage viewcontroller creation.
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
