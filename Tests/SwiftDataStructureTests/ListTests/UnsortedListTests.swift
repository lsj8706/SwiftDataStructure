//
//  UnsortedListTests.swift
//  
//
//  Created by sejin on 2023/07/10.
//

import XCTest
@testable import SwiftDataStructure

final class UnsortedListTests: XCTestCase {
    
    var unsortedList: UnsortedList<Int>!
    
    override func setUp() {
        super.setUp()
        self.unsortedList = UnsortedList<Int>()
    }
    
    override func tearDown() {
        self.unsortedList = nil
    }
    
    func test_count() {
        insertThreeItems()
        
        XCTAssertEqual(unsortedList.count, 3)
    }
    
    func test_contains() {
        insertThreeItems()
        
        XCTAssertEqual(unsortedList.contains(4), true)
    }
    
    func test_insert() {
        insertThreeItems()
        unsortedList.insert(10)
        
        XCTAssertEqual(unsortedList.count, 4)
        XCTAssertEqual(unsortedList.contains(10), true)
    }
    
    func test_remove() {
        insertThreeItems()
        
        unsortedList.remove(3)
        
        XCTAssertEqual(unsortedList.count, 2)
        XCTAssertEqual(unsortedList.contains(3), false)
    }
    
    func test_reset() {
        insertThreeItems()
        
        unsortedList.reset()
        
        XCTAssertEqual(unsortedList.count, 0)
    }
    
    func test_serial_actions() {
        insertThreeItems()
        XCTAssertEqual(unsortedList.count, 3)
        
        unsortedList.insert(7)
        XCTAssertEqual(unsortedList.contains(7), true)
        
        unsortedList.remove(5)
        XCTAssertEqual(unsortedList.count, 3)
        XCTAssertEqual(unsortedList.contains(5), false)
        
        unsortedList.reset()
        XCTAssertEqual(unsortedList.count, 0)
        XCTAssertEqual(unsortedList.contains(4), false)
    }
    
    private func insertThreeItems() {
        unsortedList.insert(4)
        unsortedList.insert(3)
        unsortedList.insert(5)
    }
}

