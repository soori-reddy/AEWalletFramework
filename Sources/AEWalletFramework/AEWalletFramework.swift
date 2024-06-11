// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SwiftUI

public struct AEWalletFramework{
    
    public var provisioningCoordinator = AccessProvisioningCoordinator()
    public var provisioningContext: ProvisioningContext
    
    public init(context:ProvisioningContext, accessToken:String, accessTokenExpiration:Double) {
        let settingsManager = SettingsManager.shared()
        settingsManager.setAccessToken(authToken: accessToken)
        settingsManager.setServerURL(serverURL: "/partner/v1/prepareProvisioning")
//        settingsManager.setServerPort(serverPort: String(serverConfig!.port))
        settingsManager.setAccessTokenExpiration(accessTokenExpiration: accessTokenExpiration)
        provisioningContext = context
    }
    
    public func doSomeWork(){
        print("Doing some work..")
        provisioningCoordinator.addToWallet(provisioningContext)
    }
}
