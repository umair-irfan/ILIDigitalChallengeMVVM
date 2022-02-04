//
//  MovieDetailViewController.swift
//  MovieListingMVVMAssignment
//
//  Created by Umair Irfan on 23/06/2021.
//

import UIKit
import RxSwift

class MovieDetailViewController: UIViewController,StoryboardInitializable {
    
    //MARK: View
    @IBOutlet private var movieSummary: UILabel!
    
    //MARK: Properties
    
    var viewModel: MovieDetailViewModelType!
    private let disposeBag = DisposeBag()

    // MARK: View - Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindViews(viewModel)
    }

}
private extension MovieDetailViewController {
    func bindViews(_ viewModel: MovieDetailViewModelType) {
        viewModel.outputs.movieSummary.bind(to: movieSummary.rx.text).disposed(by: disposeBag)
    }
}



