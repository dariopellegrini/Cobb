//
//  Builders.swift
//  Cobb
//
//  Created by Dario Pellegrini on 03/02/2021.
//

import Foundation

@_functionBuilder
struct DefinitionsBuilder {
    static func buildBlock(_ definitionsContainers: DefinitionContainer...) -> [DefinitionContainer] {
        return definitionsContainers
    }
}

public struct Dependencies {
    let definitionsContainers: [DefinitionContainer]
    
    init(@DefinitionsBuilder _ content: () -> [DefinitionContainer]) {
        self.definitionsContainers = content()
    }
    
    public func build() {
        definitionsContainers.forEach {
            $0.build()
        }
    }
}

protocol DefinitionContainer {
    func build()
}

public struct Singleton<T: Any>: DefinitionContainer {
    var closure: () -> T
    
    init(_ closure: @escaping () -> T) {
        self.closure = closure
    }
    
    func build() {
        DependenciesContainer.shared.singleton(closure)
    }
}

public struct Factory<T: Any>: DefinitionContainer {
    var closure: () -> T
    
    init(_ closure: @escaping () -> T) {
        self.closure = closure
    }
    
    func build() {
        DependenciesContainer.shared.factory(closure)
    }
}
