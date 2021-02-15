//
//  Builders.swift
//  Cobb
//
//  Created by Dario Pellegrini on 03/02/2021.
//

import Foundation

@_functionBuilder
public struct DefinitionsBuilder {
    public static func buildBlock(_ definitionsContainers: DefinitionContainer...) -> [DefinitionContainer] {
        return definitionsContainers
    }
}

public struct Dependencies {
    public let definitionsContainers: [DefinitionContainer]
    
    public init(@DefinitionsBuilder _ content: () -> [DefinitionContainer]) {
        self.definitionsContainers = content()
    }
    
    public func dream() {
        definitionsContainers.forEach {
            $0.build()
        }
    }
}

public protocol DefinitionContainer {
    func build()
}

public struct Singleton<T: Any>: DefinitionContainer {
    var closure: () -> T
    
    public init(_ closure: @escaping () -> T) {
        self.closure = closure
    }
    
    public func build() {
        CobbDependenciesContainer.shared.singleton(closure)
    }
}

public struct Factory<T: Any>: DefinitionContainer {
    var closure: () -> T
    
    public init(_ closure: @escaping () -> T) {
        self.closure = closure
    }
    
    public func build() {
        CobbDependenciesContainer.shared.factory(closure)
    }
}
