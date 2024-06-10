//
//  NetworkModels.swift
//  aria-mobile
//
//  Created by Kyle Wiltshire on 4/30/22.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol APIResource {
    var path: String { get }
}

extension APIResource {
    var url: URL {
        get {
            let settingsManager = SettingsManager.shared()
            let serverURL = settingsManager.getServerURL()
            let serverPort = settingsManager.getServerPort()
            
            var components = URLComponents(string: "https://\(serverURL!):\(serverPort!)/")!
            components.path = path
            return components.url!
        }
    }
}

protocol APIRequest {
    var method: HTTPMethod { get set }
    var url: URL { get set }
    var body: Data? { get set }
}

extension APIRequest {
    var urlRequest: URLRequest {
        let settingsManager = SettingsManager.shared()
        var authToken = settingsManager.getAccessToken()
        
        var urlRequest = URLRequest(url: url)
        
        if(authToken == nil) {
            authToken = ""
        }
        
        print("Auth token: \(authToken!)")
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue(UUID().uuidString,  forHTTPHeaderField: "x-requestId")
        urlRequest.addValue("Bearer \(authToken!)", forHTTPHeaderField: "authorization")
        
        switch method {
        case .get:
            urlRequest.httpMethod = method.rawValue
        case.post:
            urlRequest.httpMethod = method.rawValue
        }
        
        urlRequest.httpBody = body
        
        urlRequest.cachePolicy = .reloadIgnoringLocalCacheData
        
        return urlRequest
    }
}
