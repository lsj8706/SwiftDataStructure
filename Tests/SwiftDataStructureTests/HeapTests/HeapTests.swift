//
//  HeapTests.swift
//  
//
//  Created by sejin on 2023/07/19.
//

import XCTest
@testable import SwiftDataStructure

final class HeapTests: XCTestCase {
    var heap: Heap<Int>!
    
    override func setUp() {
        super.setUp()
        self.heap = Heap<Int>(sortFunction: >)
    }
    
    override func tearDown() {
        heap = nil
        super.tearDown()
    }
    
    func test_insert_peek() {
        insertItems()
        XCTAssertEqual(heap.count, 6)
        XCTAssertEqual(heap.peek, 7)
        XCTAssertEqual(heap.remove(), 7)
    }
    
    func test_isEmpty() {
        XCTAssertEqual(heap.isEmpty, true)
        insertItems()
        XCTAssertEqual(heap.isEmpty, false)
    }
    
    func test_count() {
        insertItems()
        XCTAssertEqual(heap.count, 6)
        heap.remove()
        XCTAssertEqual(heap.count, 5)
    }
    
    func test_contains() {
        insertItems()
        XCTAssertEqual(heap.contains(7), true)
        heap.remove()
        XCTAssertEqual(heap.contains(7), false)
    }
    
    func test_remove() {
        insertItems()
        heap.remove()
        heap.remove()
        XCTAssertEqual(heap.peek, 5)
        
        for _ in 0..<4 {
            heap.remove()
        }
        
        XCTAssertEqual(heap.count, 0)
    }
    
    func test_removeAt() {
        insertItems()
        XCTAssertEqual(heap.remove(at: 0), 7)
        XCTAssertEqual(heap.peek, 6)
        
        XCTAssertEqual(heap.remove(at: 4), 2)
    }
    
    func test_removeAll() {
        insertItems()
        heap.removeAll()
        XCTAssertEqual(heap.isEmpty, true)
    }
}

extension HeapTests {
    private func insertItems(with items: [Int] = [5,3,6,1,2,7]) {
        for item in items {
            heap.insert(item)
        }
    }
}
