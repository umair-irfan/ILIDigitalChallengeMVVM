//
//  RxEventConvertable+Extension.swift
//  MovieListingMVVMAssignment
//
//  Created by Umair Irfan on 23/06/2021.
//

import Foundation
import RxSwift

public extension ObservableType where Element: EventConvertible {
    func elements() -> Observable<Element.Element> {
        return compactMap { $0.event.element }
    }
    func errors() -> Observable<Swift.Error> {
        return compactMap { $0.event.error }
    }
}
