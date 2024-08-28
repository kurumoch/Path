//
//  Path.swift
//  Path
//
//  Created by Denis Pavlov on 28.07.2024.
//

import Foundation

/*
 
 struct MainPath: Path {
 
    @Navigator var navigator
 
    var body: some Path {
 
        Tab {
            Main { action in
                switch action {
                    case .details(let info):
                        Details(info)
                            .presentationStyle(.interactive(info.sourceView))
                    case .newProduct:
                        NewProduct { productType in
                            switch productType {
                                // ...
                            }
                        }.presentationStyle(.modal)
                }
            }.icon("Main")
 
            Payments { paymentType in
                switch paymentType:
                    case .c2c:
                        C2C { info in
                            C2CPayment { success in
                                success
                                    ? C2CSuccess { navigator.popToRoot() }
                                    : C2CFailure { navigator.pop() }
                            }
                        }
                    case .phoneTransfer:
                        PhoneTransfer()
                    // ...
            }
 
            About()
                .icon("About")
        }
    }
 }
 
 
 */
protocol Path {
    
    associatedtype Body: Path
    
    var body: Body { get }
}
