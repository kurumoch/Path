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
        let tabScreen = TabScreen()
        let node = Node(parent: parent, path: content().composed)
        node.screen = tabScreen
        parent.addChild(at: 0, child: node)
        node.build()
    }
    
    func update(node: Node) {
        
    }
    
    private class TabScreen: Screen {
        override func vc() -> UITabBarController {
            let tabBarController = UITabBarController(nibName: nil, bundle: nil)
            
            let tabControllers = children.map { childScreen in
                let navController = childScreen.vc()
                return navController
            }
            
            tabBarController.viewControllers = tabControllers
            return tabBarController
        }
    }
}
