//
//  NavigationFactory.swift
//  MovieListingMVVMAssignment
//
//  Created by Umair Irfan on 22/06/2021.
//

import Foundation
import UIKit

public class UINavigationControllerFactory {
    
    public class func createTransparentNavigationBarNavigationController(rootViewController: UIViewController, barStyle: UIBarStyle? = .default ) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.navigationBar.tintColor = .lightGray
        nav.navigationBar.setBackgroundImage(UIImage(), for: .default)
        nav.navigationBar.shadowImage = UIImage()
        nav.navigationBar.isTranslucent = true
        nav.navigationBar.isHidden = false
        nav.modalPresentationStyle = .fullScreen
        nav.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.black]
        nav.interactivePopGestureRecognizer?.isEnabled = false
        nav.navigationBar.barStyle = barStyle ?? .default
        return nav
    }
}
