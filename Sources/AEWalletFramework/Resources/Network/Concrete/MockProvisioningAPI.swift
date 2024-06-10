//
//  MockProvisioningAPI.swift
//  aria-mobile
//
//  Created by Kyle Wiltshire on 4/7/22.
//

import Foundation
import UIKit

public class MockProvisioningAPI: ProvisioningAPI {
    func preparePassProvisioning(_ context: ProvisioningContext, withCompletion completion: @escaping (ProvisionAPIResponse) -> Void) {
        let provisioningInfo = ProvisioningInformation(provisioningCredentialIdentifier: "30227789-db21-4828-b10b-dc22340c0488",
                                                       sharingInstanceIdentifier: "0f226392-a9aa-425a-ae9b-6bfd747e41d6",
                                                       cardTemplateIdentifier: "76f7c6ce-e88b-4ae6-ab79-85d5bb326658")
        
        let credential = ProvisioningCredential(provisioningInformation: provisioningInfo)
        completion(ProvisionAPIResponse(credential: credential))
    }
}
