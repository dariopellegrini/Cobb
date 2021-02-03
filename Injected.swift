//
//  Injected.swift
//  Cobb
//
//  Created by Dario Pellegrini on 03/02/2021.
//

import Foundation

@propertyWrapper struct Injected<T> {
    let currentValue: T = inject()
    public var wrappedValue: T { get { currentValue } }
}
