//
//  Injected.swift
//  Cobb
//
//  Created by Dario Pellegrini on 03/02/2021.
//

import Foundation

@propertyWrapper public struct Injected<T> {
    let currentValue: T = inject()
    public var wrappedValue: T { get { currentValue } }
    
    public init() {}
}
