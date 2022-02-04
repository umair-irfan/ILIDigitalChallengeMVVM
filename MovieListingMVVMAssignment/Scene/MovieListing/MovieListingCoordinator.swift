//
//  MovieListingCoordinator.swift
//  MovieListingMVVMAssignment
//
//  Created by Umair Irfan on 22/06/2021.
//

import Foundation
import RxSwift
import UIKit

class MovieListingCoordinator: Coordinator<ResultType<Void>> {
    
    var root: UINavigationController!
    var window: UIWindow!
    var result = PublishSubject<ResultType<Void>>()
   
    // MARK: DEPENDENCY INVERSION
    let repository: MovieRepositoryType = MockMoviesRepositiory()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<ResultType<Void>> {
        
        let viewModel: MovieListingViewModelType = MovieListingViewModel(self.repository) //MARK: INJECTION
        let viewController = MovieListingViewController.initFrom(storyboard: .movie)
        viewController.viewModel = viewModel
        
        if let `window` = window {
            let navigationController = UINavigationControllerFactory.createTransparentNavigationBarNavigationController(rootViewController: viewController)
            root = navigationController
            viewController.title = "Movies"
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [unowned self] in
                self.window.rootViewController = navigationController
            })
            window.makeKeyAndVisible()
        } else {
            root?.pushViewController(viewController, animated: true)
            root?.navigationBar.isHidden = true
        }
        
        viewModel.outputs.movieDetail.subscribe(onNext: { [ weak self ] in
            guard let self = self else { return }
            self.navigateToMovieDetailScreen($0,self.root)
        }).disposed(by: disposeBag)
        
        return result.asObservable()
    }
}

//MARK: Navigation
extension MovieListingCoordinator {
    func navigateToMovieDetailScreen(_ movie: Movies,_ root: UINavigationController){
        let viewModel: MovieDetailViewModelType = MovieDetailViewModel(self.repository, movie)
        let viewController = MovieDetailViewController.initFrom(storyboard: .movie)
        viewController.viewModel = viewModel
        viewController.title = movie.title
        root.pushViewController(viewController, animated: true)
    }
}
