//
//  File.swift
//  
//
//  Created by sejin on 2023/07/17.
//

import Foundation

public class TreeNode<T: Comparable> {
    var data: T
    var left: TreeNode?
    var right: TreeNode?
    
    init(data: T, left: TreeNode? = nil, right: TreeNode? = nil) {
        self.data = data
        self.left = left
        self.right = right
    }
}

public struct BinarySearchTree<T: Comparable> {
    
    // MARK: - Properties
    
    private var root: TreeNode<T>?
    
    /// O(1)
    public var isEmpty: Bool {
        root == nil
    }
    
    /// O(N)
    public var count: Int {
        self.countNodes(node: root)
    }
    
    // MARK: - initialization
    
    public init() {}
    
    // MARK: - Methods
    
    /// O(N)
    private func countNodes(node: TreeNode<T>?) -> Int {
        guard let node = node else { return 0 }

        return countNodes(node: node.left) + countNodes(node: node.right) + 1
    }
    
    /// O(logN)
    public mutating func insert(_ item: T) {
        self.root = insert(from: root, item: item)
    }
    
    private mutating func insert(from node: TreeNode<T>?, item: T) -> TreeNode<T> {
        guard let node = node else {
            return TreeNode(data: item)
        }
        
        if item < node.data {
            node.left = insert(from: node.left, item: item)
        } else {
            node.right = insert(from: node.right, item: item)
        }
        
        return node
    }
    
    /// O(logN)
    public func contains(_ item: T) -> Bool {
        guard let root = self.root else { return false }
        
        var currentNode: TreeNode<T>? = root
        
        while let node = currentNode {
            if node.data == item {
                return true
            } else if node.data > item {
                currentNode = node.left
            } else {
                currentNode = node.right
            }
        }
        
        return false
    }
    
    /// O(logN)
    public mutating func remove(_ item: T) {
        self.root = remove(from: root, item: item)
    }
    
    private mutating func remove(from node: TreeNode<T>?, item: T) -> TreeNode<T>? {
        guard let node = node else { return nil }
        
        if item == node.data { // 지우려고 하는 노드를 찾았을 때
            // 3가지 경우의 수 존재
            
            // 1. 해당 노드의 child가 없는 경우 => 바로 삭제
            if node.left == nil && node.right == nil { return nil }
            
            // 2. 한 개의 child가 존재하는 경우 => 해당 child 노드로 지우는 노드를 대체
            if node.left == nil { return node.right }
            if node.right == nil { return node.left }
            
            // 3. 두 개의 child가 존재하는 경우 => 우측 subtree에서 가장 작은 노드와 지우는 노드를 대체
            node.data = findMinimumNode(from: node.right!).data
            node.right = remove(from: node.right, item: node.data)
        } else if item < node.data {
            node.left = remove(from: node.left, item: item)
        } else {
            node.right = remove(from: node.right, item: item)
        }
        
        return node
    }
    
    private func findMinimumNode(from node: TreeNode<T>) -> TreeNode<T> {
        guard let leftNode = node.left else { return node }
        
        return findMinimumNode(from: leftNode)
    }
}

// MARK: - Tree Traversal

public extension BinarySearchTree {
    /// O(N)
    func traverseInorder(visit: (T) -> Void) {
        self.inorder(node: self.root, visit: visit)
    }
    
    private func inorder(node: TreeNode<T>?, visit: (T) -> Void) {
        guard let node = node else { return }
        inorder(node: node.left, visit: visit)
        visit(node.data)
        inorder(node: node.right, visit: visit)
    }
    
    /// O(N)
    func traversePreorder(visit: (T) -> Void) {
        self.preorder(node: self.root, visit: visit)
    }
    
    private func preorder(node: TreeNode<T>?, visit: (T) -> Void) {
        guard let node = node else { return }
        visit(node.data)
        preorder(node: node.left, visit: visit)
        preorder(node: node.right, visit: visit)
    }
    
    /// O(N)
    func traversePostorder(visit: (T) -> Void) {
        self.postorder(node: self.root, visit: visit)
    }
    
    private func postorder(node: TreeNode<T>?, visit: (T) -> Void) {
        guard let node = node else { return }
        postorder(node: node.left, visit: visit)
        postorder(node: node.right, visit: visit)
        visit(node.data)
    }
}

// MARK: - CustomStringConvertible

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        guard let root = self.root else {
            return "Empty Tree"
        }
        return diagram(for: root)
    }
    
    private func diagram(for node: TreeNode<T>?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        
        if node.left == nil && node.right == nil {
            return root + "\(node.data)\n"
        }
        
        return diagram(for: node.right, top + " ", top + "┌──", top + "│ ")
        + root + "\(node.data)\n"
        + diagram(for: node.left, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}
