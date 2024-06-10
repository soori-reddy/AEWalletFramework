//
//  AuthorizationInterceptor.swift
//  aria-mobile
//
//  Created by Troy Cochran on 8/7/23.
//

import Foundation
//import Apollo
//import ApolloAPI
//
//class AuthorizationInterceptor: ApolloInterceptor {
//    var id: String
//    
//    init(id: String) {
//        self.id = id
//    }
//    
//    func interceptAsync<Operation>(
//        chain: RequestChain,
//        request: HTTPRequest<Operation>,
//        response: HTTPResponse<Operation>?,
//        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
//    ) where Operation : GraphQLOperation {
//        var token = ""
//        if(SettingsManager.shared().getAccessToken() != nil) {
//            token = SettingsManager.shared().getAccessToken()!
//        }
//        request.addHeader(name: "Authorization", value: "Bearer \(token)")
//        chain.proceedAsync(request: request, response: response, completion: completion)
//    }
//    
//}
