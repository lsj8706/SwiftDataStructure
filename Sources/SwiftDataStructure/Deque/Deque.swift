//
//  Deque.swift
//  
//
//  Created by sejin on 2023/07/15.
//

import Foundation

public struct Deque<T> {
    
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
    
    // MARK: - initialization
    
    public init() {}
    
    public init(array: [T]) {
        self.inbox = array
    }
    
    // MARK: - Methods
    
    /// O(1)
    public mutating func pushFirst(_ item: T) {
        self.outbox.append(item)
    }
    
    /// O(1)
    public mutating func pushLast(_ item: T) {
        self.inbox.append(item)
    }
    
    /// O(1)
    /// outbox가 비어있는 경우 O(n)
    public mutating func popFirst() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        
        return outbox.popLast()
    }
    
    /// O(1)
    /// inbox가 비어있는 경우 O(n)
    public mutating func popLast() -> T? {
        if inbox.isEmpty {
            inbox = outbox.reversed()
            outbox.removeAll()
        }
        
        return inbox.popLast()
    }
}

public extension Deque where T: Equatable {
    /// O(n)
    func contains(_ item: T) -> Bool {
        let inboxContains =  inbox.contains(where: { $0 == item })
        let outboxContains =  outbox.contains(where: { $0 == item })
        
        return inboxContains || outboxContains
    }
}
