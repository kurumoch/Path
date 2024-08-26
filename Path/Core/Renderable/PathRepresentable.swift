//
//  PathRepresentable.swift
//  Path
//
//  Created by Denis Pavlov on 28.07.2024.
//

import Foundation
import UIKit

protocol PathRepresentable: Path, PrimitivePath where Self.Body == Never {
    
    associatedtype VCType: UIViewController
    associatedtype Coordinator = Void
    
    func make() -> VCType
    
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
        node.screen = RepresentableScreen { make() }
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
