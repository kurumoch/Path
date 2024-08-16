//
//  EmptyPath.swift
//  Path
//
//  Created by Denis Pavlov on 28.07.2024.
//

import Foundation

struct EmptyPath: PrimitivePath, GenericPath {
    func append(to parent: Node) {}
    func update(node: Node) {}
}
