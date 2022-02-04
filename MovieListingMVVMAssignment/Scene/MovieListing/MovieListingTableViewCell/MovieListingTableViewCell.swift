//
//  MovieListingTableViewCell.swift
//  MovieListingMVVMAssignment
//
//  Created by Umair Irfan on 23/06/2021.
//

import UIKit
import RxSwift

class MovieListingTableViewCell: RxUITableViewCell {
    
    //MARK: Views
    @IBOutlet private var movieName: UILabel!
   
    // MARK: Properties
    private var viewModel: MovieListingTableViewCellViewModelType!
    
    // MARK: View cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: Configuration
    
    override func configure(with viewModel: Any) {
        guard let viewModel = viewModel as? MovieListingTableViewCellViewModelType else { return }
        self.viewModel = viewModel
        bindViews(viewModel)
        self.selectionStyle = .none
    }
}

// MARK: Binding

private extension MovieListingTableViewCell {
    func bindViews(_ viewModel: MovieListingTableViewCellViewModelType){
        viewModel.outputs.movieName.bind(to: movieName.rx.text).disposed(by: disposeBag)
    }
}
