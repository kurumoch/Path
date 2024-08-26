//
//  TuplePath.swift
//  Path
//
//  Created by Denis Pavlov on 28.07.2024.
//

import Foundation

struct TuplePath<each P: Path>: PrimitivePath, GenericPath {
    let content: (repeat each P)
    
    func append(to parent: Node) {
        
        var idx = 0

        func append<P0: Path>(path: P0) {
            let child = Node(
                parent: parent,
                path: path.composed
            )
            child.build()
            parent.addChild(at: idx, child: child)
            idx += 1
        }
        
        repeat append(path: each content)
    }
    
    func update(node: Node) {
        var index = 0
        
        func update<P0: Path>(path: P0) {
            node.updateChild(at: index, with: path.composed)
            index += 1
        }
        
        repeat update(path: each content)
    }
}
