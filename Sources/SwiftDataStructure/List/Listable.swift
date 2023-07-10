//
//  File.swift
//  
//
//  Created by sejin on 2023/07/10.
//

import Foundation

public protocol Listable {
    associatedtype Element
    var count: Int { get }
    func contains(_ item: Element) -> Bool
    mutating func insert(_ item: Element)
    mutating func remove(_ item: Element)
    mutating func reset()
}
