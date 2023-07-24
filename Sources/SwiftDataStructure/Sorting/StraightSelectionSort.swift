//
//  StraightSelectionSort.swift
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
}
