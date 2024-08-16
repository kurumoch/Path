//
//  PrimitivePath.swift
//  Path
//
//  Created by Denis Pavlov on 28.07.2024.
//

import Foundation

protocol PrimitivePath: Path, GenericPath {}

extension Never: PrimitivePath {
    func append(to parent: Node) {}
    func update(node: Node) {}
}

extension PrimitivePath where Body == Never {
    var body: Never { fatalError() }

    func append(to parent: Node) {
        parent.appendChild(child: Node(parent: parent, path: self))
    }
    
    func update(node: Node) {
        node.updateChild(at: 0, with: self)
    }
}
