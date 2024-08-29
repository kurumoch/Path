//
//  AppDelegate.swift
//  Path
//
//  Created by Denis Pavlov on 27.07.2024.
//

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var root: Root?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow()
        self.window = window
        
        root = Root(window: window) {
            Tab {
                Stack {
                    MainPath {
                        MainPath {
                            EmptyPath()
                        }
                    }
                }
                
                MainPath {
                    MainPath {
                        MainPath()
                    }
                }
                
                SwiftUIPath(input: 42) { num, out in
                    Button {
                        out(52)
                    } label: {
                        Text("Tap \(num)")
                    }
                } output: { num in
                    MainPath()
                }

                
                MainPath()
            }
        }
        
        root?.build()
        
        // Override point for customization after application launch.
        return true
    }
}

