//
//  Observ.swift
//  Rick and Morty
//
//  Created by Keyi Zhu on 9/10/20.
//

import Foundation
class Observable<T> {

    var value: T {
        didSet {
            listener?(value)
        }
    }

    private var listener: ((T) -> Void)?

    init(_ value: T) {
        self.value = value
    }

    func bind(_ closure: @escaping (T) -> Void) {
        closure(value)
        listener = closure
    }
}
