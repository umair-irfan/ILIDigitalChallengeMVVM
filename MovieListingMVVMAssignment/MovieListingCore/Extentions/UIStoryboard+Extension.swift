//
//  UIStoryboard+Extension.swift
//  MovieListingMVVMAssignment
//
//  Created by Umair Irfan on 22/06/2021.
//

import Foundation
import UIKit

public extension UIStoryboard {
    enum Storyboard: String {
        case movie = "Movie"
        var filename: String {
            return rawValue
        }
    }

    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.filename, bundle: bundle)
    }
}
