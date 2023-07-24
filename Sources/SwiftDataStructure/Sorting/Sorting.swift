//
//  Sorting.swift
//  
//
//  Created by sejin on 2023/07/24.
//

import Foundation

/// Ascending Order Sort
/// 내림차순이 필요하다면 정렬 후 .reversed로 뒤집어서 사용
public struct Sorting {
    
    // MARK: - initialization
    public init() {}
    
    // MARK: - Methods
    
    /// Straight Selection Sort
    /// O(N^2)
    public static func selectionSort<Element: Comparable>(elements: [Element]) -> [Element] {
        var elements = elements
        
        let endIndex = elements.count - 1
        for i in 0..<endIndex {
            let minIndex = Sorting.minIndex(elements: elements, startIndex: i, endIndex: endIndex)
            elements.swapAt(i, minIndex)
        }
        
        return elements
    }
    
    private static func minIndex<Element: Comparable>(elements: [Element], startIndex: Int, endIndex: Int) -> Int {
        var minIndex = startIndex
        for i in (startIndex+1)...endIndex {
            if elements[i] < elements[minIndex] {
                minIndex = i
            }
        }
        return minIndex
    }
    
    /// Bubble Sort
    /// O(N^2)
    public static func bubbleSort<Element: Comparable>(elements: [Element]) -> [Element] {
        var elements = elements
        
        for i in 0..<(elements.count-1) {
            bubbleUp(elements: &elements, startIndex: i, endIndex: elements.count - 1)
        }
        
        return elements
    }
    
    private static func bubbleUp<Element: Comparable>(elements: inout [Element], startIndex: Int, endIndex: Int) {
        for i in stride(from: endIndex, to: startIndex, by: -1) {
            if elements[i] < elements[i-1] {
                elements.swapAt(i, i-1)
            }
        }
    }
    
    /// Insertion Sort
    /// O(N^2)
    public static func insertionSort<Element: Comparable>(elements: [Element]) -> [Element] {
        var elements = elements
        
        for count in 0..<elements.count {
            Sorting.insertElement(elements: &elements, startIndex: 0, endIndex: count)
        }
        
        return elements
    }
    
    private static func insertElement<Element: Comparable>(elements: inout [Element], startIndex: Int, endIndex: Int) {
        var finished = false
        var current = endIndex
        var moreToSearch: Bool {
            current != startIndex
        }
        
        while (moreToSearch && !finished) {
            if elements[current] < elements[current-1] {
                elements.swapAt(current, current-1)
                current -= 1
            } else {
                finished = true
            }
        }
    }
}
