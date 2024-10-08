//
//  GenericPath.swift
//  Path
//
//  Created by Denis Pavlov on 28.07.2024.
//

import Foundation

protocol GenericPath {
    func append(to parent: Node)
    func update(node: Node)
}
