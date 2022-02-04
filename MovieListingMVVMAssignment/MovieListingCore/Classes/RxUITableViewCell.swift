//
//  RxUITableViewCell.swift
//  MovieListingMVVMAssignment
//
//  Created by Umair Irfan on 23/06/2021.
//

import Foundation
import UIKit
import RxSwift

public protocol ReusableTableViewCellViewModelType {
    var reusableIdentifier: String { get }
}

public protocol NibLoadableView: class { }

public extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}

public protocol ReusableView: class {}

public extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}


public protocol ConfigurableCell {
    func configure(with viewModel: Any)
    func setIndexPath(_ indexPath: IndexPath)
}

public class RxUITableViewCell: UITableViewCell, ReusableView, NibLoadableView, ConfigurableCell {
    
    private(set) public var disposeBag = DisposeBag()
    public var indexPath: IndexPath!
    
    override open func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    open func configure(with viewModel: Any) {
        fatalError("Configure with viewModel must be implemented.")
    }
    
    public func setIndexPath(_ indexPath: IndexPath) {
        self.indexPath = indexPath
    }
}


