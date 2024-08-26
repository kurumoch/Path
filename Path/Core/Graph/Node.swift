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
    private var coordinator: Any?
    private var _screen: Screen?
    var screen: Screen? {
        get { _screen ?? children.first { $0.screen != nil }?.screen }
        set { _screen = newValue }
    }
    
    init(parent: Node?, path: GenericPath) {
        self.parent = parent
        self.path = path
    }
    
    func build() {
        coordinator = path.makePayload()
        path.append(to: self)
        
        children.compactMap { $0.screen }.enumerated().forEach {
            _screen?.addSubscreen($0.element, at: $0.offset)
        }
    }
    
    func addChild(at index: Int, child: Node) {
        child.invalidationHandler = invalidationHandler
        children.insert(child, at: index)
    }
    
    func remove(at index: Int) {
        children.remove(at: index)
    }
    
    func updateChild(at index: Int, with path: GenericPath) {
        if index < children.count {
            path.update(node: children[index])
        }
    }
    
    // Обновление для вызова update в screen
    func updateScreen() {
        screen?.viewController = (screen?.vc())!
    }
}
