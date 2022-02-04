//
//  ResultType.swift
//  MovieListingMVVMAssignment
//
//  Created by Umair Irfan on 22/06/2021.
//

import Foundation

public enum ResultType<T> {
    case success(T)
    case cancel
}

public extension ResultType {
    
    var isCancel: Bool {
        if case ResultType.cancel = self {
            return true
        }
        return false
    }
    
    var successValue: T? {
        guard !isCancel else { return nil }
        if case let ResultType.success(value) = self {
            return value
        }
        return nil
    }
}
