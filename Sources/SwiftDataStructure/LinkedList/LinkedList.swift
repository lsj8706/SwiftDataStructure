//
//  LinkedList.swift
//  
//
//  Created by sejin on 2023/07/12.
//

import Foundation

public class Node<T> {
    var data: T
    var next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(data)"
        }
        return "\(data) -> " + String(describing: next) + " "
    }
}

/// head가 제일 앞 노드를 가리키는 List
/// Queue로 사용할 때 유리
public class LinkedList<T: Equatable> {
    
    // MARK: - Properties
    
    private var head: Node<T>?
    
    public private(set) var count: Int = 0
    
    public var isEmpty: Bool {
        self.count == 0
    }
    
    // MARK: - initialization
    
    public init() {}
    
    // MARK: - Methods
    
    /// O(n)
    public func append(_ data: T) {
        defer {
            increaseCount()
        }
        
        let newNode = Node(data: data)
        
        if head == nil {
            head = newNode
            return
        }
        
        var node = head
        
        while node?.next != nil {
            node = node?.next
        }
        
        node?.next = newNode
    }
    
    /// O(n)
    /// index가 0이라면 O(1)
    public func insert(_ data: T, index: Int) {
        guard index <= count && index >= 0 else {
            fatalError("Index out of range")
        }
        
        defer {
            increaseCount()
        }
        
        let newNode = Node(data: data)
        
        if index == 0 {
            newNode.next = head
            head = newNode
            return
        }
        
        var node = head
        
        for _ in 0..<(index - 1) {
            node = node?.next
        }
        
        let nextNode = node?.next
        
        node?.next = newNode
        newNode.next = nextNode
    }
    
    /// O(n)
    @discardableResult
    public func removeLast() -> T? {
        defer {
            reduceCount()
        }
        
        if head == nil { return nil }
        
        // 1개의 노드만 존재하는 상황에서 removeLast가 실행되었을 때
        if head?.next == nil {
            let data = head?.data
            head = nil
            return data
        }
        
        var node = head
        
        while node?.next?.next != nil {
            node = node?.next
        }
        
        let data = node?.next?.data
        node?.next = nil
        
        return data
    }
    
    /// O(1)
    @discardableResult
    public func removeFirst() -> T? {
        defer {
            self.reduceCount()
        }
        
        if head == nil { return  nil }
        
        let data = head?.data
        
        head = head?.next
        
        return data
    }
    
    /// O(n)
    public func remove(at index: Int) {
        guard index < count && index >= 0 else {
            fatalError("Index out of range")
        }
        
        defer {
            self.reduceCount()
        }
        
        if head == nil { return }
        
        // 1개의 노드만 존재하는 상황에서 remove가 실행되었을 때
        if index == 0 {
            head = head?.next
            return
        }
        
        var node = head
        
        for _ in 0..<(index - 1) {
            node = node?.next
        }
        
        node?.next = node?.next?.next
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
}

// MARK: - CustomStringConvertible

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}
