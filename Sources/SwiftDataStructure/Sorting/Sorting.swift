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
    
    // Heap Sort
    // O(N*logN)
    public static func heapSort<Element: Comparable>(elements: [Element]) -> [Element] {
        var elements = elements
        let count = elements.count
        
        // 어레이를 최대 heap으로 바꾼다.
        // count/2 - 1은 non-terminal 노드 중 가장 마지막 노드
        for i in stride(from: count/2-1, through: 0, by: -1) {
            diveDown(elements: &elements, from: i, until: count-1)
        }
        
        // heap이 된 어레이를 정렬시킨다.
        for i in stride(from: count-1, through: 1, by: -1) {
            elements.swapAt(0, i)
            diveDown(elements: &elements, from: 0, until: i-1)
        }
        
        return elements
    }
    
    /// O(logN)
    private static func diveDown<Element: Comparable>(elements: inout [Element], from index: Int, until endIndex: Int) {
        let leftChildIndex = 2*index + 1
        let rightChildIndex = 2*index + 2
        
        var temp = index
        
        let sortFunction: (Element, Element) -> Bool = { $0 > $1 }
        
        if leftChildIndex < endIndex && sortFunction(elements[leftChildIndex], elements[temp]) {
            temp = leftChildIndex
        }
        
        if rightChildIndex < endIndex && sortFunction(elements[rightChildIndex], elements[temp]) {
            temp = rightChildIndex
        }
        
        if temp == index { return }
        
        elements.swapAt(index, temp)
        diveDown(elements: &elements, from: temp, until: endIndex)
    }
    
    /// Quick Sort
    /// O(N*logN)
    /// 정렬되어 있는 elements라면 O(N^2)
    public static func quickSort<Element: Comparable>(elements: [Element]) -> [Element] {
        var elements = elements
        
        quickSort(elements: &elements, first: 0, last: elements.count-1)
        
        return elements
    }
    
    private static func quickSort<Element: Comparable>(elements: inout [Element], first: Int, last: Int) {
        if first < last {
            let pivot = partition(elements: &elements, first: first, last: last)
            
            quickSort(elements: &elements, first: first, last: pivot)
            quickSort(elements: &elements, first: pivot+1, last: last)
        }
    }
    
    private static func partition<Element: Comparable>(elements: inout [Element], first: Int, last: Int) -> Int {
        let pivot = elements[first]
        var i = first - 1
        var j = last + 1
        
        while true {
            repeat { i += 1 } while elements[i] < pivot
            repeat { j -= 1 } while elements[j] > pivot
            
            if i < j {
                elements.swapAt(i, j)
            } else {
                return j
            }
        }
    }
    
    /// Merge Sort
    /// O(N*logN)
    public static func mergeSort<Element: Comparable>(elements: [Element]) -> [Element] {
        var elements = elements
        mergeSort(elements: &elements, left: 0, right: elements.count-1)
        return elements
    }
    
    private static func mergeSort<Element: Comparable>(elements: inout [Element], left: Int, right: Int) {
        if left < right {
            let mid = (left + right) / 2
            mergeSort(elements: &elements, left: left, right: mid)
            mergeSort(elements: &elements, left: mid+1, right: right)
            merge(elements: &elements, leftFirst: left, leftLast: mid, rightFirst: mid+1, rightLast: right)
        }
    }
    
    private static func merge<Element: Comparable>(elements: inout [Element], leftFirst: Int, leftLast: Int, rightFirst: Int, rightLast: Int) {
        var leftFirst = leftFirst
        var rightFirst = rightFirst
        var temp = [Element]()
        let saveFirst = leftFirst
        
        while (leftFirst <= leftLast) && (rightFirst <= rightLast) {
            if elements[leftFirst] < elements[rightFirst] {
                temp.append(elements[leftFirst])
                leftFirst += 1
            } else {
                temp.append(elements[rightFirst])
                rightFirst += 1
            }
        }
        
        if leftFirst <= leftLast {
            temp.append(contentsOf: elements[leftFirst...leftLast])
        }
        
        if rightFirst <= rightLast {
            temp.append(contentsOf: elements[rightFirst...rightLast])
        }
        
        for i in saveFirst...rightLast {
            elements[i] = temp[i-saveFirst]
        }
    }
    
    /// Radix Sort
    /// O(총자릿수 * N)
    /// 메모리 공간 많이 사용
    public static func radixSort(elements: [Int]) -> [Int] {
        var elements = elements
        let radix = 10 // 0~9 까지 총 10개의 자릿수를 의미
        var isFinished = false
        var digit = 1   // 자릿수
        
        while !isFinished {
            isFinished = true
            var buckets = Array(repeating: [Int](), count: radix)
            
            for num in elements {
                let index = num / digit  // 해당 자릿수의 숫자를 의미
                buckets[index % radix].append(num) // 버킷에 추가
                if isFinished && index > 0 {
                    isFinished = false
                }
            }
            
            
            var i = 0
            // 해당 자릿수를 기준으로 정렬
            for j in 0..<radix {
                let bucket = buckets[j]
                for num in bucket {
                    elements[i] = num
                    i += 1
                }
            }
            
            digit *= 10
        }
        
        return elements
    }
}
