//
//  File.swift
//  
//
//  Created by aksh gaur on 13/08/24.
//

import PassKit

class ProvisioningHelper: NSObject {
    
    private var passLibrary = PKPassLibrary()
    
    func getRemoteSecureElementPasses() -> [PKSecureElementPass] {
        return passLibrary.remoteSecureElementPasses
    }
    
    func passExists(provisioningCredentialIdentifier: String) -> Bool {
        var exists = false
        
        let passes = getPasses(of: .secureElement)
        
        if passes.isEmpty { return false }
        
        exists = passes.contains {
            let sePass = $0 as! PKSecureElementPass
            return sePass.primaryAccountIdentifier.dropFirst(7) == provisioningCredentialIdentifier
        }
        
        return exists
    }
    
    func getPass(provisioningCredentialIdentifier: String) -> PKPass? {
        let passes = getPasses(of: .secureElement)
        if passExists(provisioningCredentialIdentifier: provisioningCredentialIdentifier) {
            return passes.first{($0.paymentPass?.primaryAccountIdentifier.dropFirst(7))! == provisioningCredentialIdentifier}
        }
        return nil
    }
    
    func getPasses(of passType: PKPassType) -> [PKPass] {
        if !PKPassLibrary.isPassLibraryAvailable() { return [] }
        
        let passesOfType = PKPassLibrary().passes(of: passType)
        
        if passesOfType.isEmpty { return [] }
        
        return passesOfType
    }
}
