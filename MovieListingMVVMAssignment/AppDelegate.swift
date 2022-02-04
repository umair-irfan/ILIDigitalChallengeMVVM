//
//  AppDelegate.swift
//  MovieListingMVVMAssignment
//
//  Created by Umair Irfan on 22/06/2021.
//

import UIKit
import RxSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Properties
       
       var window: UIWindow?
       private var appCoordinator: AppCoordinator?
       private let disposeBag = DisposeBag()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        appCoordinate().subscribe().disposed(by: disposeBag)
        return true
    }


}

// MARK: Navigation

private extension AppDelegate {
    func appCoordinate() -> Observable<ResultType<Void>> {
        appCoordinator = AppCoordinator(with: window!)
        return appCoordinator!.start().flatMap { [unowned self] _ in
            return self.appCoordinate()
        }
    }
}


