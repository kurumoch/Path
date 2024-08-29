//
//  Root.swift
//  Path
//
//  Created by Denis Pavlov on 28.07.2024.
//

import Foundation
import UIKit
import SwiftUI

final class Root {
    
    private let window: UIWindow
    private let path: GenericPath
    private var root: Node
    private lazy var screen = buildScreenHierachy(root)
    private lazy var map = [ObjectIdentifier: Screen]()
    
    init(window: UIWindow, @PathBuilder path: () -> any Path) {
        self.window = window
        self.path = path().composed
        self.root = Node(parent: nil, path: self.path, environment: .init(presentationContext: { }))
        
        root.invalidationHandler = { [weak self] in self?.nodeDidInvalidate($0) }
        self.path.append(to: root)
    }
    
    func build() {
        showRootScreen()
    }
    
    func update() {
        path.update(node: root)
    }
    
    func nodeDidInvalidate(_ node: Node) {
        screen = buildScreenHierachy(root)
        node.environment.presentationContext()
    }
    
    private func buildScreenHierachy(_ node: Node) -> Screen? {
        guard let screen = node.screen else {
            for child in node.children {
                if let childScreenTree = buildScreenHierachy(child) {
                    return childScreenTree
                }
            }
            return nil
        }
        var i = 0
        for child in node.children {
            if let childScreenTree = buildScreenHierachy(child) {
                screen.addSubscreen(childScreenTree, at: i)
                i += 1
            }
        }
        
        return screen
    }
    
    private func showRootScreen() {
        guard let rootViewController = screen?.vc() else { return }
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
