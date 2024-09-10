This is a proof of concept for declarative navigation using resultBuilders. Each `Path` object can represent either a SwiftUI `View`, a UIKit `UIViewController`, or a nested `Path`.

```swift
struct MainPath: Path {
 
    @Navigator var navigator
    var externalFlow: any Path
 
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
            
            Stack {
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
            }
 
            About()
                .icon("About")

            externalFlow
                .icon("More")
        }
    }
}
```

As you can see, some paths can return values, which can be used as inputs to initiate another flow. This approach simplifies navigation, making it easier to understand.

# Todo

- Implement `.icon` modifier
- Implement `navigator` object
- Implement `.presentationStyle` modifier (including custom styles)
- Support deeplinking
