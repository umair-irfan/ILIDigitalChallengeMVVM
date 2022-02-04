//
//  Coordinator.swift
//  MovieListingMVVMAssignment
//
//  Created by Umair Irfan on 22/06/2021.
//

import Foundation
import RxSwift


public class Coordinator<ResultType>: NSObject {
    

    typealias CoordinationResult = ResultType
    
    public var disposeBag = DisposeBag()
    
    let identifier = UUID()
    
    private var childCoordinators = [UUID: Any]()
    
   
    private func store<T>(coordinator: Coordinator<T>) {
        childCoordinators[coordinator.identifier] = coordinator
        
    }
    
    private func free<T>(coordinator: Coordinator<T>) {
        childCoordinators[coordinator.identifier] = nil
    }
    
    public override init () {}
    open func coordinate<T>(to coordinator: Coordinator<T>) -> Observable<T> {
        store(coordinator: coordinator)
        return coordinator.start()
            .do(onNext: { [weak self] _ in
                self?.free(coordinator: coordinator)
            })
    }
    
    open func start() -> Observable<ResultType> {
        fatalError("Start method should be implemented.")
    }
    
    open func freeAll() {
        childCoordinators = [UUID: Any]()
    }
}
