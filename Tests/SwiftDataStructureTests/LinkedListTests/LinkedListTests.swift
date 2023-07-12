//
//  LinkedListTests.swift
//  
//
//  Created by sejin on 2023/07/12.
//

import XCTest
@testable import SwiftDataStructure

final class LinkedListTests: XCTestCase {
    var list: LinkedList<Int>!
    
    override func setUp() {
        super.setUp()
        self.list = LinkedList<Int>()
    }
    
    override func tearDown() {
        self.list = nil
    }
    
    func test_count() {
        XCTAssertEqual(list.count, 0)
        appendThreeItems()
        XCTAssertEqual(list.count, 3)
        list.removeFirst()
        XCTAssertEqual(list.count, 2)
        list.removeFirst()
        list.removeFirst()
        XCTAssertEqual(list.count, 0)
        list.removeFirst()
        XCTAssertEqual(list.count, 0)
    }
    
    func test_isEmpty() {
        XCTAssertEqual(list.isEmpty, true)
        appendThreeItems()
        XCTAssertEqual(list.isEmpty, false)
    }
    
    func test_append() {
        list.append(7)
        list.append(8)
        
        var last = list.removeLast()
        XCTAssertEqual(last, 8)
        
        last = list.removeLast()
        XCTAssertEqual(last, 7)
    }
    
    func test_insert() {
        appendThreeItems()
        
        list.insert(7, index: 0)
        XCTAssertEqual(list.count, 4)
        
        let first = list.removeFirst()
        XCTAssertEqual(first, 7)
        
        list.insert(8, index: 2)
        XCTAssertEqual(list.contains(8), true)
    }
    
    func test_removeLast() {
        appendThreeItems()
        
        var last = list.removeLast()
        XCTAssertEqual(last, 2)
        
        list.append(7)
        last = list.removeLast()
        XCTAssertEqual(last, 7)
    }
    
    func test_removeFirst() {
        appendThreeItems()
        
        var first = list.removeFirst()
        XCTAssertEqual(first, 3)
        
        list.append(7)
        first = list.removeFirst()
        XCTAssertEqual(first, 1)
    }
    
    func test_removeAt() {
        appendThreeItems()
        
        list.remove(at: 0)
        XCTAssertEqual(list.count, 2)
        let first = list.removeFirst()
        XCTAssertEqual(first, 1)
        
        list.append(7)
        list.append(8)
        XCTAssertEqual(list.count, 3)
    }
    
    func test_contains() {
        appendThreeItems()
        
        XCTAssertEqual(list.contains(2), true)
        list.removeLast()
        XCTAssertEqual(list.contains(2), false)
    }
    
    func appendThreeItems() {
        for item in [3, 1, 2] {
            list.append(item)
        }
    }
}
