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
        wrapping.invalidate()
    }
}

protocol PathRepresentable: Path, PrimitivePath where Self.Body == Never {
    
    associatedtype VCType: UIViewController
    associatedtype Coordinator = Void
    
    func make(context: PathRepresentableContext) -> VCType
    
    func update(vc: VCType)
}

extension PathRepresentable {
    func append(to parent: Node) {
        var screen: RepresentableScreen?
        let node = Node(parent: parent, path: self)
        let context = PathRepresentableContext(wrapping: node)
        screen = RepresentableScreen { make(context: context) }
        
        node.screen = screen
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
    
    override func update() {
        guard let vc = children.first?.viewController else { return }
        viewController.present(vc, animated: true)
    }
}
