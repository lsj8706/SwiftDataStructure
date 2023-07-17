//
//  BinarySearchTreeTests.swift
//  
//
//  Created by sejin on 2023/07/17.
//

import XCTest
@testable import SwiftDataStructure

final class BinarySearchTreeTests: XCTestCase {
    var bst: BinarySearchTree<Int>!
    
    override func setUp() {
        super.setUp()
        self.bst = BinarySearchTree<Int>()
    }
    
    override func tearDown() {
        self.bst = nil
    }
    
    func test_isEmpty() {
        XCTAssertEqual(bst.isEmpty, true)
        insertFiveItems()
        XCTAssertEqual(bst.isEmpty, false)
    }
    
    func test_count() {
        XCTAssertEqual(bst.count, 0)
        insertFiveItems()
        XCTAssertEqual(bst.count, 5)
    }
    
    func test_insert() {
        insertFiveItems()
        XCTAssertEqual(bst.count, 5)
        XCTAssertTrue(bst.contains(5))
        XCTAssertFalse(bst.contains(10))
    }
    
    func test_contains() {
        insertFiveItems()
        bst.insert(2)
        XCTAssertTrue(bst.contains(2))
        XCTAssertFalse(bst.contains(10))
    }
    
    func test_remove_leaf() {
        insertFiveItems()
        XCTAssertTrue(bst.contains(8))
        bst.remove(8)
        XCTAssertFalse(bst.contains(8))
    }
    
    func test_remove_node_with_one_child() {
        insertFiveItems()
        bst.insert(9)
        XCTAssertTrue(bst.contains(8))
        bst.remove(8)
        XCTAssertFalse(bst.contains(8))
    }
    
    func test_remove_node_with_two_child() {
        insertFiveItems()
        bst.insert(9)
        XCTAssertTrue(bst.contains(7))
        bst.remove(7)
        XCTAssertFalse(bst.contains(7))
        print(bst!)
    }
    
    func test_inorder() {
        insertFiveItems()
        var items = [Int]()
        bst.traverseInorder { item in
            items.append(item)
        }
        
        XCTAssertEqual(items, [3, 5, 6, 7, 8])
    }
    
    func test_preorder() {
        insertFiveItems()
        var items = [Int]()
        bst.traversePreorder { item in
            items.append(item)
        }
        
        XCTAssertEqual(items, [5, 3, 7, 6, 8])
    }
    
    func test_postorder() {
        insertFiveItems()
        var items = [Int]()
        bst.traversePostorder { item in
            items.append(item)
        }
        
        XCTAssertEqual(items, [3, 6, 8, 7, 5])
    }
    
    private func insertFiveItems() {
        bst.insert(5)
        bst.insert(3)
        bst.insert(7)
        bst.insert(6)
        bst.insert(8)
    }
}
