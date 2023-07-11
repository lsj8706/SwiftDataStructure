//
//  Stack.swift
//  
//
//  Created by sejin on 2023/07/11.
//

import Foundation

public struct Stack<T> {
    
    // MARK: - Properties
    
    private var info = [T]()
    
    /// O(1)
    public var count: Int {
        self.info.count
    }
    
    /// O(1)
    public var isEmpty: Bool {
        self.info.isEmpty
    }
    
    /// O(1)
    public var top: T? {
        self.info.last
    }
    
    // MARK: - initialization
    
    public init() {}
    
    // MARK: - Methods
    
    /// O(1)
    public mutating func push(_ item: T) {
        self.info.append(item)
    }
    
    /// O(1)
    @discardableResult
    public mutating func pop() -> T? {
        return info.popLast()
    }
}
