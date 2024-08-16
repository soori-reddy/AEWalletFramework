// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SwiftUI
import PassKit

public struct AEWalletFramework{
    
    var provisioningCoordinator: AccessProvisioningCoordinator
    public var provisioningContext: ProvisioningContext
    var watchDetector: AppleWatchDetector
    
    
    public init(prasentingVC: PresentingViewController, context:ProvisioningContext?, accessToken:String, accessTokenExpiration:Double) {
        watchDetector = AppleWatchDetector()
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
    
    public func listRemoteSecureElementPasses() -> [PKPass]{
        let provisionnningHelper = ProvisioningHelper()
        let remotePasses = provisionnningHelper.getRemoteSecureElementPasses();
        return remotePasses
    }
    
    public func listDeviceSecureElementPasses() -> [PKPass]{
        let provisionnningHelper = ProvisioningHelper()
        let devicePasses = provisionnningHelper.getPasses(of: .secureElement)
        return devicePasses
    }
    
    public func isWatchPaired() -> Bool{
        watchDetector.detect()
        return watchDetector.watchPaired
    }
    
}
