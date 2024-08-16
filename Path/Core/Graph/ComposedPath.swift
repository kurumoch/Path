//
//  ComposedPath.swift
//  Path
//
//  Created by Denis Pavlov on 28.07.2024.
//

import Foundation

struct ComposedPath<P: Path>: GenericPath {
    
    let path: P
    
    func append(to parent: Node) {
        parent.appendChild(child: Node(parent: parent, path: path.body.composed))
    }
    
    func update(node: Node) {
        node.updateChild(at: 0, with: path.body.composed)
    }
}

extension Path {
    var composed: GenericPath {
        if let primitivePath = self as? any PrimitivePath {
            return primitivePath
        }
        return ComposedPath(path: self)
    }
}
