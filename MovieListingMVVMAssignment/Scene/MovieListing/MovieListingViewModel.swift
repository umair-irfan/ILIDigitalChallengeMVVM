//
//  MovieListingViewModel.swift
//  MovieListingMVVMAssignment
//
//  Created by Umair Irfan on 22/06/2021.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

protocol MovieListingViewModelInput {
    var viewAppearObserver: AnyObserver<Void> { get }
    var selectedMovieObserver: AnyObserver<Movies> { get }
}

protocol MovieListingViewModelOutput {
    var error: Observable<String> { get }
    var moviesResult: Observable<[Movies]> { get }
    var movieDetail: Observable<Movies> { get }
    var dataSource: Observable<[SectionModel<Int, ReusableTableViewCellViewModelType>]> { get }
}

protocol  MovieListingViewModelType {
    var inputs: MovieListingViewModelInput { get }
    var outputs: MovieListingViewModelOutput { get }
}

class MovieListingViewModel: MovieListingViewModelInput,MovieListingViewModelOutput,MovieListingViewModelType{
    
    //MARK: Properties
    private let disposeBag = DisposeBag()
    private let repository: MovieRepositoryType
    var inputs: MovieListingViewModelInput { self }
    var outputs: MovieListingViewModelOutput { self }
    
    
    // MARK: Subjects
    private let viewAppearSubject = PublishSubject<Void>()
    private let errorSubject = PublishSubject<String>()
    private let selectedMovieSubject = PublishSubject<Movies>()
    private let movieDetailSubject = PublishSubject<Movies>()
    private let movieResultSubject = BehaviorSubject<[Movies]>(value: [])
    private var dataSourceSubject = BehaviorSubject<[SectionModel<Int, ReusableTableViewCellViewModelType>]>(value: [])
    
    
    // MARK: Inputs
    var viewAppearObserver: AnyObserver<Void> { viewAppearSubject.asObserver() }
    var selectedMovieObserver: AnyObserver<Movies> { selectedMovieSubject.asObserver() }
    
    // MARK: Outputs
    var error: Observable<String> { errorSubject.asObservable() }
    var moviesResult: Observable<[Movies]> { movieResultSubject.asObservable() }
    var movieDetail: Observable<Movies> { movieDetailSubject.asObservable() }
    var dataSource: Observable<[SectionModel<Int, ReusableTableViewCellViewModelType>]> { dataSourceSubject.asObservable() }
    
    
    
    //MARK: Initializer
    init(_ repository: MovieRepositoryType) {
        self.repository = repository
        fetchMovieListing(repository)
        showMovieList()
        handleMovieSelection()
        
    }
}

//MARK: Fetch Data, Show Data, Handle Data Selection

extension MovieListingViewModel {
    
    func fetchMovieListing(_ repository: MovieRepositoryType){
        let request = viewAppearSubject.do(onNext: { _ in  })
            .flatMap { _ in repository.fetchMoviesLists()}
            .do(onNext: { _ in  })
            .share()
        request.errors().map{ $0.localizedDescription }.bind(to: errorSubject).disposed(by: disposeBag)
        request.elements().map{ $0  ?? [] }.bind(to: movieResultSubject).disposed(by: disposeBag)
    }
    
    func showMovieList(){
        movieResultSubject.map{ $0.map {  MovieListingTableViewCellViewModel($0) } }
            .map{ [SectionModel(model: 0, items: $0)] }
            .bind(to: dataSourceSubject)
            .disposed(by: disposeBag)
    }
    
    func handleMovieSelection(){
        selectedMovieSubject.map{ $0 }.bind(to: movieDetailSubject)
            .disposed(by: disposeBag)
    }
}


