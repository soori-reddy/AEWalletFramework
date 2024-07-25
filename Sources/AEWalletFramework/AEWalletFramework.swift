// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SwiftUI
import PassKit

public struct AEWalletFramework{
    
    public var provisioningCoordinator = AccessProvisioningCoordinator()
    public var provisioningContext: ProvisioningContext
    
    public init(context:ProvisioningContext?, accessToken:String, accessTokenExpiration:Double) {
        let settingsManager = SettingsManager.shared()
        settingsManager.setAccessToken(authToken: accessToken)
        settingsManager.setServerURL(serverURL: "nfcqalocal.alertenterprise.com")
//        settingsManager.setServerPort(serverPort: String(serverConfig!.port))
        settingsManager.setAccessTokenExpiration(accessTokenExpiration: accessTokenExpiration)
        let context = ProvisioningContext(product: "hospitality", credentialType: "hospitality" + "-credential-type", cardTemplateIdentifier: "1234", passDefinitionIdentifier: nil)
        provisioningContext = context
    }
    
    public func doSomeWork(completion:@escaping (Result<PKAddShareablePassConfiguration,Error>)-> Void){
        print("Doing some work..")
//        provisioningCoordinator.addToWallet(provisioningContext)
        provisioningCoordinator.addToWallet(provisioningContext) { result in
            switch result {
            case .success(let success):
                completion(.success(success))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}
