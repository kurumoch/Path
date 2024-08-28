//
//  PathRepresentable.swift
//  Path
//
//  Created by Denis Pavlov on 28.07.2024.
//

import Foundation
import UIKit

struct PathRepresentableContext {
    
    var wrapping: Node
    
    func append(_ path: any Path) {
        let node = Node(parent: wrapping, path: path.composed)
        wrapping.addChild(at: 0, child: node)
        node.build()
        node.screen = wrapping.screen
        wrapping.updateScreen()
    }
}

protocol PathRepresentable: Path, PrimitivePath where Self.Body == Never {
    
    associatedtype VCType: UIViewController
    associatedtype Coordinator = Void
    
    func make(context: PathRepresentableContext) -> VCType
    
    func update(vc: VCType)
    
    func makeCoordinator() -> Coordinator
}

extension PathRepresentable where Coordinator == Void {
    func makeCoordinator() -> Coordinator {
        ()
    }
}

extension PathRepresentable {
    func append(to parent: Node) {
        let node = Node(parent: parent, path: self)
        let context = PathRepresentableContext(wrapping: node)
        node.screen = RepresentableScreen { make(context: context) }
        parent.addChild(at: 0, child: node)
    }
}

private class RepresentableScreen: Screen {
    internal init(factory: @escaping () -> UIViewController) {
        self.factory = factory
    }
    
    let factory: () -> UIViewController
    
    override func vc() -> UIViewController {
        factory()
    }
}
