//
//  Heap.swift
//  
//
//  Created by sejin on 2023/07/19.
//

import Foundation

public struct Heap<T: Comparable> {
    
    // MARK: - Properties
    
    private var elements = [T]()
    private let sortFunction: (T, T) -> Bool
    
    /// O(1)
    public var isEmpty: Bool {
        self.elements.isEmpty
    }
    
    /// O(1)
    public var count: Int {
        return elements.count
    }
    
    /// O(1)
    public var peek: T? {
        elements.first
    }
    
    // MARK: - initialization
    
    public init(sortFunction: @escaping (T, T) -> Bool) {
        self.sortFunction = sortFunction
    }
    
    // MARK: - Methods
    
    private func parentIndex(of i: Int) -> Int {
        return (i - 1) / 2
    }
    
    private func leftChildIndex(of i: Int) -> Int {
        return 2*i + 1
    }
    
    private func rightChildIndex(of i: Int) -> Int {
        return 2*i + 2
    }
    
    /// O(N)
    public func contains(_ item: T) -> Bool {
        return elements.contains(where: { $0 == item })
    }
    
    /// O(logN)
    mutating
    public func insert(_ item: T) {
        elements.append(item)
        swimUp(elements.count - 1)
    }
    
    /// O(logN)
    mutating
    private func swimUp(_ index: Int) {
        var childIndex = index
        let child = elements[childIndex]
        var parentIndex = self.parentIndex(of: childIndex)
        
        while childIndex > 0 && sortFunction(child, elements[parentIndex]) {
            elements[childIndex] = elements[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(of: childIndex)
        }
        
        elements[childIndex] = child
    }
    
    /// root 노드를 제거
    /// O(logN)
    @discardableResult
    public mutating func remove() -> T? {
        guard !elements.isEmpty else { return nil }
        
        if elements.count == 1 {
            return elements.removeLast()
        } else {
            let value = elements[0]
            elements[0] = elements.removeLast()
            diveDown(0)
            return value
        }
    }
    
    /// 특정 인덱스의 노드 제거
    /// O(logN)
    @discardableResult
    public mutating func remove(at index: Int) -> T? {
        guard index < elements.count else { return nil }
        let lastIndex = elements.count - 1
        elements.swapAt(index, lastIndex)
        diveDown(from: index, until: lastIndex)
        swimUp(index)
        return elements.removeLast()
    }
    
    /// O(1)
    public mutating func removeAll() {
        self.elements = []
    }
    
    /// O(logN)
    private mutating func diveDown(_ index: Int) {
        diveDown(from: index, until: elements.count)
    }
    
    /// O(logN)
    private mutating func diveDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(of: index)
        let rightChildIndex = self.rightChildIndex(of: index)
        
        var temp = index
        
        if leftChildIndex < endIndex && sortFunction(elements[leftChildIndex], elements[temp]) {
            temp = leftChildIndex
        }
        
        if rightChildIndex < endIndex && sortFunction(elements[rightChildIndex], elements[temp]) {
            temp = rightChildIndex
        }
        
        if temp == index { return }
        
        elements.swapAt(index, temp)
        diveDown(from: temp, until: endIndex)
    }
}
