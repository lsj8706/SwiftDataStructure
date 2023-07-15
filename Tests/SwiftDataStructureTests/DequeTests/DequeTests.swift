//
//  DequeTests.swift
//  
//
//  Created by sejin on 2023/07/15.
//

import XCTest
@testable import SwiftDataStructure

final class DequeTests: XCTestCase {
    var deque: Deque<Int>!
    
    override func setUp() {
        super.setUp()
        self.deque = Deque<Int>()
    }
    
    override func tearDown() {
        self.deque = nil
    }
    
    func test_count() {
        deque.pushFirst(3)
        deque.pushFirst(4)
        deque.pushFirst(2)
        XCTAssertEqual(deque.count, 3)
        
        deque.popLast()
        XCTAssertEqual(deque.count, 2)
    }
    
    func test_isEmpty() {
        XCTAssertEqual(deque.isEmpty, true)
        
        deque.pushFirst(3)
        XCTAssertEqual(deque.isEmpty, false)
        
        deque.popLast()
        XCTAssertEqual(deque.isEmpty, true)
    }
    
    func test_origin() {
        let origin = [4, 1, 3, 5, 7, 9, 2, 8]
        var target = [Int]()
        
        for num in origin {
            if num % 2 == 0 {
                deque.pushFirst(num)
                target.insert(num, at: 0)
            } else {
                deque.pushLast(num)
                target.append(num)
            }
        }
        
        XCTAssertEqual(deque.origin, target)
    }
    
    func test_pushFirst() {
        deque.pushFirst(3)
        deque.pushFirst(4)
        deque.pushFirst(2)
        
        XCTAssertEqual(deque.count, 3)
        XCTAssertEqual(deque.popFirst(), 2)
        XCTAssertEqual(deque.popLast(), 3)
    }
    
    func test_pushLast() {
        deque.pushLast(3)
        deque.pushLast(4)
        deque.pushLast(2)
        
        XCTAssertEqual(deque.count, 3)
        XCTAssertEqual(deque.popFirst(), 3)
        XCTAssertEqual(deque.popLast(), 2)
    }
    
    func test_popFirst() {
        deque.pushFirst(1)
        deque.pushFirst(2)
        deque.pushLast(3)
        deque.pushLast(4)
        
        XCTAssertEqual(deque.popFirst(), 2)
        XCTAssertEqual(deque.popFirst(), 1)
    }
    
    func test_popLast() {
        deque.pushFirst(1)
        deque.pushFirst(2)
        deque.pushLast(3)
        deque.pushLast(4)
        
        XCTAssertEqual(deque.popLast(), 4)
        XCTAssertEqual(deque.popLast(), 3)
    }
    
    func test_contains() {
        deque.pushLast(1)
        deque.pushLast(2)
        XCTAssertEqual(deque.contains(1), true)
        XCTAssertEqual(deque.contains(3), false)

        deque.pushFirst(3)
        XCTAssertEqual(deque.contains(1), true)
        XCTAssertEqual(deque.contains(3), true)
    }
}
