//
//  Tab.swift
//  Path
//
//  Created by Denis Pavlov on 28.07.2024.
//

import Foundation
import UIKit
import Observation

struct Tab<Content: Path>: PrimitivePath {
    
    @PathBlockBuilder var content: () -> Content
    
    func append(to parent: Node) {
        let screen = TabScreen()
        let node = Node(
            parent: parent,
            path: content().composed,
            environment: nil
        )
        node.screen = screen
        parent.addChild(at: 0, child: node)
        node.build()
    }
    
    func update(node: Node) {
        
    }
    
    private class TabScreen: Screen {
        
        override func vc() -> UITabBarController {
            let tabBarController = UITabBarController(nibName: nil, bundle: nil)
            tabBarController.viewControllers = viewControllers
            return tabBarController
        }
        
        var viewControllers: [UIViewController] {
            children.map(\.viewController)
        }
        
        override func update() {
            (viewController as? UITabBarController)?.viewControllers = viewControllers
        }
    }
}
