//
//  MulticastDelefate.swift
//  ZooMarket
//
//  Created by Tigran Gishyan on 05.07.22.
//

import Foundation

public class MulticastDelegate<T> {
    
    // 1
    private class Wrapper {
        weak var delegate: AnyObject?
        
        init(_ delegate: AnyObject) {
            self.delegate = delegate
        }
    }
    
    // 2
    private var wrappers: [Wrapper] = []
    public var delegates: [T] {
        return wrappers
            .compactMap{ $0.delegate } as! [T]
    }
    
    // 3
    public func add(delegate: T) {
        let wrapper = Wrapper(delegate as AnyObject)
        wrappers.append(wrapper)
    }
    
    // 4
    public func remove(delegate: T) {
        guard let index = wrappers.firstIndex(where: {
            $0.delegate === (delegate as AnyObject)
        }) else {
            return
        }
        wrappers.remove(at: index)
    }
    
    // 5
    public func invokeForEachDelegate(_ handler: (T) -> ()) {
        delegates.forEach { handler($0) }
    }
}
