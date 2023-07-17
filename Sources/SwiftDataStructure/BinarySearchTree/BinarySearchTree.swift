//
//  File.swift
//  
//
//  Created by sejin on 2023/07/17.
//

import Foundation

fileprivate class TreeNode<T: Comparable> {
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
        guard let root = self.root else {
            self.root = TreeNode(data: item)
            return
        }
        
        var currentNode = root
        
        while true {
            if currentNode.data > item {
                guard let nextNode = currentNode.left else {
                    currentNode.left = TreeNode(data: item)
                    return
                }
                currentNode = nextNode
            } else {
                guard let nextNode = currentNode.right else {
                    currentNode.right = TreeNode(data: item)
                    return
                }
                currentNode = nextNode
            }
        }
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


