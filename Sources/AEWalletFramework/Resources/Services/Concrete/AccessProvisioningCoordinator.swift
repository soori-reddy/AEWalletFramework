//
//  AccessProvisioningService.swift
//  aria-mobile
//
//  Created by Kyle Wiltshire on 4/7/22.
//

import Foundation
import PassKit
import SwiftUI

class AccessProvisioningCoordinator: NSObject, ProvisioningManager {
    private var provisioningAPI: ProvisioningAPI
    private var presentingViewController: PresentingViewController
    
    private var passConfig: PKAddShareablePassConfiguration?
//    private var provisioningContext: ProvisioningContext?
    private var provisioningHelper: ProvisioningHelper
    
    
    var canAddSecureElementPass: Bool {
        return PKAddPassesViewController.canAddPasses()
    }
    
    init(presentingVC: PresentingViewController) {
        self.provisioningAPI          = AccessProvisioningAPI()
        self.provisioningHelper = ProvisioningHelper()
        self.presentingViewController = presentingVC
    }
    
    func addToWallet(_ context: ProvisioningContext) {
        provisioningHelper.provisioningContext = context
        
        provisioningAPI.preparePassProvisioning(context) { apiResponse in
            //            self.presentingViewController.spinnerView.startAnimating()
            
            guard let credential = apiResponse.credential else {
                // TODO: Handle nil credentials
                
                if apiResponse.error != nil {
                    //                    self.presentingViewController.showAlert(title: "Error", message: apiResponse.error != nil ? apiResponse.error! : "Error fetching Credential from Server", actionTitle: "OK")
                    //                    self.presentingViewController.spinnerView.stopAnimating()
                }
                return;
            }
            
            if (self.passExists(provisioningCredentialIdentifier: credential.provisioningInformation.provisioningCredentialIdentifier)) {
                // TODO: Have this class return an error rather than present
                //                self.presentingViewController.showAlert(title: "Error", message: "Pass already provisioned in Wallet", actionTitle: "OK")
                return
            }
            
            self.provisioningHelper.initiateWalletProvisioning(with: credential) { result in
                switch result {
                case .success(let config):
                    guard let vc = self.createSEViewController(for: config) else { return }
                    //            self.presentingViewController.spinnerView.stopAnimating()
                    DispatchQueue.main.async {
                        self.presentingViewController.present(vc, animated: true)
                    }
                case .failure(let failure):
//                    completion(.failure(failure))
                    print("failure")
                }
            }
        }
    }

}

extension AccessProvisioningCoordinator {
    
    private func createSEViewController(for passConfig: PKAddShareablePassConfiguration) -> PKAddSecureElementPassViewController? {
        let canAddSePass = provisioningHelper.canAddSePass(for: passConfig)
        guard canAddSePass else {
            print("intiateWalletProvisioning:: Unable to add an SE Pass with specified configuration")
            return nil
        }
        
        guard let vc = PKAddSecureElementPassViewController(configuration: passConfig, delegate: self) else {
            print("intiateWalletProvisioning:: Unable to create an SE Pass VC with specified configuration")
            return nil
        }
        
        return vc
    }
    
    private func passExists(provisioningCredentialIdentifier: String) -> Bool {
        var exists = false
        
        let passes = getPasses(of: .secureElement)
        
        if passes.isEmpty { return false }
        
        exists = passes.contains {
            let sePass = $0 as! PKSecureElementPass
            return sePass.primaryAccountIdentifier.dropFirst(7) == provisioningCredentialIdentifier
        }
        
        return exists
    }
    
    private func getPasses(of passType: PKPassType) -> [PKPass] {
        if !PKPassLibrary.isPassLibraryAvailable() { return [] }
        
        let passesOfType = PKPassLibrary().passes(of: passType)
        
        if passesOfType.isEmpty { return [] }
        
        return passesOfType
    }
    

}


extension AccessProvisioningCoordinator: PKAddSecureElementPassViewControllerDelegate {
    func addSecureElementPassViewController(_ controller: PKAddSecureElementPassViewController, didFinishAddingSecureElementPasses passes: [PKSecureElementPass]?, error: Error?) {
        // TODO: Handle specific error cases
        if let error = error as? PKAddSecureElementPassError {
            print(error.localizedDescription)
        }
        
//        print("Pass add Success")
        
        passConfig          = nil
        provisioningHelper.provisioningContext = nil
        
        presentingViewController.dismiss(animated: true)
    }
}
