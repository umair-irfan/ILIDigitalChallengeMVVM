//
//  AppCoordinator.swift
//  MovieListingMVVMAssignment
//
//  Created by Umair Irfan on 22/06/2021.
//

import Foundation
import UIKit
import RxSwift


class AppCoordinator: Coordinator<ResultType<Void>> {
    
    // MARK: Properties
    
    private let window: UIWindow!
    private let result = PublishSubject<ResultType<Void>>()
    
    init(with window: UIWindow) {
        self.window = window
        super.init()
    }
    
    override func start() -> Observable<ResultType<Void>> {
        navigateToMovieListing(window)
        return result.asObservable()
    }
}

// MARK: Navigation

private extension AppCoordinator {
    func navigateToMovieListing(_ window: UIWindow) {
        let MainCoordinator = MovieListingCoordinator(window: window)
        coordinate(to: MainCoordinator).subscribe(onNext: { _ in }).disposed(by: disposeBag)
        
    }
}





