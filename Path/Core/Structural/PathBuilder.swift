//
//  PathBuilder.swift
//  Path
//
//  Created by Denis Pavlov on 28.07.2024.
//

import Foundation

@resultBuilder
class PathBuilder {
    public static func buildBlock() -> EmptyPath { EmptyPath() }

    public static func buildBlock<Content: Path>(_ content: Content) -> Content { content }

    public static func buildIf<P: Path>(_ content: P) -> P  { content }

    public static func buildEither<TrueContent: Path, FalseContent: Path>(first: TrueContent) -> ConditionalPath<TrueContent, FalseContent> {
        ConditionalPath(content: .a(first))
    }

    public static func buildEither<TrueContent: Path, FalseContent: Path>(second: FalseContent) -> ConditionalPath<TrueContent, FalseContent> {
        ConditionalPath(content: .b(second))
    }
}

@resultBuilder
class PathBlockBuilder: PathBuilder {
    static func buildBlock<each P: Path>(_ components: repeat each P) -> TuplePath<repeat each P> where repeat each P: Path {
        TuplePath<repeat each P>(content: (repeat each components))
    }
}
