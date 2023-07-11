//
//  DoubleStackQueue.swift
//  
//
//  Created by sejin on 2023/07/11.
//

import Foundation

public struct DoubleStackQueue<T> {
    
    // MARK: - Properties
    
    private var inbox = [T]()
    private var outbox = [T]()
    
    /// O(1)
    public var count: Int {
        self.inbox.count + self.outbox.count
    }
    
    /// O(1)
    public var isEmpty: Bool {
        self.count == 0
    }
    
    /// O(1)
    public var origin: [T] {
        self.outbox.reversed() + inbox
    }
    
    /// O(1)
    public var peek: T? {
        self.origin.first
    }
    
    // MARK: - initialization
    
    public init() {}
    
    // MARK: - Methods
    
    /// O(1)
    public mutating func enqueue(_ input: T) {
        inbox.append(input)
    }
    
    /// O(1)
    /// outbox가 비어있는 경우 O(n)
    @discardableResult
    public mutating func dequeue() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        
        return outbox.popLast()
    }
}
