// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SwiftUI

public struct AEWalletFramework{

    public var provisioningCoordinator = AccessProvisioningCoordinator()
    public var authToken: ProvisioningContext?
    public func doSomeWork(){
        print("Doing some work..")
        provisioningCoordinator.addToWallet(authToken!)
    }
}
