//
//  SimpleBind.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 02/02/2023.
//

import Foundation

class SimpleBind<T> {
    
    var value: T {
        didSet {
            listeners.forEach({ $0(value) })
        }
    }
    
    private var listeners: [(T) -> Void] = []
    
    init(value: T) {
        self.value = value
    }
    
    func listen(block: @escaping (T) -> Void) {
        listeners.append(block)
    }
    
}
