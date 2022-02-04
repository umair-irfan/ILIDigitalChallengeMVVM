//
//  MovieRepository.swift
//  MovieListingMVVMAssignment
//
//  Created by Umair Irfan on 23/06/2021.
//

import Foundation
import RxSwift

protocol MovieRepositoryType {
    func fetchMoviesLists() -> Observable<Event<[Movies]?>>
}

//class MovieRepository: MovieRepositoryType {
//    func fetchMoviesLists() -> Observable<Event<MoviesData?>> {
//        // Create the SerivceManger or Any MicroService for real implmentation of API's
//    }
//}

class MockMoviesRepositiory: MovieRepositoryType {
    func fetchMoviesLists() -> Observable<Event<[Movies]?>> {
        Observable.create { (observer) -> Disposable in
            observer.onNext(Movies.mock)
            return Disposables.create()
        }.materialize()
    }
}
