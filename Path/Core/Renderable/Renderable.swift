//
//  Renderable.swift
//  Path
//
//  Created by Denis Pavlov on 28.07.2024.
//

import Foundation
import UIKit

protocol Renderable {
    func vc() -> UIViewController
}

extension Renderable where Self: PathRepresentable {
    func vc() -> UIViewController {
        make()
    }
}
