//
//  MockCardTemplateAPI.swift
//  aria-mobile
//
//  Created by Kyle Wiltshire on 8/14/22.
//

import Foundation

//public class MockAppConfigAPI: AppConfigAPI {
//    func fetchAppConfig(withCompletion completion: @escaping (AppConfigResponse) -> Void) {
//        let json = """
//{
//    "cardTemplates": [
//        {
//            "product": "corporate",
//            "templates": [
//                {
//                    "templateName": "Apple Badge",
//                    "templateIdentifier": "12312-123123-12312"
//                },
//                {
//                    "templateName": "Wiltech, Inc",
//                    "templateIdentifier": "0912909101-12312-1-12"
//                }
//            ]
//        },
//        {
//            "product": "hospitality",
//            "templates": [
//                {
//                    "templateName": "Kyle Hotels",
//                    "templateIdentifier": "0912909101-12312-1-12"
//                }
//            ]
//        },
//        {
//            "product": "university",
//            "templates": [
//                {
//                    "templateName": "Apple University",
//                    "templateIdentifier": "12312-123123-12312"
//                }
//            ]
//        },
//        {
//            "product": "multifamilyhome",
//            "templates": [
//                {
//                    "templateName": "Kyle Condominiums",
//                    "templateIdentifier": "12312-123123-12312"
//                },
//                {
//                    "templateName": "Infinite Loop Greens",
//                    "templateIdentifier": "0912909101-12312-1-12"
//                },
//                {
//                    "templateName": "Apple Park Place",
//                    "templateIdentifier": "0912909101-12312-1-12"
//                }
//            ]
//        }
//    ]
//}
//"""
//        let cardTemplatesData = Data(json.utf8)
//        let jsonDecoder = JSONDecoder()
//        if let decodeCardTemplates = try? jsonDecoder.decode(AppConfigResponse.self, from: cardTemplatesData) {
//            return completion(decodeCardTemplates)
//            
//        }
//        
//        print("Error decoding Card Templates")
//    }
//}
