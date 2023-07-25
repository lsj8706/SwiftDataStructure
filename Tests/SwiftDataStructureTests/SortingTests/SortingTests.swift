//
//  SortingTests.swift
//  
//
//  Created by sejin on 2023/07/24.
//

import Foundation

import XCTest
@testable import SwiftDataStructure

final class SortingTests: XCTestCase {
    
    private let target: [Int] = [3,1,4,5,2,8,9,7,6]
    private lazy var sortedTarget = self.target.sorted()
 
    func test_straight_sort() {
        let result = Sorting.selectionSort(elements: target)
        XCTAssertEqual(result, sortedTarget)
    }
    
    func test_straight_sort_중복_아이템() {
        let target = [5,3,4,4,1,1,2]
        let sortedTarget = target.sorted()
        let result = Sorting.selectionSort(elements: target)
        XCTAssertEqual(result, sortedTarget)
    }
    
    func test_bubble_sort() {
        let result = Sorting.bubbleSort(elements: target)
        XCTAssertEqual(result, sortedTarget)
    }
    
    func test_bubble_sort_중복_아이템() {
        let target = [5,3,4,4,1,1,2]
        let sortedTarget = target.sorted()
        let result = Sorting.bubbleSort(elements: target)
        XCTAssertEqual(result, sortedTarget)
    }
    
    func test_insertion_sort() {
        let result = Sorting.insertionSort(elements: target)
        XCTAssertEqual(result, sortedTarget)
    }
    
    func test_insertion_sort_중복_아이템() {
        let target = [5,3,4,4,1,1,2]
        let sortedTarget = target.sorted()
        let result = Sorting.insertionSort(elements: target)
        XCTAssertEqual(result, sortedTarget)
    }
    
    func test_heap_sort() {
        let result = Sorting.heapSort(elements: target)
        XCTAssertEqual(result, sortedTarget)
    }
    
    func test_heap_sort_중복_아이템() {
        let target = [5,3,4,4,1,1,2]
        let sortedTarget = target.sorted()
        let result = Sorting.heapSort(elements: target)
        XCTAssertEqual(result, sortedTarget)
    }
}
