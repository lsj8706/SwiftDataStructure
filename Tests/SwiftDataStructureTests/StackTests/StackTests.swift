//
//  StackTests.swift
//  
//
//  Created by sejin on 2023/07/11.
//

import XCTest
@testable import SwiftDataStructure

final class StackTests: XCTestCase {
    var stack: Stack<Int>!
    
    override func setUp() {
        super.setUp()
        self.stack = Stack<Int>()
    }
    
    override func tearDown() {
        self.stack = nil
    }
    
    func test_isEmpty() {
        XCTAssertEqual(stack.isEmpty, true)
        stack.push(1)
        XCTAssertEqual(stack.isEmpty, false)
        stack.pop()
        XCTAssertEqual(stack.isEmpty, true)
    }
    
    func test_top() {
        stack.push(5)
        stack.push(2)
        XCTAssertEqual(stack.top, 2)
        stack.pop()
        XCTAssertEqual(stack.top, 5)
    }
    
    func test_push() {
        stack.push(3)
        stack.push(1)
        stack.push(2)
        
        XCTAssertEqual(stack.count, 3)
        XCTAssertEqual(stack.top, 2)
    }
    
    func test_pop() {
        pushThreeItems()
        let top = stack.pop()
        XCTAssertEqual(top, 2)
    }
    
    func pushThreeItems() {
        stack.push(3)
        stack.push(1)
        stack.push(2)
    }
}
