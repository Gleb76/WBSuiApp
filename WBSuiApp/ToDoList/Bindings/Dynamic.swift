//
//  Dynamic.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 1.08.24.
//

import Foundation

class Dynamic<T> {
    typealias Listener = (T) -> Void
    private var listener: Listener?

    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ v: T) {
        value = v
    }

    func bind(_ listener: Listener?) {
        self.listener = listener
    }
}
