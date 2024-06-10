//
//  ApolloNetwork.swift
//  aria-mobile
//
//  Created by Troy Cochran on 8/7/23.
//

import Foundation
//import Apollo

//class ApolloNetwork {
//    static var shared = ApolloNetwork()
//    
//    private(set) lazy var apollo: ApolloClient = {
//        var myUrl = "https://www.test.com"
//        if(SettingsManager.shared().getServerURL() != nil) {
//            myUrl =  "https://\(SettingsManager.shared().getServerURL()!):\(SettingsManager.shared().getServerPort()!)/api/graphql"
//        }
//        
//        let client = URLSessionClient()
//        let cache = InMemoryNormalizedCache()
//        let store = ApolloStore(cache: cache)
//        let provider = NetworkInterceptorProvider(client: client, store: store)
//        let url = URL(string: myUrl)!
//        let transport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)
//        
//        return ApolloClient(networkTransport: transport, store: store)
//    }()
//    
//    static func resetSharedInstance() {
//        shared = ApolloNetwork();
//    }
//}
