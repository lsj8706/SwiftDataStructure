//
//  DoublyLinkedList.swift
//  
//
//  Created by sejin on 2023/07/13.
//

import Foundation

public class DoublyNode<T> {
    var data: T
    var prev: DoublyNode?
    var next: DoublyNode?
    
    public init(data: T, prev: DoublyNode? = nil, next: DoublyNode? = nil) {
        self.data = data
        self.prev = prev
        self.next = next
    }
}

extension DoublyNode: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(data)"
        }
        return "\(data) -> " + String(describing: next) + " "
    }
}

public class DoublyLinkedList<T: Equatable> {
    
    // MARK: - Properties
    
    private var head: DoublyNode<T>?
    
    private var tail: DoublyNode<T>?
    
    public private(set) var count: Int = 0
    
    public var isEmpty: Bool {
        self.count == 0
    }
    
    // MARK: - initialization
    
    public init() {}
    
    // MARK: - Methods
    
    /// O(1)
    private func reduceCount() {
        if self.count > 0 {
            self.count -= 1
        }
    }
    
    /// O(1)
    private func increaseCount() {
        self.count += 1
    }
    
    /// O(n)
    public func append(_ data: T) {
        defer {
            increaseCount()
        }
        
        let newNode = DoublyNode(data: data)
        
        if head == nil || tail == nil {
            head = newNode
            tail = head
            return
        }
        
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
    }
    
    /// O(n)
    /// index가 0 또는 count-1 이라면 O(1)
    public func insert(_ data: T, index: Int) {
        guard index <= count && index >= 0 else {
            fatalError("Index out of range")
        }
        
        defer {
            increaseCount()
        }
        
        let newNode = DoublyNode(data: data)
        
        if index == 0 {
            newNode.next = head
            head?.prev = newNode
            head = newNode
            
            if tail == nil {
                tail = newNode
            }
            return
        }
        
        var node = head
        
        for _ in 0..<(index - 1) {
            node = node?.next
        }
        
        let nextNode = node?.next
        
        newNode.prev = node
        newNode.next = nextNode
        node?.next = newNode
        nextNode?.prev = newNode
        
        if nextNode == nil {
            tail = newNode
        }
    }
    
    /// O(1)
    @discardableResult
    public func removeLast() -> T? {
        defer {
            reduceCount()
        }
        
        if head == nil || tail == nil { return nil }
        
        // 1개의 노드만 존재하는 상황에서 removeLast가 실행되었을 때
        if head?.next == nil {
            let data = head?.data
            head = nil
            tail = nil
            return data
        }
        
        let data = tail?.data
        
        tail?.prev?.next = nil
        tail = tail?.prev
        
        return data
    }
    
    /// O(1)
    @discardableResult
    public func removeFirst() -> T? {
        defer {
            self.reduceCount()
        }
        
        if head == nil || tail == nil { return  nil }
        
        // 1개의 노드만 존재하는 상황에서 removeFirst가 실행되었을 때
        if head?.next == nil {
            let data = head?.data
            head = nil
            tail = nil
            return data
        }
        
        let data = head?.data
        
        let nextNode = head?.next
        nextNode?.prev = nil
        
        head = nextNode
        
        return data
    }
    
    /// O(n)
    public func remove(at index: Int) {
        guard index < count && index >= 0 else {
            fatalError("Index out of range")
        }
        
        if index == 0 {
            self.removeFirst()
            return
        }
        
        if index == self.count - 1{
            self.removeLast()
            return
        }
        
        defer {
            self.reduceCount()
        }
        
        if head == nil || tail == nil { return }
        
        var node = head
        
        for _ in 0..<(index - 1) {
            node = node?.next
        }
        
        let nextNode = node?.next?.next
        
        node?.next = nextNode
        nextNode?.prev = node
    }
    
    /// O(n)
    public func contains(_ data: T) -> Bool {
        var node = head
        
        while node?.next != nil {
            if node?.data == data {
                return true
            }
            
            node = node?.next
        }
        
        // 마지막 노드 확인
        return node?.data == data ? true : false
    }
}

// MARK: - CustomStringConvertible

extension DoublyLinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}
