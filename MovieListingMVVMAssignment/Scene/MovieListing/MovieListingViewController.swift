//
//  MovieListingViewController.swift
//  MovieListingMVVMAssignment
//
//  Created by Umair Irfan on 22/06/2021.
//

import UIKit
import RxSwift
import RxDataSources

class MovieListingViewController: UIViewController, StoryboardInitializable {
    
    //MARK: Views
    @IBOutlet private var movieTable: UITableView!
    
    //MARK: Properties
    
    var viewModel: MovieListingViewModelType!
    private let disposeBag = DisposeBag()
    private var dataSource: RxTableViewSectionedReloadDataSource<SectionModel<Int, ReusableTableViewCellViewModelType>>!
    
    // MARK: View-cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.inputs.viewAppearObserver.onNext(())
        setupViews()
        bindViews(viewModel)
    }
}

// MARK: View setup

private extension MovieListingViewController {
    func setupViews() {
        movieTable.register(UINib(nibName: MovieListingTableViewCell.nibName, bundle: .main), forCellReuseIdentifier: MovieListingTableViewCell.reuseIdentifier)
    }
}

// MARK: Binding

private extension MovieListingViewController {
    func bindViews(_ viewModel: MovieListingViewModelType) {
        bindTableView(viewModel)
    }
    
    func bindTableView(_ viewModel: MovieListingViewModelType) {
        
        dataSource = RxTableViewSectionedReloadDataSource(configureCell: { (_, tableView, _, viewModel) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.reusableIdentifier) as! RxUITableViewCell
            cell.configure(with: viewModel)
            return cell
        })
        
        viewModel.outputs.dataSource.bind(to: movieTable.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
        
        movieTable.rx.modelSelected(ReusableTableViewCellViewModelType.self)
            .filter{ $0 is MovieListingTableViewCellViewModelType }
            .map{ ($0 as! MovieListingTableViewCellViewModel).movie }
            .debug("MovieListingTableViewCellViewModelType=")
            .bind(to: viewModel.inputs.selectedMovieObserver)
            .disposed(by: disposeBag)
    }
}
