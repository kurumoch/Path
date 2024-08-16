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
 
        TabNode {
            MainNode { action in
                switch action {
                    case .details(let info):
                        DetailsNode(info)
                            .presentationStyle(.interactive(info.sourceView))
                    case .newProduct:
                        NewProductNode { productType in
                            switch productType {
                                // ...
                            }
                        }.presentationStyle(.modal)
                }
            }.icon("Main")
 
            PaymentsNode { paymentType in
                switch paymentType:
                    case .c2c:
                        C2CNode { info in
                            C2CPaymentNode { success in
                                success
                                    ? C2CSuccessNode { navigator.popToRoot() }
                                    : C2CFailureNode { navigator.pop() }
                            }
                        }
                    case .phoneTransfer:
                        PhoneTransferNode()
                    // ...
            }
 
            AboutNode()
                .icon("About")
            
        }
    }
 }
 
 
 */
protocol Path {
    
    associatedtype Body: Path
    
    var body: Body { get }
}
