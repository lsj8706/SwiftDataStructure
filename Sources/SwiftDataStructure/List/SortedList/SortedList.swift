//
//  SortedList.swift
//  
//
//  Created by sejin on 2023/07/10.
//

import Foundation

public struct SortedList<T: Equatable & Comparable>: Listable, Sequence, IteratorProtocol {
    public typealias Element = T
    
    private var info = Array<T>()
    private var currentPos: Int = 0
    
    public var count: Int {
        self.info.count
    }
    
    /// 모든 아이템 제거
    /// O(N)
    public mutating func reset() {
        info.removeAll()
    }
    
    /// O(logN)
    public func contains(_ item: T) -> Bool {
        var start = 0
        var end = info.count - 1
        
        while start <= end {
            let mid = (start + end) / 2
            if info[mid] == item {
                return true
            }
            
            if info[mid] > item {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        
        return false
    }
    
    /// O(N)
    public mutating func insert(_ item: T) {
        for i in 0..<info.count {
            if info[i] >= item {
                info.insert(item, at: i)
                return
            }
        }
        
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
