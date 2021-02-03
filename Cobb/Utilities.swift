//
//  Utilities.swift
//  Cobb
//
//  Created by Dario Pellegrini on 03/02/2021.
//

import Foundation

public func cobbDream(_ closure: (CobbDependenciesContainer) -> ()) {
    closure(CobbDependenciesContainer.shared)
}

public func cobbDream(_ closure: () -> Dependencies) {
    closure().dream()
}

public func inject<T: Any>() -> T {
    if let resolved: T = CobbDependenciesContainer.shared.get() {
        return resolved
    }
    fatalError("Dependency \(T.self) not resolved correctly")
}
