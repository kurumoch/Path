//
//  SwiftUIPath.swift
//  Path
//
//  Created by Denis Pavlov on 29.08.2024.
//

import Foundation
import SwiftUI

struct SwiftUIPath<Input, Output, ViewContent: View, PathContent: Path>: PathRepresentable {
    
    var input: Input
    @ViewBuilder var content: (Input, @escaping (Output) -> ()) -> ViewContent
    @PathBuilder var output: (Output) -> PathContent
    
    func make(context: PathRepresentableContext) -> UIViewController {
        UIHostingController(rootView: content(input, { context.append(output($0)) }))
    }
    
    func update(vc: UIViewController) {
        
    }
}
