//
//  MovieDetailViewModel.swift
//  MovieListingMVVMAssignment
//
//  Created by Umair Irfan on 23/06/2021.
//

import Foundation
import RxSwift

protocol MovieDetailViewModelInput {
    
}

protocol MovieDetailViewModelOutput {
    var movieSummary: Observable<String> { get }
}

protocol MovieDetailViewModelType {
    var inputs:  MovieDetailViewModelInput { get }
    var outputs: MovieDetailViewModelOutput { get }
}

class MovieDetailViewModel: MovieDetailViewModelInput,MovieDetailViewModelOutput,MovieDetailViewModelType {
    
    //MARK: Properties
    private var movie: Movies
    private let disposeBag = DisposeBag()
    private let repository: MovieRepositoryType
    
    var inputs: MovieDetailViewModelInput { self }
    var outputs: MovieDetailViewModelOutput { self }
    
    
    // MARK: Subjects
    var movieSummarySubject: BehaviorSubject<String>
    
    // MARK: Inputs
   
    
    // MARK: Outputs
    var movieSummary: Observable<String> { movieSummarySubject.asObservable() }
    
    
    
    //MARK: Initializer
    init(_ repository: MovieRepositoryType, _ movie: Movies) {
        self.repository = repository
        self.movie = movie
        self.movieSummarySubject = BehaviorSubject(value: movie.summary ?? "")
    }
}
