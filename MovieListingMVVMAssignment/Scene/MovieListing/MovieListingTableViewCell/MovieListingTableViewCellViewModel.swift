//
//  MovieListingTableViewCellViewModel.swift
//  MovieListingMVVMAssignment
//
//  Created by Umair Irfan on 23/06/2021.
//

import Foundation
import RxSwift


protocol MovieListingTableViewCellViewModelInput {
    
}

protocol MovieListingTableViewCellViewModelOutput {
    var movieName: Observable<String> { get }
}

protocol MovieListingTableViewCellViewModelType {
    var inputs: MovieListingTableViewCellViewModelInput { get }
    var outputs: MovieListingTableViewCellViewModelOutput { get }
}

class MovieListingTableViewCellViewModel: MovieListingTableViewCellViewModelInput,MovieListingTableViewCellViewModelOutput,MovieListingTableViewCellViewModelType, ReusableTableViewCellViewModelType {
    
    //MARK: Properties
    
    let movie: Movies
    private let disposeBag = DisposeBag()
    var reusableIdentifier: String { MovieListingTableViewCell.reuseIdentifier }
   
    var inputs: MovieListingTableViewCellViewModelInput { self }
    var outputs: MovieListingTableViewCellViewModelOutput { self }
    
    //MARK: Subjects
    
    private var movieNameSubject: BehaviorSubject<String>
    
    //MARK: Inputs
    
    
    //MARK: Outputs
    
    var movieName: Observable<String> { movieNameSubject.asObservable() }
    
    //MARK: Initalizer
    
    init(_ movie: Movies) {
        self.movie = movie
        self.movieNameSubject = BehaviorSubject(value: movie.title ?? "")
    }
}
