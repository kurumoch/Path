//
//  Stack.swift
//  Path
//
//  Created by Denis Pavlov on 28.07.2024.
//

import Foundation
import UIKit

struct Stack<Content: Path>: PrimitivePath {
    
    @PathBuilder var content: () -> Content
    
    func append(to parent: Node) {
        let stackScreen = StackScreen()
        let node = Node(parent: parent, path: content().composed)
        node.screen = stackScreen
        parent.addChild(at: 0, child: node)
        node.build()
    }
    
    func update(node: Node) {
        
    }
    
    private class StackScreen: Screen {
        override func vc() -> UINavigationController {
            let navController = UINavigationController(nibName: nil, bundle: nil)
            
            let stackControllers = Array(sequence(state: children, next: { children in
                defer { children = children.first?.children ?? [] }
                return children.first?.vc()
            }))
            
            navController.viewControllers = stackControllers
            return navController
        }
    }
}
