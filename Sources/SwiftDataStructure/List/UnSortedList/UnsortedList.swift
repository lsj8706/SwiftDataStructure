//
//  UnsortedList.swift
//  
//
//  Created by sejin on 2023/07/10.
//

import Foundation

public struct UnsortedList<T: Equatable>: Listable, Sequence, IteratorProtocol {
    
    public typealias Element = T
    
    // MARK: - Properties
    
    private var info = Array<T>()
    private var currentPos: Int = 0
    
    public var count: Int {
        self.info.count
    }
    
    // MARK: - initialization
    
    public init() {}
    
    // MARK: - Methods
    
    /// 모든 아이템 제거
    /// O(N)
    public mutating func reset() {
        info.removeAll()
    }
    
    /// O(N)
    public func contains(_ item: T) -> Bool {
        info.contains { $0 == item }
    }
    
    /// O(1)
    public mutating func insert(_ item: T) {
        info.append(item)
    }
    
    /// O(N)
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
