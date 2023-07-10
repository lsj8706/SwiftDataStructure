//
//  UnsortedList.swift
//  
//
//  Created by sejin on 2023/07/10.
//

import Foundation

public protocol UnsortedListable {
    associatedtype Element
    var count: Int { get }
    func contains(_ item: Element) -> Bool
    mutating func insert(_ item: Element)
    mutating func remove(_ item: Element)
    mutating func reset()
}

public struct UnsortedList<T: Equatable>: UnsortedListable, Sequence, IteratorProtocol {
    public typealias Element = T
    
    private var info = Array<T>()
    private var currentPos: Int = 0
    
    public var count: Int {
        self.info.count
    }
    
    /// 모든 아이템 제거
    /// O(n)
    public mutating func reset() {
        info.removeAll()
    }
    
    /// O(n)
    public func contains(_ item: T) -> Bool {
        info.contains { $0 == item }
    }
    
    /// O(1)
    public mutating func insert(_ item: T) {
        info.append(item)
    }
    
    /// O(1)
    public mutating func remove(_ item: T) {
        guard let index = info.firstIndex(where: { $0 == item }) else { return }
        info.remove(at: index)
    }
    
    public mutating func next() -> T? {
        if currentPos >= self.count { return nil }
        defer { currentPos += 1 }
        return info[currentPos]
    }
}
