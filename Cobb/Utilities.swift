//
//  Utilities.swift
//  Cobb
//
//  Created by Dario Pellegrini on 03/02/2021.
//

import Foundation

public func configureDependencies(_ closure: (DependenciesContainer) -> ()) {
    closure(DependenciesContainer.shared)
}

public func configureDependencies(_ closure: () -> Dependencies) {
    closure().build()
}

public func inject<T: Any>() -> T {
    DependenciesContainer.shared.get()!
}
