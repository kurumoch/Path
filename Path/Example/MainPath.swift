//
//  MainPath.swift
//  Path
//
//  Created by Denis Pavlov on 28.07.2024.
//

import Foundation
import UIKit

struct MainPath<Content: Path>: PathRepresentable {
    
    @PathBuilder var onTap: () -> Content
    
    init(onTap: @escaping () -> Content) {
        self.onTap = onTap
    }
    
    func make(context: PathRepresentableContext) -> MainViewController {
        let vc = MainViewController(nibName: nil, bundle: nil)
        vc.onTap = { context.append(onTap()) }
        return vc
    }
    
    func update(vc: MainViewController) {
        
    }
}

extension MainPath where Content == EmptyPath {
    init() {
        self.onTap = { EmptyPath() }
    }
}

final class MainViewController: UIViewController {
    
    var onTap: () -> Void = {}
    
    override func loadView() {
        let b = UIButton(primaryAction: UIAction { [weak self] _ in self?.onTap() })
        b.configuration = .borderedTinted()
        b.titleLabel?.text = "1234"
        view = b
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .red
        tabBarItem.title = "\(Int.random(in: 0 ..< 100))"
        title = "\(Int.random(in: 0 ..< 100))"
    }
}
