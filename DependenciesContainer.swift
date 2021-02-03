//
//  DependenciesContainer.swift
//  Cobb
//
//  Created by Dario Pellegrini on 03/02/2021.
//

import Foundation

public class DependenciesContainer {
    static var shared = DependenciesContainer()
    private init() {}
    
    private var singletons = [String:Any]()
    private var singletonDefinitions = [String:() -> Any]()
    private var factoryDefinitions = [String:() -> Any]()
    
    public func singleton<T>(_ closure: @escaping () -> T) {
        if singletonDefinitions[String(describing: T.self)] == nil {
            singletonDefinitions[String(describing: T.self)] = closure
        }
    }
    
    public func factory<T>(_ closure: @escaping () -> T) {
        if factoryDefinitions[String(describing: T.self)] == nil {
            factoryDefinitions[String(describing: T.self)] = closure
        }
    }
    
    func get<T: Any>() -> T? {
        if let closure = factoryDefinitions[String(describing: T.self)] {
            return closure() as? T
        } else if let singleton = singletons[String(describing: T.self)] as? T {
            return singleton
        } else if let closure = singletonDefinitions[String(describing: T.self)],
                  let singleton = closure() as? T {
            singletons[String(describing: T.self)] = singleton
        }
        return singletons[String(describing: T.self)] as? T
    }
}
