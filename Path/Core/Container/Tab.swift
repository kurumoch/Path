//
//  Tab.swift
//  Path
//
//  Created by Denis Pavlov on 28.07.2024.
//

import Foundation
import UIKit
import Observation

struct Tab: PathRepresentable {
    
    var selected = 0
    
    func make() -> UITabBarController {
        UITabBarController()
    }
    
    func update(vc: UITabBarController) {
        vc.selectedIndex = selected
    }
}
