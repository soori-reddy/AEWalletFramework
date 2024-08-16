// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SwiftUI
import PassKit

public struct AEWalletFramework{
    
    var provisioningCoordinator: AccessProvisioningCoordinator
    public var provisioningContext: ProvisioningContext
    
    public init(prasentingVC: PresentingViewController, context:ProvisioningContext?, accessToken:String, accessTokenExpiration:Double) {
        let settingsManager = SettingsManager.shared()
        settingsManager.setAccessToken(authToken: accessToken)
        settingsManager.setServerURL(serverURL: "nfcqalocal.alertenterprise.com")
//        settingsManager.setServerPort(serverPort: String(serverConfig!.port))
        settingsManager.setAccessTokenExpiration(accessTokenExpiration: accessTokenExpiration)
        provisioningCoordinator = AccessProvisioningCoordinator(presentingVC: prasentingVC)
        let context = ProvisioningContext(product: "hospitality", credentialType: "hospitality" + "-credential-type", cardTemplateIdentifier: "1234", passDefinitionIdentifier: nil)
        provisioningContext = context
    }
    
    public func startProvisioning(){
        print("Started AE provisionning")
        provisioningCoordinator.addToWallet(provisioningContext)
    }
    
    public func canAddPass(completion:@escaping (Result<Bool,Error>)->Void) {
        let provisionnningHelper = ProvisioningHelper()
        provisionnningHelper.canAddPass(provisioningContext) { result in
            switch result {
            case .success(let canAdd):
                completion(.success(canAdd))
            case .failure(let failure):
                completion(.failure(failure))
                print("failure")
            }
        }
    }
    
}
