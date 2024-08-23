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

}
