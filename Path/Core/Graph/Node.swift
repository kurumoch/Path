//
//  Node.swift
//  Path
//
//  Created by Denis Pavlov on 28.07.2024.
//

import Foundation

final class Node {
    
    private let parent: Node?
    private var children: [Node] = []
    var invalidationHandler: ((Node) -> ())?
    let path: GenericPath
    let renderable: Renderable?
    private var coordinator: Any?
    
    init(
        parent: Node?,
        path: GenericPath,
        renderable: Renderable? = nil
    ) {
        self.parent = parent
        self.path = path
        self.renderable = renderable
    }
    
    func build() {
        coordinator = path.makePayload()
        if let parent {
            path.append(to: parent)
        }
        
    }
    
    func addChild(at index: Int, child: Node) {
        child.invalidationHandler = invalidationHandler
        children.insert(child, at: index)
    }
    
    func appendChild(child: Node) {
        child.invalidationHandler = invalidationHandler
        children.append(child)
    }
    
    func remove(at index: Int) {
        children.remove(at: index)
    }
    
    func updateChild(at index: Int, with path: GenericPath) {
        build()
        if index < children.count {
            path.update(node: children[index])
        }
    }
}
