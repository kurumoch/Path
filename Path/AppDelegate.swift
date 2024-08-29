//
//  AppDelegate.swift
//  Path
//
//  Created by Denis Pavlov on 27.07.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var root: Root?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow()
        self.window = window
//        window.makeKeyAndVisible()
        
        root = Root(window: window) {
            Tab {
                Stack {
                    MainPath {
                        MainPath {
                            EmptyPath()
                        }
                    }
                }
                
                MainPath()
            }
        }
        
        root?.build()
        
        // Override point for customization after application launch.
        return true
    }
}

