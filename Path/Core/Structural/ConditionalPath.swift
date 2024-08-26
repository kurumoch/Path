//
//  ConditionalPath.swift
//  Path
//
//  Created by Denis Pavlov on 28.07.2024.
//

import Foundation

struct ConditionalPath<TrueContent: Path, FalseContent: Path>: PrimitivePath, GenericPath {
    
    enum ConditionalContent {
        case a(TrueContent)
        case b(FalseContent)
    }
    
    let content: ConditionalContent
    
    func append(to parent: Node) {
        switch content {
        case .a(let trueContent):
            let child = Node(
                parent: parent,
                path: trueContent.composed
            )
            parent.addChild(at: 0, child: child)
        case .b(let falseContent):
            let child = Node(
                parent: parent,
                path: falseContent.composed
            )
            parent.addChild(at: 0, child: child)
        }
    }
    
    func update(node: Node) {
        switch content {
        case .a(let trueContent):
            node.updateChild(at: 0, with: trueContent.composed)
        case .b(let falseContent):
            node.updateChild(at: 0, with: falseContent.composed)
        }
    }
}
