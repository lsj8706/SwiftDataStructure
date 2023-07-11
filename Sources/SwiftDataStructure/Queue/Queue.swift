//
//  Queue.swift
//  
//
//  Created by sejin on 2023/07/11.
//

import Foundation

public struct Queue<T> {
    
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
    public var peek: T? {
        self.info.first
    }
    
    // MARK: - initialization
    
    public init() {}
    
    
    // MARK: - Methods
    
    /// O(1)
    public mutating func enqueue(_ item: T) {
        self.info.append(item)
    }
    
    /// O(n)
    @discardableResult
    public mutating func dequeue() -> T? {
        return self.info.removeFirst()
    }
}
