//
//  PriorityQueueTests.swift
//  
//
//  Created by sejin on 2023/07/21.
//

import XCTest
@testable import SwiftDataStructure

final class PriorityQueueTests: XCTestCase {
    var queue: PriorityQueue<Int>!
    
    override func setUp() {
        super.setUp()
        self.queue = PriorityQueue<Int>(sortFunction: >)
    }
    
    override func tearDown() {
        self.queue = nil
    }
    
    
    func test_isEmpty() {
        XCTAssertEqual(queue.isEmpty, true)
        queue.enqueue(1)
        XCTAssertEqual(queue.isEmpty, false)
        queue.dequeue()
        XCTAssertEqual(queue.isEmpty, true)
    }
    
    func test_peek() {
        queue.enqueue(5)
        queue.enqueue(2)
        XCTAssertEqual(queue.peek, 5)
        queue.dequeue()
        XCTAssertEqual(queue.peek, 2)
    }
    
    func test_enqueue() {
        enqueueFiveItems()
        
        XCTAssertEqual(queue.count, 5)
        XCTAssertEqual(queue.peek, 5)
    }
    
    func test_dequeue() {
        enqueueFiveItems()
        var first = queue.dequeue()
        XCTAssertEqual(first, 5)
        first = queue.dequeue()
        XCTAssertEqual(first, 4)
    }
    
    func enqueueFiveItems() {
        queue.enqueue(3)
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(5)
        queue.enqueue(4)
    }
}
