//
//  Queue.swift
//  
//
//  Created by sejin on 2023/07/11.
//

import Foundation

public struct Queue<T> {
    
    // MARK: - Properties
    
    private var info = [T?]()
    
    private var head: Int = 0
    
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
        guard head <= info.count, let item = info[head] else { return nil }
        return item
    }
    
    // MARK: - initialization
    
    public init() {}
    
    
    // MARK: - Methods
    
    /// O(1)
    public mutating func enqueue(_ item: T) {
        self.info.append(item)
    }
    
    /// O(1)
    /// Head 포인터가 이동 -> 특정 개수 이상 포인터가 이동 후에는 O(n)으로 한번 동작, 이후에는 다시 O(1)
    @discardableResult
    public mutating func dequeue(_ item: T) -> T? {
        guard let item = self.peek else { return nil }
        info[head] = nil
        head += 1
        
        if head > 50 {
            info.removeFirst(head)
            head = 0
        }
        
        return item
    }
}
