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
    var path: GenericPath {
        didSet { update() }
    }
    
    private var root: Node?
    
    private var invalidated: [Node] = []
    
    init(window: UIWindow, @PathBuilder path: () -> any Path) {
        self.window = window
        self.path = path().composed
        
        update()
    }
    
    func update() {
        if root == nil {
            root = Node(parent: nil, path: path)
            root?.invalidationHandler = { [weak self] in self?.invalidated.append($0) }
            path.append(to: root!)
            path.update(node: root!)
        }
        
        window.rootViewController = root?.renderable?.vc()
    }
}
