//
//  Screen.swift
//  Path
//
//  Created by Denis Pavlov on 02.08.2024.
//

import Foundation
import UIKit

final class Screen {
    private(set) var children: [Screen] = []
    private(set) var parent: Screen?
    
    private var index: Int = 0
    
    var window: UIWindow?
    var renderable: Renderable {
        fatalError()
    }
    
    private(set) lazy var viewController = renderable.vc()
    
    var root: Screen { parent?.root ?? self }
    
    func vc() -> UIViewController {
        UIViewController()
    }
    
    func addSubscreen(_ screen: Screen, at index: Int) {
        self.children.insert(screen, at: index)
        screen.parent = self
        screen.window = window
        
        for i in index ..< children.count {
            children[i].index = i
        }
    }

    func removeSubscreen(at index: Int) {
        children[index].window = nil
        children[index].parent = nil
        children.remove(at: index)
        children[index].viewController.dismiss(animated: true)
        for i in index ..< children.count {
            children[i].index = i
        }
    }
}
