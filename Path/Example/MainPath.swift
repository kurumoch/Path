//
//  MainPath.swift
//  Path
//
//  Created by Denis Pavlov on 28.07.2024.
//

import Foundation
import UIKit

struct MainPath: PathRepresentable {
    
    func make() -> MainViewController {
        let vc = MainViewController(nibName: nil, bundle: nil)
        return vc
    }
    
    func update(vc: MainViewController) {
        
    }
}

final class MainViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .red
        tabBarItem.title = "\(Int.random(in: 0 ..< 100))"
    }
}
