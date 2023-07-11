//
//  QueueTests.swift
//  
//
//  Created by sejin on 2023/07/11.
//

import XCTest
@testable import SwiftDataStructure

final class QueueTests: XCTestCase {
    var queue: Queue<Int>!
    
    override func setUp() {
        super.setUp()
        self.queue = Queue<Int>()
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
        enqueueThreeItems()
        
        XCTAssertEqual(queue.count, 3)
        XCTAssertEqual(queue.peek, 3)
    }
    
    func test_dequeue() {
        enqueueThreeItems()
        var first = queue.dequeue()
        XCTAssertEqual(first, 3)
        first = queue.dequeue()
        XCTAssertEqual(first, 1)
    }
    
    func enqueueThreeItems() {
        queue.enqueue(3)
        queue.enqueue(1)
        queue.enqueue(2)
    }
}

