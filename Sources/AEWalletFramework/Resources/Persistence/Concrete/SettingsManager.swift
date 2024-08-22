//
//  UserDefaultsConcrete.swift
//  aria-mobile
//
//  Created by Kyle Wiltshire on 8/10/22.
//

import Foundation

class SettingsManager {
    
    // Singleton for SettingsManager
    private static var sharedSettingsManager: SettingsManager = {
        let settingsManager = SettingsManager()
        
        return settingsManager
    }()
    
    class func shared() -> SettingsManager {
        return sharedSettingsManager
    }
    
    // Class Variables
    private let credentialTypeKeySuffix = "-credential-type"
    private let cardTemplateKeySuffix = "-cardTemplate-identifier"
    private let passPhotoKeySuffix = "pass-photo"
    private let authTokenSuffix = "-auth-token"
    private let authTokenExpirationSuffix = "-auth-token-expiration"
    private let serverUrlSuffix = "-serverUrl"
    private let serverPortSuffix = "-serverPort"
    
    private let defaults = UserDefaults.standard
    
    func setDefaultCredentialType(for product: String, credentialType: String) {
        print("Setting \(credentialType) credentialType as default for \(product)")
        defaults.setValue(credentialType, forKey: product + credentialTypeKeySuffix)
    }
    
    func getDefaultCredentialType(for product: String) -> String? {
        if let credentialType = defaults.string(forKey: product + credentialTypeKeySuffix) { return credentialType }
        print("No default credentialType found for \(product)")
        return nil
    }
    
    func setDefaultCardTemplateIdentifier(for product: String, cardTemplate: CardTemplate) {
        print("Setting cardTemplate: \(cardTemplate.templateName) as default for \(product)")
        
        let jsonData = try? JSONEncoder().encode(cardTemplate)
        
        if let data = jsonData {
            return defaults.setValue(data, forKey: product + cardTemplateKeySuffix)
        }
        
        print("Error encoding cardTemplate")
    }
    
    func getDefaultCardTemplateIdentifier(for product: String) -> CardTemplate? {
        if let data = defaults.data(forKey: product + cardTemplateKeySuffix) {
            if let cardTemplate = try? JSONDecoder().decode(CardTemplate.self, from: data) {
                return cardTemplate
            }
            
            print("Error decoding cardTemplate")
            return nil
        }
        
        print("No default Card Template found for \(product)")
        return nil
    }
    
//    func setPassPhotoOption(isEnabled: Bool) {
//        print("Setting enable pass photo to \(isEnabled)")
//        defaults.setValue(isEnabled, forKey: passPhotoKeySuffix)
//    }
    
//    func getPassPhotoOption() -> Bool {
//        return defaults.bool(forKey: passPhotoKeySuffix)
//    }
    
    func getAccessToken() -> String? {
        if let accessToken = defaults.string(forKey: authTokenSuffix) {
            return accessToken
        }
        print("No access token found")
        return nil
    }
    
    func setAccessToken(authToken: String) {
        print("Setting auth token")
        print(authToken)
        defaults.setValue(authToken, forKey: authTokenSuffix)
    }
    
    func getAccessTokenExpiration()-> Double? {
        let accessTokenExpiration = defaults.double(forKey: authTokenExpirationSuffix)
        
        if (accessTokenExpiration > 0) {
            return accessTokenExpiration
        }
        print("No access token expiration found")
        return nil
    }
    
    func setAccessTokenExpiration(accessTokenExpiration: Double) {
        print("Setting accessTokenExpiration")
        print(accessTokenExpiration)
        defaults.setValue(accessTokenExpiration, forKey: authTokenExpirationSuffix)
    }
    
    func getServerURL() -> String? {
        if let serverURL = defaults.string(forKey: serverUrlSuffix) {
            return serverURL
        }
        print("No server url found")
        return nil
    }
    
    func setServerURL(serverURL: String) {
        print("Setting server url")
        print(serverURL)
        defaults.setValue(serverURL, forKey: serverUrlSuffix)
    }
    
    func getServerPort() -> String? {
        if let serverPort = defaults.string(forKey: serverPortSuffix) {
            return serverPort
        }
        print("No server port found")
        return nil
    }
    
    func setServerPort(serverPort: String) {
        print("Setting server port")
        print(serverPort)
        defaults.setValue(serverPort, forKey: serverPortSuffix)
    }
}
