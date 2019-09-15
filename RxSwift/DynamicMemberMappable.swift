//
//  DynamicMemberMappable.swift
//  
//
//  Created by Yuri Ferretti on 14/09/19.
//

import Foundation

/**
 Protocol to add @dynamicMemberLookup capability
 Observables and SharedSequences
 */
@dynamicMemberLookup
protocol DynamicMemberMappable {}

public extension DynamicMemberMappable where Self: Observable {
    
    public subscript<U>(dynamicMember keyPath: KeyPath<Element, U>) -> Observable<U> {
        return self.map { $0[keyPath: keyPath] }
    }
}

public extension DynamicMemberMappable where Self: SharedSequence {
    
    public subscript<U>(dynamicMember keyPath: KeyPath<Element, U>) -> SharedSequence<SharingStrategy, U> {
        return self.map { $0[keyPath: keyPath] }
    }
}
