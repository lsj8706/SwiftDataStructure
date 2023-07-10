//
//  SortedListTests.swift
//  
//
//  Created by sejin on 2023/07/10.
//

import XCTest
@testable import SwiftDataStructure

final class SortedListTests: XCTestCase {
    
    var sortedList: SortedList<Int>!
    
    override func setUp() {
        super.setUp()
        self.sortedList = SortedList<Int>()
    }
    
    override func tearDown() {
        self.sortedList = nil
    }
    
    func test_count() {
        insertThreeItems()
        
        XCTAssertEqual(sortedList.count, 3)
    }
    
    func test_contains() {
        insertThreeItems()
        
        XCTAssertEqual(sortedList.contains(4), true)
    }
    
    func test_insert() {
        insertThreeItems()
        sortedList.insert(10)
        
        XCTAssertEqual(sortedList.count, 4)
        XCTAssertEqual(sortedList.contains(10), true)
    }
    
    func test_remove() {
        insertThreeItems()
        
        sortedList.remove(3)
        
        XCTAssertEqual(sortedList.count, 2)
        XCTAssertEqual(sortedList.contains(3), false)
    }
    
    func test_reset() {
        insertThreeItems()
        
        sortedList.reset()
        
        XCTAssertEqual(sortedList.count, 0)
    }
    
    func test_serial_actions() {
        insertThreeItems()
        XCTAssertEqual(sortedList.count, 3)
        
        sortedList.insert(7)
        XCTAssertEqual(sortedList.contains(7), true)
        
        sortedList.remove(5)
        XCTAssertEqual(sortedList.count, 3)
        XCTAssertEqual(sortedList.contains(5), false)
        
        sortedList.reset()
        XCTAssertEqual(sortedList.count, 0)
        XCTAssertEqual(sortedList.contains(4), false)
    }
    
    func test_iterate() {
        let arr = [3, 4, 5]
        insertThreeItems()
        
        for (i, item) in sortedList.enumerated() {
            XCTAssertEqual(item, arr[i])
        }
    }
    
    private func insertThreeItems() {
        sortedList.insert(4)
        sortedList.insert(3)
        sortedList.insert(5)
    }
}

