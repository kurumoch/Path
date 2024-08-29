//
//  Node.swift
//  Path
//
//  Created by Denis Pavlov on 28.07.2024.
//

import Foundation

final class Node {

    let parent: Node?
    var children: [Node] = []
    let path: GenericPath
    let environment: Environment?
    
    var invalidationHandler: (Node) -> ()
    
    var screen: Screen?

    init(
        parent: Node?,
        path: GenericPath,
        environment: Environment?
    ) {
        self.parent = parent
        self.path = path
        self.invalidationHandler = parent?.invalidationHandler ?? { _ in }
        self.environment = environment
    }
    
    convenience init(
        parent: Node,
        path: GenericPath
    ) {
        self.init(parent: parent, path: path, environment: parent.environment)
    }
    
    func build() {
        path.append(to: self)
    }
    
    func invalidate() {
        invalidationHandler(self)
    }
    
    func addChild(at index: Int, child: Node) {
        if index >= children.count {
            children.insert(child, at: index)
        } else {
            children[index] = child
        }
        
    }
    
    func remove(at index: Int) {
        children.remove(at: index)
    }
    
    func updateChild(at index: Int, with path: GenericPath) {
        if index < children.count {
            path.update(node: children[index])
        }
    }
}
